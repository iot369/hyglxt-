<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>福地</title>
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
    function keyLogin(){  
        if (event.keyCode==13)   //回车键的键值为13   
            getdates();
        }  
    
     $(function() {
        document.getElementById("CardId").focus();
    });
    
    function getdates()
    {
        var Id=$("#CardId").val();
        $.ajax({
          url: "AjaxDate.aspx?Type=getuser&Id="+Id,
          type: "get",
          cache: false,
          success: function(date) {
          if(date=="false")
          {
              document.getElementById("txtMsg").innerHTML="读卡失败!";
              return;
          }
          if(date=="OutDate")
          {
              document.getElementById("txtMsg").innerHTML="会员卡过期!";
              return;
          }
          var sarry=new Array();
          sarry=date.toString().split('@');
          $("#CardId").val(sarry[0]);
          $("#Levels").val(sarry[1]);
          $("#UserName").val(sarry[2]);
          $("#mMoney").val(sarry[3]);
          $("#HidDiscount").val(sarry[5]);
          $("#HidJifen").val(sarry[6]);
          }
         })
    }
    function Clears()
    {
          $("#CardId").val('');
          $("#Levels").val('');
          $("#UserName").val('');
          $("#mMoney").val('');
          document.getElementById("txtMsg").innerHTML="";
    }
    function Pays()
    {
       if($("#CardId").val()=="")
       {
         document.getElementById("txtMsg").innerHTML="卡号不能为空!";
         return;
       }
       if($("#mMoney").val()< $("#PayMoney").val())
       {
         document.getElementById("txtMsg").innerHTML="余额不足!";
         return;
       }
       if($("#PayMoney").val() =="")
       {
         document.getElementById("txtMsg").innerHTML="支付金额不能为空!";
         return;
       }
       $.ajax({
          url: "AjaxDate.aspx?Type=getId&Id="+$("#CardId").val(),
          type: "get",
          cache: false,
          success: function(date) {
          window.location=encodeURI("Pay.aspx?CardId="+$("#CardId").val()+"&UserName="+$("#UserName").val()+"&Money="+$("#mMoney").val()+"&Discount="+$("#HidDiscount").val()+"&PayMoney="+$("#PayMoney").val()+"&XFId="+date+"&HidJifen="+ $("#HidJifen").val());
           }
       })
    }
    function Home()
    {
        window.location="Main.aspx";
    }
    
    </script>

</head>
<body onkeydown="keyLogin();">
    <input id="HidDiscount" type="hidden" runat="server" value="1" />
    <input id="HidJifen" type="hidden" runat="server" value="0" />
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
                        <input type="text" name="text-1" id="CardId" value="" onclick="Clears();" autofocus
                            placeholder="请输入会员卡号...">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="text-1">
                            会员姓名:</label>
                    </td>
                    <td>
                        <input type="text" name="text-1" id="UserName" value="" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="text-1">
                            会员级别:</label>
                    </td>
                    <td>
                        <input type="text" name="text-1" id="Levels" value="" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="text-1">
                            卡内余额:</label>
                    </td>
                    <td>
                        <input type="text" name="text-1" id="mMoney" value="" disabled="disabled">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="text-1">
                            支付金额:</label>
                    </td>
                    <td>
                        <input type="text" name="text-1" id="PayMoney" value="" autofocus placeholder="请输入支付金额...">
                    </td>
                </tr>
            </table>
            <div style="width: 100%">
                <span id="txtMsg" style="color: Red; margin-left: 10px;"></span>
            </div>
            <table style="width: 100%">
                <tr>
                    <td>
                        <a onclick="getdates();" data-role="button" data-inline="true">查 询 </a>
                    </td>
                    <td>
                        <a onclick="Clears();" data-role="button" data-inline="true">清 空 </a>
                    </td>
                    <td>
                        <a onclick="Pays();" data-role="button" data-inline="true">支 付 </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
