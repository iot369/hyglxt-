<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>POS支付系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/themes/default/jquery.mobile-1.3.2.min.css">
    <link rel="stylesheet" href="_assets/css/jqm-demos.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">

    <script type="text/javascript" src="js/jquery.js"></script>

    <script type="text/javascript" src="_assets/js/index.js"></script>

    <link href="css/index.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery.mobile-1.3.2.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div data-role="header" data-theme="b" data-tap-toggle="false" data-position="fixed"
        data-fullscreen="false" data-id="header">
        <h1 style="font-family: 微软雅黑;">
            登陆</h1>
    </div>
    <div style="height: 110px; width: 100%; background-image: url('images/perbg.gif');">
        <div style="width: 60px; height: 60px; position: absolute; top: 70px; left: 20px;
            background-image: url('images/ptou.png');">
        </div>
        <div style="width: 200px; height: 20px; position: absolute; top: 80px; left: 90px;
            font-family: 微软雅黑; font-size: 15px;">
        </div>
        <div style="width: 200px; height: 20px; position: absolute; top: 105px; left: 90px;
            font-family: 微软雅黑; font-size: 15px; font-weight: bold; color: #008000;">
        </div>
    </div>
    <div data-role="content" style="font-family: 微软雅黑;">
        <div style="background-color: #FFF; border: 1px solid #CCC; -webkit-border-radius: 10px;
            border-radius: 10px; padding: 10px;">
            <input name="forward" type="hidden" id="forward" value="">
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="line-height: 40px;">
                    <td style="border-bottom: 1px solid #DDD;" height="40" width="60">
                        <strong style="font-family: 微软雅黑;">账户：</strong>
                    </td>
                    <td style="border-bottom: 1px solid #DDD;">
                        <input name="username" id="username" style="font-family: 微软雅黑;" type="text" value=""
                            placeholder="用户名" onclick="clearss();" />
                    </td>
                </tr>
                <tr style="line-height: 40px;">
                    <td height="40" width="60">
                        <strong style="font-family: 微软雅黑;">密码：</strong>
                    </td>
                    <td>
                        <input name="password" id="password" style="font-family: 微软雅黑;" type="password" value=""
                            autofocus placeholder="密码" onclick="clearss();" /></span>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="ui-grid-a">
            <input id="Button1" type="button" name="submit" onclick="loging();" value=" 登 录 "
                runat="server" data-role="none" style="font-family: 微软雅黑; width: 98%; display: block;
                text-align: center; color: #fff; height: 38px; line-height: 30px; font-size: 16px;
                font-weight: bold; border-radius: 4px; -webkit-border-radius: 4px; border: 1px #FF5500 solid;
                background: -webkit-gradient(linear, center bottom, center top, from(#ff5500), to(#ff5500));
                cursor: pointer;" />
        </div>
        <div style="font-size: 12px; color: Red; margin-top: 10px; text-align: center;">
            <span id="notic"></span>
        </div>
    </div>

    <script type="text/javascript">
     function clearss()
    {
      document.getElementById("notic").innerHTML="";
    }
        function loging()
        {
        var num = $("#username").val();
        var pssw = $("#password").val();
        if(num=="")
        {
            $("#notic").html("请输入账号和密码！");
        }
        else{
            $.ajax({
                    url: "Ajaxlogin.aspx?username="+num+"&password="+pssw+"",
                    type: "get",
                    cache: false,
                    success: function(date) {
                    if(date=="false")
                    {
                        $("#notic").html("请输入正确的密码或账号！");
                    }
                    else if(date=="true")
                    {
                        window.location="Main.aspx"; 
                    }
                    }
                    
                })
                }
        }
        
       function request(paras){
        var url = location.href;
          var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");
            var paraObj = {}
              for (i=0; j=paraString[i]; i++){ 
               paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);
                 }  
                 
                 var returnValue = paraObj[paras.toLowerCase()];
                   if(typeof(returnValue)=="undefined"){  return "";  }
                   else{  return returnValue; }
                   }
    </script>

    </form>
</body>
</html>
