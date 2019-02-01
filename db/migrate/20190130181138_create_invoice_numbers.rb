class CreateInvoiceNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_numbers do |t|
      t.references :invoice_file
      t.string :data
      t.string :number_type

      t.timestamps
    end
  end
end
