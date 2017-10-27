# Preview all emails at http://localhost:3000/rails/mailers/letters_mailer
class LettersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/letters_mailer/initial_appearance
  def initial_appearance
    LettersMailer.initial_appearance
  end

end
