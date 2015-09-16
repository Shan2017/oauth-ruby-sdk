require 'net/http'
require 'net/https'
require 'open-uri'

module Common
  class HttpHelper
    def self.exeHttp uriString
      open uriString do |http|
        http.read
      end
    end

    def self.exeHttps uriString, headers = nil
      uri = URI.parse uriString
      Net::HTTP.start uri.host, uri.port, :use_ssl => uri.scheme == "https" do |http|
        request = Net::HTTP::Get.new uri.to_s, headers
        response = http.request request
        response.body
      end
    end
  end
end


