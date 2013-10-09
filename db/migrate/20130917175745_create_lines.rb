class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :product_description
      t.string :unit
      t.float :unit_value
      t.float :quantity
      t.integer :vat_value
      t.float :line_total
      t.integer :invoice_id

      t.timestamps
    end
  end
end
