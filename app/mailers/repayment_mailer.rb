class RepaymentMailer < ApplicationMailer
  default from: "codescholarships@email.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.scholarship_mailer.scholarship_confirmation.subject
  #
  def repayment_notification(user)
    @user = user

    mail to: user.email, subject: "Scholarship Confirmation"
  end
end
