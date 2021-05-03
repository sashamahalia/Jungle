require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(name: 'Sasha', price: 8432, quantity: 8, category_id: 1)
    }
    it "is valid with name, price, quantity and category present" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Name can't be blank")
    end
    it "is not valid without a price"
    it "is not valid without a quantity"
    it "is not valid without a category"
  end
end
