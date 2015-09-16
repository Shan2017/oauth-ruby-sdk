#!/usr/bin/ruby
#encoding: utf-8
puts "Content-type: text/html; charset=utf-8"
puts ""

##################################################
#
# 【登陆服务】
#
#=================================================
#
#   接收小米服务返回信息
#     调用小米接口 ->
#     获取访问令牌 ->
#     获取小米账号信息
# 【返回数据】
#     账号信息（json格式数据）
#
##################################################

require 'cgi'
require 'json'
require_relative 'oauth_getter'
require_relative 'userinfo_getter'

#********************登陆并返回json结果信息********************
class LoginService
  #===============include===============
  include MiInterFace
  #=====================================
  cgi = CGI.new
  code = cgi["code"].to_s

  begin
    #---------------获取登陆OAuth验证 Token json对象---------------
    jsonLogin = OAuthGetter.new.getLoginJson code
    access_token = jsonLogin["access_token"].to_s
    mac_key = jsonLogin["mac_key"].to_s

    #---------------获取UserInfo json对象---------------
    userInfo = UserInfoGetter.new access_token, mac_key
    jsonUserInfo = userInfo.getUserInfo

    #-----根据接收到得userInfo对象构造json返回对象-----
    userId = jsonUserInfo["data"]["userId"].to_s
    nick = jsonUserInfo["data"]["miliaoNick"]
    sex = jsonUserInfo["data"]["sex"]
    birthday = jsonUserInfo["data"]["birthday"]
    result = jsonUserInfo["result"] == "ok" ? "Success" : "Failed"

    finalJson =
        {
            userId: userId, #用户Id
            miliaoNick: nick, #米聊昵称/姓名
            sex: sex, #性别
            birthday: birthday, #生日
            result: result, #结果Sucess, Failed
            message: "" #信息，Success为空，Error错误信息
        }.to_json

    puts finalJson
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.inspect
  ensure
    # finally
    nil
  end
end
