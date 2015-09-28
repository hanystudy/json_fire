require 'json'
require 'json_fire/fire'

module JsonFire
  class JsonFire
    class << self
      def send(url, json_file_path)
        json_data = read_json(json_file_path)
        send_json(url, json_data)
      end

      def read_json(json_file_path)
        file = File.new(json_file_path)
        json_data = file.read
        file.close
        JSON.parse(json_data)
      end

      def send_json(url, json_data)
        fire = Fire.new(url)
        response = fire.send(json_data)
      end
    end
  end
end
