module Payga
  class System < ActiveRecord::Base

    has_many :requests, foreign_key: :payga_system_id, table_name: 'payga_requests'

    def request
      Request::Sber
    end

    # def receipt
    #   Receipt::Sber
    # end
  end
end
