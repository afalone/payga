class CreatePaygaRequestSbers < ActiveRecord::Migration
  def change
    create_table :payga_requests do |t|
      t.references :payga_system, index: true, foreign_key: true
      t.string :type, index: true
      t.decimal :amount
      t.text :description
      t.string :lang
      t.string :page_view
      t.text :json_params

      t.timestamps null: false
    end
  end
end
