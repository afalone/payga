require_dependency "payga/application_controller"

module Payga
  class ReturnController < ApplicationController
    def ok
      pay = Payga::Request.where(order: params[:id]).first
      unless pay
        render nothing: true, status: 404
        return
      end
      rcpt = pay.receipt.create cmd: 'accept', error_code: 0
      pay.receipts << rcpt
      render nothing: true, status: :ok
    end

    def fail
      pay = Payga::Request.where(order: params[:id]).first
      unless pay
        render nothing: true, status: 404
        return
      end
      rcpt = pay.receipt.create cmd: 'fail', error_code: 0
      pay.receipts << rcpt
      render nothing: true, status: :ok
    end
  end
end
