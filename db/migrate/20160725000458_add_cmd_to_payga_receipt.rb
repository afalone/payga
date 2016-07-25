class AddCmdToPaygaReceipt < ActiveRecord::Migration
  def change
    add_column :payga_receipts, :cmd, :string
  end
end
