class CreateFroms < ActiveRecord::Migration
  def change
    create_table :froms do |t|
      t.string :name
      t.string :email
      t.text :more_info
      t.integer :invoice_id

      t.timestamps
    end
  end
end
