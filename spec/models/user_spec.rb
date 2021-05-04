require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(first_name: 'bob', last_name: 'hunter', email: 'hunterxhunter@gmail.com', password: 'okcomputer', password_confirmation: 'okcomputer')
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
    it "is not valid when password confirmation isn't included" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password confirmation can't be blank")
    end
    it "is not valid when email isn't unique" do
      same_email_user = User.new(first_name: 'billy', last_name: 'woods', email: 'hunterxhunter@gmail.com', password: 'fruitcake', password_confirmation: 'fruitcake')
      same_email_user.save!
      subject.email = 'HunterxHunter@gmail.com'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Email has already been taken")
    end
    it "is not valid when password is less than three characters" do
      subject.password = "ii"
      subject.password_confirmation = "ii"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to include("Password is too short")
    end
  end
end
