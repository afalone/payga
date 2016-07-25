require 'multi_json'
module Payga
  class Request::Sber < Request

    def receipt
      Receipt::Sber
    end

    def pay
      url = File.join(self.system.base, 'register.do')
      uri = URI(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = self.system.base[0, 6] == 'https:'
      req = Net::HTTP::Post.new(uri.path)
      req.body = {userName: system.username, password: system.password, orderNumber: id.to_s, amount: (amount * 100).round, returnUrl: payga_ok_return_url, failUrl: payga_fail_return_url, description: description, language: 'en'}.to_query.tap{|x| p x }
      res = https.request(req)
      hash = MultiJson.load(res.body, symbolize_keys: true)
      update_attributes order: hash[:orderId], form_url: hash[:formUrl]
      rcpt = receipt.create error_message: hash.fetch(:errorMessage, ''), error_code: hash.fetch(:errorCode, 0), cmd: 'register'
      receipts << rcpt
    end

    def status
      url = File.join(self.system.base, 'getOrderStatus.do')
      uri = URI(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = self.system.base[0, 6] == 'https:'
      req = Net::HTTP::Post.new(uri.path)
      req.body = {userName: system.username, password: system.password, orderId: order}.to_query
      res = https.request(req)
      hash = MultiJson.load(res.body, symbolize_keys: true)
    end

  end
end
