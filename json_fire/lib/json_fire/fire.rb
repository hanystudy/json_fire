require 'net/http'
require 'json'

module JsonFire
  class Fire
    JSON_HEADERS = {"Content-Type" => "application/json", "Accept" => "application/json"}

    def initialize(url)
      @uri = URI.parse(url)
      @http = Net::HTTP.new(@uri.host, @uri.port)
    end

    def send(data)
      @http.post(@uri.path, data.to_json, JSON_HEADERS)
    end
  end
end
