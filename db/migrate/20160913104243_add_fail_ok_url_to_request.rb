class AddFailOkUrlToRequest < ActiveRecord::Migration
  def change
    add_column :payga_requests, :success_url, :string
    add_column :payga_requests, :fail_url, :string
  end
end
