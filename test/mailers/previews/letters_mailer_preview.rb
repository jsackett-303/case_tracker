# Preview all emails at http://localhost:3000/rails/mailers/letters_mailer
class LettersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/letters_mailer/welcome
  def welcome
    LettersMailer.welcome
  end

end
