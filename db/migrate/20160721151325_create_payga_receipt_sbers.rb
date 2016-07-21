class CreatePaygaReceiptSbers < ActiveRecord::Migration
  def change
    create_table :payga_receipts do |t|
      t.references :payga_request, index: true, polymorphic: true
      t.string :order
      t.string :form_url
      t.string :error_code
      t.string :error_message
      t.text :json_params

      t.timestamps null: false
    end
    add_index :payga_receipts, :order
  end
end
