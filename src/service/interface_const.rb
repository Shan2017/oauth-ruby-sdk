module MiInterFace
  #********************小米接口常量********************
  class MiConst
    @jsonSign = "&&&START&&&"
    @oauth_Uri = "https://account.xiaomi.com"
    @api_Uri = "https://open.account.xiaomi.com"
    @hostURI = "open.account.xiaomi.com"
    @oauth_clientId = "client_id"
    @api_clientId = "clientId"
    @redirectUri = "redirect_uri"
    @responseType = "response_type"
    @scope = "scope"
    @state = "state"
    @skipConfirm = "skip_confirm"
    @authorization = "Authorization"
    @clientSecret = "client_secret"
    @refreshToken = "refresh_token"
    @grantType = "grant_type"
    @authorizationCode = "authorization_code"
    @code = "code"
    @token = "token"
    @encryptParam = "token_type=mac&mac_key=haiii&mac_algorithm=HmacSha1"

    @uri_authorize = @oauth_Uri + "/oauth2/authorize?"      # 请求用户授权接口
    @uri_token = @oauth_Uri + "/oauth2/token?"              # 获取访问令牌接口
    @uri_profile = @api_Uri + "/user/profile?"              # 获取用户名片
    @uri_relation = @api_Uri + "/user/relation?"            # 获取用户的关系列表
    @uri_openid = @api_Uri + "/user/openid?"                # 获取用户OpenId

    class << self
      attr_reader :jsonSign
      attr_reader :oauth_Uri
      attr_reader :api_Uri
      attr_reader :hostURI
      attr_reader :oauth_clientId
      attr_reader :api_clientId
      attr_reader :redirectUri
      attr_reader :responseType
      attr_reader :scope
      attr_reader :state
      attr_reader :skipConfirm
      attr_reader :authorization
      attr_reader :clientSecret
      attr_reader :refreshToken
      attr_reader :grantType
      attr_reader :authorizationCode
      attr_reader :code
      attr_reader :token
      attr_reader :encryptParam

      attr_reader :uri_authorize
      attr_reader :uri_token
      attr_reader :uri_profile
      attr_reader :uri_relation
      attr_reader :uri_openid
    end
  end

  class AppConst
    @appId = "xxxxxxxxxxxxxxxxxxxxx"        # 开发者appId
    @receiveUri = "xxxxxxxxxxxxxxxxxxxxx"   # 接收小米返回信息服务器uri
    @appSecret = "xxxxxxxxxxxxxxxxxxxxx"    # 开发者appSecret

    class << self
      attr_reader :appId
      attr_reader :receiveUri
      attr_reader :appSecret
    end
  end
end
