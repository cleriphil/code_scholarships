require "rails_helper"

RSpec.describe ScholarshipMailer, type: :mailer do
  describe "scholarship_confirmation" do
    let(:mail) { ScholarshipMailer.scholarship_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Scholarship confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
