module Payga
  class Request < ActiveRecord::Base
    belongs_to :system
    has_many :receipts, foreign_key: :payga_request_id

    def error_code
      receipts.last.try(:error_code)
    end

    # def self.table_name_prefix
    #   'payga_request_'
    # end
  end
end
