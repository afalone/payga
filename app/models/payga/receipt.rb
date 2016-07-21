module Payga
  class Receipt < ActiveRecord::Base
    belongs_to :request, foreign_key: :payga_request_id
    # def self.table_name_prefix
    #   'payga_receipt_'
    # end
  end
end
