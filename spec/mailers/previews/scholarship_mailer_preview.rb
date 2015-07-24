# Preview all emails at http://localhost:3000/rails/mailers/scholarship_mailer
class ScholarshipMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/scholarship_mailer/scholarship_confirmation
  def scholarship_confirmation
    ScholarshipMailer.scholarship_confirmation
  end

end
