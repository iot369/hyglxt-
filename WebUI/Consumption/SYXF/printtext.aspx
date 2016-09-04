<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printtext.aspx.cs" Inherits="printtext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <object id="factory" style="display: none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
        codebase="smsx.cab" viewastext>
    </object>
    <style>
        @media print
        {
            .noprint
            {
                display: none;
            }
        }
    </style>

    <script type="text/javascript">
     function PrintTable() {
       document.getElementById("ddd").style.visibility = "hidden";
            doprint();
            window.close();            
        
        }
        
       function doprint() { 
       factory.printing.printer = "XP-58"  
        factory.printing.header = ""; 
        factory.printing.footer = ""; 
        factory.printing.portrait = true; //portrait是指打印方向，设置为true就是纵向，false就是横向。
        factory.printing.leftMargin   = 0    
        factory.printing.topMargin   =   0    
        factory.printing.rightMargin   =   0    
        factory.printing.bottomMargin   =   0 
        factory.DoPrint(false); //设置为false，直接打印 
        } 

  
    </script>

</head>
<body style="overflow: hidden;">
    <form id="form1" runat="server">
    <!--打印-->
    <div id="div_print" style="width: 100%; margin-top: 5px;">
        <div style="text-align: center; font-size: 15px; width: 100%">
            <asp:Label ID="lbltop" runat="server" Text="Label"></asp:Label></div>
        <div style="font-size: 11px; width: 100%">
            流水号：<asp:Label ID="shui" runat="server" Text="Label"></asp:Label></div>
        <div style="font-size: 11px; width: 100%">
            收银员：<span id="shouyin"><%=shouyin%></span></div>
        <div style="font-size: 11px; width: 100%;">
            日期：<span id="riqi"><%=riqi%></span></div>
        <div style="border-bottom-style: dashed; border-bottom-width: 1px; border-bottom-color: #000000;
            font-size: 11px; margin-bottom: 3px; width: 100%; height: 5px;">
        </div>
        <div style="font-size: 11px; width: 100%">
            <table style="width: 100%">
                <tr>
                    <td style="width: 45%; text-align: center">
                        品名
                    </td>
                    <td style="width: 16%; text-align: center">
                        单价
                    </td>
                    <td style="width: 15%; text-align: center">
                        数量
                    </td>
                    <td style="width: 18%; text-align: right">
                        金额
                    </td>
                </tr>
                <%=detail %>
                <tr style="border-bottom-style: dashed; border-bottom-width: 1px; border-bottom-color: #000000;
                    margin-top: 3px; margin-bottom: 3px;">
                    <td style="text-align: left">
                        合计
                    </td>
                    <td>
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="shuliang" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="jine" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div style="border-bottom-style: dashed; border-bottom-width: 1px; border-bottom-color: #000000;
            font-size: 11px; margin-bottom: 3px; width: 100%; height: 5px;">
        </div>
        <div style="font-size: 12px; margin-top: 3px; margin-bottom: 3px; width: 100%">
            <table style="width: 100%">
                <tr>
                    <td>
                        应收金额：
                    </td>
                    <td style="text-align: right;">
                        <asp:Label ID="yingshou" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        实收金额：
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="shishou" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        应找金额：
                    </td>
                    <td style="text-align: right">
                        <asp:Label ID="yingzhao" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div style="border-bottom-style: dashed; border-bottom-width: 1px; border-bottom-color: #000000;
            font-size: 11px; margin-bottom: 3px; width: 100%; height: 5px;">
        </div>
        <div style="font-size: 12px; width: 100%">
            <div>
                本次积分：<asp:Label ID="jifen" runat="server" Text=""></asp:Label></div>
            <div>
                会员卡号：<asp:Label ID="memcard" runat="server" Text=""></asp:Label></div>
            <div>
                可用积分：<asp:Label ID="lblkeyong" runat="server" Text=""></asp:Label></div>
            <div>
                可用余额：<asp:Label ID="lblyue" runat="server" Text=""></asp:Label></div>
        </div>
        <div style="border-bottom-style: dashed; border-bottom-width: 1px; border-bottom-color: #000000;
            font-size: 11px; margin-bottom: 3px; width: 100%; height: 5px;">
        </div>
        <div style="font-size: 12px; padding-top: 2px; text-align: center; width: 100%; margin-bottom: 3px;">
            <div>
                <asp:Label ID="lblwel" runat="server" Text="Label"></asp:Label></div>
            <div>
                地址：<asp:Label ID="lbladd" runat="server" Text="Label"></asp:Label></div>
            <div>
                电话：<asp:Label ID="lbltel" runat="server" Text="Label"></asp:Label></div>
        </div>
    </div>
    <div id="ddd" style="position: absolute; top: 0px; left: 0px; background-color: #FFFFFF;
        font-size: 16px; font-weight: bold; font-family: 微软雅黑; padding-top: 30px; text-align: center;
        width: 200px; height: 100px;">
        正在打印。。。
    </div>
    </form>
</body>
</html>
