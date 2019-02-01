class InvoiceFilesController < ApplicationController
  def index
		@invoice_files = InvoiceFile.all
	end

	def new
		@invoice_file = InvoiceFile.new
	end

	def show
		invoice_file = InvoiceFile.find(params[:id])
		@invoice_numbers = invoice_file.invoice_numbers.page(params[:page])
	end

  def create
  	invoice_file = InvoiceFile.create(name: params['invoice_file']['name'].original_filename)
  	invoice_file = invoice_file.get_data(params['invoice_file']['name'].read)
  	
  	redirect_to invoice_files_path
  end
end
