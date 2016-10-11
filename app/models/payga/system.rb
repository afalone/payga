module Payga
  class System < ActiveRecord::Base

    has_many :requests, foreign_key: :payga_system_id

    def request
      Payga::Request::Sber
    end

    def pay_for howmany, desc, options = {}
      # callback_url = nil
      callback_url = options[:callback]
      success_url = options[:success]
      fail_url = options[:fail]
      rq = request.create amount: howmany, description: desc, callback_url: callback_url, success_url: success_url, fail_url: fail_url
      requests << rq
      rq.pay
      # rq.ping
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
