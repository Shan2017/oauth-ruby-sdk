#!/usr/bin/ruby
#encoding: utf-8
puts "Content-type: text/html; charset=utf-8"
puts ""

require_relative '../service/interface_const'
require_relative '../common/http_helper'

class Authorize
  #---------------include---------------
  include MiInterFace
  #-------------------------------------

  receiveUrl = "#{MiConst.redirectUri}=#{AppConst.receiveUri}&"
  paramClientId = "#{MiConst.oauth_clientId}=#{AppConst.appId}&"
  paramType = "#{MiConst.responseType}=#{MiConst.token}&&#{MiConst.skipConfirm}=true"

  uriString = MiConst.uri_authorize + receiveUrl + paramClientId + paramType

  puts uriString
  puts Common::HttpHelper.exeHttps uriString
end



