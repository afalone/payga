class MvOrderFormUrlToRequest < ActiveRecord::Migration
  def change
    add_column :payga_requests, :order, :string, index: true
    add_column :payga_requests, :form_url, :string
    remove_column :payga_receipts, :order, :string
    remove_column :payga_receipts, :form_url, :string
  end
end
