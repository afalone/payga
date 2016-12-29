require_dependency "payga/application_controller"

module Payga
  class ReturnController < ApplicationController
    def ok
      pay = Payga::Request.where(order: params[:orderId]).first
      unless pay
        render nothing: true, status: 404
        return
      end
      Rails.logger.info "[PAYGA] Payga success with #{params.inspect}"
      rcpt = pay.receipt.create cmd: 'accept', error_code: 0
      pay.receipts << rcpt
      pay.update_attributes state: 'accepted'
      pay.ping
      if pay.success_url
        redirect_to pay.success_url
      else
        render nothing: true, status: :ok
      end
    end

    def fail
      pay = Payga::Request.where(order: params[:orderId]).first
      unless pay
        render nothing: true, status: 404
        return
      end
      Rails.logger.info "[PAYGA] Payga failed with #{params.inspect}"
      rcpt = pay.receipt.create cmd: 'fail', error_code: 0
      pay.receipts << rcpt
      pay.update_attributes state: 'failed'
      pay.ping
      if pay.fail_url
        redirect_to pay.fail_url
      else
        render nothing: true, status: :ok
      end
    end
  end
end
