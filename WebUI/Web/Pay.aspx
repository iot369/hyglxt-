<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pay.aspx.cs" Inherits="Pay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>POS支付系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/themes/default/jquery.mobile-1.3.2.min.css">
    <link rel="stylesheet" href="_assets/css/jqm-demos.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">

    <script src="js/jquery.js"></script>

    <script src="_assets/js/index.js"></script>

    <link href="css/index.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery.mobile-1.3.2.min.js"></script>

    <style type="text/css">
        #ToolBar
        {
            position: absolute;
            bottom: 0px;
            width: 100%;
            height: 58px;
            text-align: center;
            z-index: 2;
            overflow: hidden;
        }
    </style>

    <script>
    function Home()
    {
        window.location="Main.aspx";
    }
    function clears()
    {
       document.getElementById("txtMsg").innerHTML="";
    }
    $(function() {  
    checkId();
      $("#Text1").val((Number($("#PayMoney").val())*Number($("#getZK").val())).toFixed(2));
      $("#AllJifen").val(parseInt(Number($("#HidJifen").val())*Number($("#Text1").val())));
    });
        
    function postdates()
    {
        document.getElementById("txtMsg").innerHTML="正在支付请稍候...";
        var Id=$("#CardId").val();
        var pwd=$("#txtPwd").val();
        var money=$("#Text1").val();
        $.ajax({
          url: "AjaxDate.aspx?Type=postdate&Id="+Id+"&pwd="+pwd+"&money="+money+"&XFId="+$("#XFId").val()+"&AllJifen="+$("#AllJifen").val(),
          type: "get",
          cache: false,
          success: function(date) {
          if(date=="pwd")
          {
              document.getElementById("txtMsg").innerHTML="密码错误!";
              return;
          }
          if(date=="false")
          {
              document.getElementById("txtMsg").innerHTML="支付失败!";
              return;
          }
          if(date=="true")
          {
             window.location="MsgForm.aspx";
          }
          }
         })
    }
    function checkId()
    {
        $.ajax({
          url: "AjaxDate.aspx?Type=checkId&Id="+$("#XFId").val(),
          type: "get",
          cache: false,
          success: function(date) {
          if(date=="true")
          {
             window.location="ErrorForm.aspx";
          }
          }
         })
    }    
    </script>

</head>
<body>
    <input id="HidJifen" type="hidden" runat="server" />
    <input id="XFId" type="hidden" runat="server" />
    <input id="AllJifen" type="hidden" runat="server" />
    <div data-role="page" style="background-image: url('images/5-120601092508.jpg');
        overflow: hidden;">
        <div data-role="header" data-theme="b" data-tap-toggle="false" data-position="fixed"
            data-fullscreen="false" data-id="header">
            <a onclick="Home();" data-icon="home" class="ui-btn-left">主页</a>
            <h1 style="font-family: 微软雅黑;">
                POS支付系统</h1>
        </div>
        <div data-role="content" align="center">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <label for="text-1">
                            会员卡号:</label>
                    </td>
                    <td>
                        <input type="text" name="text-1" id="CardId" value="" disabled="disabled" runat="server">
                    </td>
                </tr>
                <tr>
                    <td>
                        支付金额:
                    </td>
                    <td>
                        <input type="text" name="text-1" id="PayMoney" value="" disabled="disabled" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        折扣系数:
                    </td>
                    <td>
                        <input type="text" name="text-1" id="getZK" value="" disabled="disabled" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        实付金额:
                    </td>
                    <td>
                        <input type="text" name="text-1" id="Text1" value="" disabled="disabled" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        支付密码:
                    </td>
                    <td>
                        <input type="password" name="text-1" id="txtPwd" value="" runat="server" onclick="clears();"
                            autofocus placeholder="请输入密码..." />
                    </td>
                </tr>
            </table>
            <div style="width: 100%">
                <span id="txtMsg" style="color: Red; margin-left: 10px;"></span>
            </div>
            <div style="width: 100%">
                <input id="Button1" type="button" value=" 确 定 支 付 " onclick="postdates();" /><input
                    id="Button2" type="button" value=" 取 消 支 付 " onclick="Home();" />
            </div>
        </div>
    </div>
</body>
</html>
