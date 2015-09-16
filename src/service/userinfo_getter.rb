require 'json'
require_relative '../common/http_helper'
require_relative 'interface_const'
require_relative 'interface_utility'

module MiInterFace
  #********************用户信息接收对象********************
  class UserInfoGetter
    #===============include===============
    include MiInterFace
    #=====================================

    def initialize access_token, mac_key
      @access_token = access_token
      @mac_key = mac_key
    end

    def getUserInfo
      begin
        uriString = "#{MiConst.uri_profile}#{MiConst.api_clientId}=#{AppConst.appId}&#{MiConst.token}=#{@access_token}"
        header = InterfaceUtility.getHeader "/user/profile", @access_token, @mac_key
        jsonString = Common::HttpHelper.exeHttps uriString, header
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