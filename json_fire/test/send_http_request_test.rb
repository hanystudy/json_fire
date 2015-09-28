require_relative "test_helper"
require "minitest/autorun"
require "json"

class TestFire < Minitest::Test

  class Fire
    def initialize(fire)
      @fire = fire
    end

    def send(data)
      json_headers = {"Content-Type" => "application/json", "Accept" => "application/json"}
      response = @fire.post(data, json_headers)
    end
  end

  def setup
    @fire_mock = Minitest::Mock.new
    @fire = Fire.new(@fire_mock)
  end

  def test_that_fire_can_send_post_request
    json = {test: 'test data'}.to_json
    @fire_mock.expect :post, nil, [json, {"Content-Type" => "application/json", "Accept" => "application/json"}]
    @fire.send(json)
    @fire_mock.verify()
  end
end
