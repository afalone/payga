module Payga
  class System < ActiveRecord::Base

    has_many :requests, foreign_key: :payga_system_id

    def request
      Request::Sber
    end

    def pay_for howmany, desc
      rq = request.create amount: howmany, description: desc
      requests << rq
      rq.pay
      [rq.order, rq.form_url, rq.error_code]
    end
    # mv order, form_url to Request from receipt

    # def receipt
    #   Receipt::Sber
    # end
  end
end
