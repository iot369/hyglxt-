<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MsgForm.aspx.cs" Inherits="MsgForm" %>

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
        
    function postdates()
    {
       window.location="Main.aspx";
    }    
    </script>

</head>
<body>
    <input id="HidJifen" type="hidden" runat="server" />
    <div data-role="page" style="background-image: url('images/5-120601092508.jpg');
        overflow: hidden;">
        <div data-role="header" data-theme="b" data-tap-toggle="false" data-position="fixed"
            data-fullscreen="false" data-id="header">
            <a onclick="Home();" data-icon="home" class="ui-btn-left">主页</a>
            <h1 style="font-family: 微软雅黑;">
                POS支付系统</h1>
        </div>
        <div data-role="content" align="center">
            <div style="width: 100%; margin-top: 20%;">
                <span id="txtMsg" style="color: Black; font-weight: bold; font-size: 16px; margin-left: 10px;">
                    支付成功！</span>
            </div>
            <div style="width: 100%">
                <input id="Button1" type="button" value=" 确 定 " onclick="postdates();" />
            </div>
        </div>
    </div>
</body>
</html>
