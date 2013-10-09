class AddToInvoicesSubtotalTotalvatTotal < ActiveRecord::Migration
  def change
  	add_column :invoices, :subtotal, :float
  	add_column :invoices, :total_vat, :float
  	add_column :invoices, :total, :float
  end
end
