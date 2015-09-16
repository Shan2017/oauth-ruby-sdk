# 小米帐号开放平台OAuth ruby SDK使用说明

------
### 小米OAuth简介
http://dev.xiaomi.com/docs/passport/oauth2/

### 小米帐号开放平台文档
http://dev.xiaomi.com/docs/passport/user_guide/

### ruby SDK说明
ruby sdk由第三方开发者提供

####【common 工具类文件夹】
>* encrypt_helper.rb 加密工具类
>* http_helper.rb	http和https请求类

####【login 测试文件夹，测试用的】
>* authorize.rb ruby代码请求小米接口
>* MiLoginTest.html 页面js请求小米接口

####【service 文件夹】
>* interface_const.rb 接口常量
>* interface_utility.rb 构造接口参数的工具类
>* oauth_getter.rb oauth 验证获取类，得到oauth验证json对象
>* userinfo_getter.rb 用户接口调用类，得到用户信息json对象
>* login_service.rb 测试页面，app服务接收小米返回验证页面
