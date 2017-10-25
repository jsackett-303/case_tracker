class LettersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.letters_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "jsack777@gmail.com"
  end
end
