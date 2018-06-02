require "rails_helper"

RSpec.describe SignaturesMailer, type: :mailer do
  describe "new_request" do
    let(:mail) { SignaturesMailer.new_request }

    it "renders the headers" do
      expect(mail.subject).to eq("New request")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "completed" do
    let(:mail) { SignaturesMailer.completed }

    it "renders the headers" do
      expect(mail.subject).to eq("Completed")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
