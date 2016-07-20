require_dependency "payga/application_controller"

module Payga
  class MainController < ApplicationController
    def show
      redirect_to 'https://3dsec.sberbank.ru/payment/rest/getOrderStatusExtended.do'

    end
  end
end
