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
  end
end
