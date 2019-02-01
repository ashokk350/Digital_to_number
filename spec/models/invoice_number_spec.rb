require 'rails_helper'

RSpec.describe InvoiceNumber, type: :model do
  it { should belong_to(:invoice_file) }
end