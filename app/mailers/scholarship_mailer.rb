class ScholarshipMailer < ApplicationMailer
  default from: "codescholarships@email.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.scholarship_mailer.scholarship_confirmation.subject
  #
  def scholarship_confirmation(user)
    @greeting = "Hi"
    @user = user
    
    mail to: user.email, subject: "Scholarship Confirmation"
  end
end
