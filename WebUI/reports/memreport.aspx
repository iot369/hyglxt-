<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memreport.aspx.cs" Inherits="memreport" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.2.Web, Version=8.2.6.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.2, Version=8.2.6.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.2" Namespace="DevExpress.XtraCharts"
    TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
    <link href="../images/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/forms.css" rel="stylesheet" type="text/css" />
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

    <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

    <script src="../js/Public.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

    <!--------------加载页面------------>

    <script type="text/javascript">

   
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            height:'70%',
            heightDiff: 0
        })
    });
    
       $(function() {
        $("#listview").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        })
    });
    
    
   
    </script>

    <style type="text/css">
        #layout1
        {
            padding: 1px;
        }
        #listview
        {
            padding: 1px;
        }
        .l-page-bottom, .l-page-top
        {
            height: 80px;
            background: #f8f8f8;
            margin-bottom: 3px;
        }
        h4
        {
            margin: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="divall">
        <div class="tools_box">
            <div class="tools_bar">
                <a class="tools_btn" onclick="okll();"><span><b class="import">保存</b></span></a>
            </div>
        </div>
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="center" title="图形报表" style="padding: 2px;">
                <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" Width="500px" Height="300px">
                </dxchartsui:WebChartControl>
                  <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" Width="500px" Height="300px">
                </dxchartsui:WebChartControl>
                  <dxchartsui:WebChartControl ID="WebChartControl3" runat="server" Width="500px" Height="300px">
                </dxchartsui:WebChartControl>
                  <dxchartsui:WebChartControl ID="WebChartControl4" runat="server" Width="500px" Height="300px">
                </dxchartsui:WebChartControl>
            </div>
        </div>
        <div id="listview">
            <input id="Text1" type="text" runat="server" style="display: none;" />
            <div position="center" title="数据列表" style="padding: 2px;">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
