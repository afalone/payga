class AddCallbackUrlToRequest < ActiveRecord::Migration
  def change
    add_column :payga_requests, :callback_url, :string
  end
end
