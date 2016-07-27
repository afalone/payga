module Payga
  class System < ActiveRecord::Base

    has_many :requests, foreign_key: :payga_system_id

    def request
      Request::Sber
    end

    def pay_for howmany, desc, callback_url = nil
      rq = request.create amount: howmany, description: desc, callback_url: callback_url
      p rq
      requests << rq
      rq.pay
      rq.ping
      p rq
      [rq.id, rq.form_url, rq.error_code]
    end

    def status order
      rq = request.find(order)
      rq.state
    end

    def status_for order
      rq = request.find(order)
      rq.status
    end
  end
end
