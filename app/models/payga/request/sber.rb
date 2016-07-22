require 'multi_json'
module Payga
  class Request::Sber < Request

    def receipt
      Receipt::Sber
    end

    def pay
      p self, self.system
      url = File.join(self.system.base, 'register.do')
      uri = URI(url)
      p uri
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = self.system.base[0, 6] == 'https:'
      req = Net::HTTP::Post.new(uri.path)
      req.body = {userName: system.username, password: system.password, orderNumber: id.to_s, amount: (amount * 100).round, returnUrl: 'http://localhost', description: description, language: 'en'}.to_query.tap{|x| p x }
      res = https.request(req)
      puts res.body
      hash = MultiJson.load(res.body, symbolize_keys: true)
      update_attributes order: hash[:orderId], form_url: hash[:formUrl]
      rcpt = receipt.create error_message: hash.fetch(:errorMessage, ''), error_code: hash.fetch(:errorCode, 0)
      receipts << rcpt

      
    end
  end
end
