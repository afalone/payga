module Payga
  class Receipt::Sber < ActiveRecord::Base
    belongs_to :request
  end
end
