require 'rails_helper'

RSpec.describe InvoiceFile, type: :model do
  it { should have_many(:invoice_numbers) }

  before(:all) do 
    @invoice_file = FactoryGirl.create(:invoice_file)
  end

  describe '#get_data' do
    it 'it save invoce numbers' do
      file_path = Rails.root.join('spec', 'fixtures', 'input_file.txt')
      input_file = fixture_file_upload(file_path)
      input_file = input_file.read
      result = @invoice_file.get_data(input_file)
      expect(result).to eq(input_file.split("\n\n"))
    end
  end
end