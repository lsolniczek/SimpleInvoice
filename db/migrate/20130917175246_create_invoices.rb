class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :date_issued
      t.date :payment_due
      t.text :description
      t.text :payment_description

      t.timestamps
    end
  end
end
