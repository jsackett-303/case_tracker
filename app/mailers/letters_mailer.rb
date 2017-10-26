class LettersMailer < ApplicationMailer

  LETTER_TOKENS = {
    'DATE_TODAY'                => '<%= Date.today %>',
    'CLIENT_FIRST_NAME'         => '<%= @client.first_name %>',
    'CLIENT_LAST_NAME'          => '<%= @client.last_name %>',
    'CLIENT_INITIAL_APPEARANCE' => '<%= @client.initial_appearance %>',
  }

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.letters_mailer.welcome.subject
  #
  def welcome(letter, client)
    raise "Letter must be a template" unless letter.template

    content = substitute_tokens(letter.content)
    @client = client
    @greeting = ERB.new(content).result(binding).html_safe

    options = { to: client.email }
    options = options.merge({ from: letter.from }) if letter.from
    options = options.merge({  bcc: letter.bcc }) if letter.bcc
    options = options.merge({   cc: letter.cc }) if letter.cc
    email = mail(options).deliver

    # save a copy
    if email
      Letter.create!(name: "#{letter.name}_#{client.id}",
                     content: @greeting, client_id: client.id,
                     to: client.email, from: letter.from,
                     template: false, sent: Time.now.utc, email: true)
    end

    email
  end

  private

  def substitute_tokens(content)
    LETTER_TOKENS.each do |k,v|
      content = content.gsub(k,v)
    end
    content
  end
end
