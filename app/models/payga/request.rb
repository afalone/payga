module Payga
  class Request < ActiveRecord::Base
    belongs_to :system, foreign_key: :payga_system_id
    has_many :receipts, foreign_key: :payga_request_id

    def error_code
      p receipts.last
      receipts.last.try(:error_code)
    end
  end
end
