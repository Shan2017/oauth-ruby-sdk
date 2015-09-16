require 'json'
require_relative '../common/http_helper'
require_relative 'interface_const'

module MiInterFace

  #********************登陆信息接收对象********************
  class OAuthGetter
    #===============include===============
    include MiInterFace
    #=====================================

    def getLoginJson code
      paramClientId = "#{MiConst.oauth_clientId}=#{AppConst.appId}&"
      receiveUrl = "#{MiConst.redirectUri}=#{AppConst.receiveUri}&"
      client_secret = "#{MiConst.clientSecret}=#{AppConst.appSecret}&"
      grant_type = "#{MiConst.grantType}=#{MiConst.authorizationCode}&"
      param_code = "#{MiConst.code}=#{code}&"
      encryptParam = MiConst.encryptParam

      uriString = MiConst.uri_token + paramClientId + receiveUrl + client_secret + grant_type + param_code + encryptParam

      begin
        jsonString = Common::HttpHelper.exeHttps uriString
        JSON.parse jsonString.sub MiConst.jsonSign, ""
      rescue Exception => ex
        puts ex.message
        puts ex.backtrace.inspect
      ensure
        # finally
        nil
      end
    end
  end
end