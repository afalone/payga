class CreatePaygaSystems < ActiveRecord::Migration
  def change
    create_table :payga_systems do |t|
      t.boolean :default
      t.string :base
      t.string :username
      t.string :password
      t.text :pathes
      t.string :merchant

      t.timestamps null: false
    end
    add_index :payga_systems, :default
    add_index :payga_systems, :merchant
  end
end
