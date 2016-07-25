class AddStateToPaygaRequest < ActiveRecord::Migration
  def change
    add_column :payga_requests, :state, :string
    add_index :payga_requests, :state
  end
end
