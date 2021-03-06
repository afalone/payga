module Payga
  class Request < ActiveRecord::Base
    belongs_to :system, foreign_key: :payga_system_id
    has_many :receipts, foreign_key: :payga_request_id

    def error_code
      receipts.last.try(:error_code)
    end

    def ping
      url = callback_url
      uri = URI(url)
      https = Net::HTTP.new(uri.host, uri.port)
      # https.use_ssl = self.system.base[0, 6] == 'https:'
      req = Net::HTTP::Post.new(uri.path)
      req.body = {id: id, status: state}.to_query
      begin
        res = https.request(req)
      rescue Exception => e
        Rails.logger.info e.to_s
      end
      # hash = MultiJson.load(res.body, symbolize_keys: true)
    end

  end
end
