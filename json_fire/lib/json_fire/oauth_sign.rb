require 'oauth'

module JsonFire
  module OAuthSign
    def with(consumer_key, consumer_secret)
      @consumer_key = consumer_key
      @consumer_secret = consumer_secret
      self
    end

    def send(data)
      consumer = OAuth::Consumer.new(@consumer_key, @consumer_secret)
      consumer.request(:post, @uri.to_s, nil, {}, data.to_json, { 'Content-Type' => 'application/json' })
    end
  end
end
