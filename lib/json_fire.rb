require 'json'
require 'json_fire/fire'
require 'json_fire/oauth_sign'

module JsonFire
  class JsonFire
    class << self
      def send(url, json_file_path, host_setting)
        json_data = read_json(json_file_path)
        send_json(url, json_data, host_setting)
      end

      def read_json(json_file_path)
        file = File.new(json_file_path)
        json_data = file.read
        file.close
        JSON.parse(json_data)
      end

      def send_json(url, json_data, host_setting)
        fire = Fire.new(url)
        fire = fire.extend(OAuthSign).with(host_setting[:consumer_key], host_setting[:consumer_secret]) unless host_setting[:consumer_key].to_s.empty? && host_setting[:consumer_secret].to_s.empty?
        response = fire.send(json_data)
      end
    end
  end
end
