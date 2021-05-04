require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(name: 'bob hunter', email: 'hunterxhunter@gmail.com', password: 'okcomputer', password_confirmation: 'okcomputer')
    }
    it "is valid with first name, last name, email, password and confirmation password present and passwords match" do
      expect(subject).to be_valid
      expect(subject.password).to eql(subject.password_confirmation)
    end
    it "is not valid when passwords don't match" do
      subject.password_confirmation = "okblah"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end
    it "is not valid when passwords don't match" do
      subject.password_confirmation = "okblah"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end
  end
end
