require 'rails_helper'

RSpec.describe InvoiceFilesController, type: :controller do
  before(:all) do
    @invoice_file = FactoryGirl.create(:invoice_file)
    FactoryGirl.create(:invoice_number, invoice_file: @invoice_file)
  end

  describe '#index' do
    it 'show all invoice files' do
      get 'index'
      expect(response).to render_template('index')
      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it 'show all invoice numbers' do
      get 'show', params: { id: @invoice_file.id }
      expect(response).to render_template('show')
      expect(response).to have_http_status(:success)
    end
  end

  describe '#new' do
    it 'initialize invoice file object' do
      get 'new'
      expect(response).to render_template('new')
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it 'create invoice file' do
      file_path = Rails.root.join('spec', 'fixtures', 'input_file.txt')
      input_file = fixture_file_upload(file_path)
      post 'create', params: { invoice_file: { name: input_file } }
      response.should redirect_to invoice_files_path
    end
  end
end