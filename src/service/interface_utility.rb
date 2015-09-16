require 'cgi'
require_relative '../common/encrypt_helper'
require_relative 'interface_const'

module MiInterFace
  #********************接口工具类********************
  class InterfaceUtility
    #===============include===============
    include MiInterFace
    #=====================================

    def self.getNonce
      now = Time.now
      startTime = Time.local(1970, 1, 1, 8, 0, 0)
      num = (now.to_i - startTime.to_i) / 60 + 60
      timeResult = num.to_s
      randNum = Random.new.rand 9999999999999999
      randNum.to_s + ":" + timeResult
    end

    def self.getHeader uri, access_token, mac_key
      nonce = getNonce
      orgMac = "#{nonce}\nGET\n#{MiConst.hostURI}\n#{uri}\n#{MiConst.api_clientId}=#{AppConst.appId}&#{MiConst.token}=#{access_token}\n"
      encryptMac = Common::EncryptHelper.encrypt mac_key, orgMac
      { "Authorization" => "MAC access_token=\"#{CGI.escape(access_token)}\",nonce=\"#{CGI.escape(nonce)}\",mac=\"#{CGI.escape(encryptMac)}\"" }
    end
  end
end
