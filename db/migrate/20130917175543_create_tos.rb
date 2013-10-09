class CreateTos < ActiveRecord::Migration
  def change
    create_table :tos do |t|
      t.string :name
      t.string :email
      t.text :more_info
      t.integer :invoice_id

      t.timestamps
    end
  end
end
