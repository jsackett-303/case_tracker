class LettersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.letters_mailer.initial_appearance.subject
  #
  def call(letter, client)
    raise "Letter must be a template" unless letter.try(:template)
    raise "Client does not have an email address" unless client.try(:email)

    content = substitute_tokens(letter.content)
    @client = client
    @content = ERB.new(content).result(binding).html_safe

    Letter.transaction do
      Letter.create!(name: "#{letter.name}_#{client.id}",
                     content: @content, client_id: client.id,
                     to: client.email, from: letter.from,
                     template: false, sent: Time.now.utc, email: true)
      mail build_options(letter, client)
    end
  rescue
    Rails.logger.error $!
  end

  private

  def build_options(letter, client)
    options = { to: client.email, subject: subject(letter) }
    options = options.merge({ from: letter.from }) if letter.from
    options = options.merge({  bcc: letter.bcc }) if letter.bcc
    options = options.merge({   cc: letter.cc }) if letter.cc
    options
  end

  def subject(letter)
    letter.name.humanize
  end

  def substitute_tokens(content)
    LetterTokens.all.each do |k,v|
      content = content.gsub(k,v)
    end
    content
  end
end
