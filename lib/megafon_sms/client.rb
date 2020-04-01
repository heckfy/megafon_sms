# frozen_string_literal: true

require "base64"
require "faraday"
require "faraday_middleware"
require "json"

module MegafonSms
  class Client
    URL = "https://a2p-api.megalabs.ru/sms/v1/sms"

    attr_accessor :adapter
    attr_reader :connection, :response, :login, :password

    def initialize(login, password)
      @adapter = Faraday.default_adapter
      @login = login
      @password = password

      @connection = Faraday.new do |conn|
        conn.response :json, content_type: /\bjson$/
        conn.adapter adapter
      end
    end

    def send(from:, to:, message:, callback_url: nil, msg_id: nil)
      body = { from: from, to: to.to_i, message: message.to_s, callback_url: callback_url, msg_id: msg_id }.to_json
      @response = connection.post(URL, body, headers)
    rescue StandardError => e
      raise MegafonSms::Error, e
    end

    def success?
      response && response.status == 200 && response.body["result"]["status"]["code"] == 0
    end

    def failure?
      !success?
    end

    private

    def headers
      {
        "Content-Type" => "application/json",
        "Authorization" => "Basic #{Base64.encode64([login, password].join(":"))}"
      }
    end
  end
end
