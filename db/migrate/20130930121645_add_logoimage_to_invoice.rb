class AddLogoimageToInvoice < ActiveRecord::Migration
  def change
  	add_column :invoices, :image_file_name,    :string
    add_column :invoices, :image_content_type, :string
    add_column :invoices, :image_file_size,    :integer
    add_column :invoices, :image_updated_at,   :datetime
  end
end
