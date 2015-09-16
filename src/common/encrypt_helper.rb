require 'base64'
require 'openssl'

module Common
  class EncryptHelper
    @@encryptType = 'sha1'

    def initialize key, orgString
      @key = key
      @orgString = orgString
    end

    def self.encrypt key, orgString
      encryptString = OpenSSL::HMAC.digest(@@encryptType, key, orgString)
      return Base64.encode64(encryptString).chomp
    end
  end
end