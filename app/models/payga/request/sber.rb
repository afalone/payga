require 'multi_json'
module Payga
  class Request::Sber < Request
    include Payga::Engine.routes.url_helpers
    # include Rails.application.routes.url_helpers

    def receipt
      Receipt::Sber
    end

    def pay
      cb_uri = URI(callback_url) if callback_url
      hst, prt = cb_uri.host, cb_uri.port if cb_uri
      hst ||= false
      prt ||= 80
      url = File.join(self.system.base, 'register.do')
      uri = URI(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = self.system.base[0, 6] == 'https:'
      req = Net::HTTP::Post.new(uri.path)
      req.body = {userName: system.username, password: system.password, orderNumber: id.to_s, amount: (amount * 100).round, returnUrl: ok_return_index_url(host: hst, port: prt), failUrl: fail_return_index_url(host: hst, port: prt), description: description, language: 'en'}.to_query
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
