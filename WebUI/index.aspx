<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>购买源码QQ:981442361</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
        <link href="images/style.css" rel="stylesheet" type="text/css" />
        <link href="css/forms.css" rel="stylesheet" type="text/css" />

        <script src="js/jsAddress.js" type="text/javascript"></script>

        <link href="lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

        <script src="lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

        <script src="lib/ligerUI/js/core/base.js" type="text/javascript"></script>

        <script src="lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

        <script src="lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script src="../js/Public.js" type="text/javascript"></script>

        <script type="text/javascript">
         function ll()
         {
             window.location.href = "main/index.aspx";
             
         }
        </script>
</head>
<body style="padding: 0px; margin: 0px" style="overflow: hidden;" onload="document.getElementById('password').value='super';">
    <form id="Form1" runat="server">
    <div style="width: 100%; height: 64px; margin-top: 70px;">
        <center>
            <div style="height: 62px; width: 1000px; text-align: left;">
                <img src="images/loloo.jpg" />
            </div> 
        </center>
    </div>
    <div style="border-width: 1px; border-color: #808080; width: 100%; height: 370px;
        border-top-style: dashed; border-bottom-style: dashed; background-image: url('images/bgwei.jpg');
        background-repeat: repeat-x;">
        <center>
            <div style="height: 370px; width: 1000px; background-image: url('images/loginbgg.jpg');
                background-repeat: no-repeat;">
                <div style="text-align: center; font-family: 微软雅黑; font-size: 13px; width: 320px;
                    height: 252px; background-image: url('images/loginyz.png'); background-repeat: no-repeat;
                    float: right; clip: rect(20px, 20px, auto, auto); margin-top: 70px; padding-top: 80px;
                    padding-right: 10px; color: #333333;">
                    <div>
                        账 户：
                        <input id="username" maxlength="20" name="account" runat="server" style="width: 120px;"
                            class="txtInput" value="super" />
                    </div>
                    <div style="padding-top: 20px;">
                        密 码：
                        <input id="password" type="password" name="password" runat="server" style="width: 120px;"
                            class="txtInput" value="super"/>
                    </div>
                    <div style="padding-top: 20px;">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/loginbutton.png"
                            OnClick="ImageButton1_Click" />&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                
            </div>
           
        </center>
    </div>
 <div style="height: 23px; width: 100%; text-align: right; font-family: 微软雅黑; background-color: #CCCCCC;
        font-size: 13px;"> 
       </div>
    </form>
</body>
</html>
