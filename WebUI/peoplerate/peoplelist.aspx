<%@ Page Language="C#" AutoEventWireup="true" CodeFile="peoplelist.aspx.cs" Inherits="peoplelist" %>

<%@ Register Assembly="DevExpress.XtraCharts.v8.2.Web, Version=8.2.6.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.2, Version=8.2.6.0, Culture=neutral, PublicKeyToken=9b171c9fd64da1d1"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.2" Namespace="DevExpress.XtraCharts"
    TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
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

        <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

        <script src="../js/Public.js" type="text/javascript"></script>

        <script src="../js/jsAddress.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

        <link href="../js/date_selector/popcalendar.css" rel="stylesheet" type="text/css" />

        <script src="../js/date_selector/popcalendar.js" type="text/javascript"></script>

        <!--------------加载页面------------>

        <script type="text/javascript">

   
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        })
    });
    
      
    
    
   
        </script>

        <script type="text/javascript">

        
        function f_search()
        {
              tubiao();

        }
        
       
        
   
        
        function tubiao()
        {
            var type= document.getElementById("ddltype").value;
            var urls=$('#txturl').val();
            if(urls=="comweek.aspx")
            {
                var RadNum = Math.random();
                var  week = document.getElementById("txtSendTimeMIN").value;
                var url= urls+"?week="+week+"&str="+RadNum+"&type="+type+""; 
                    url=encodeURI(encodeURI(url));
                    $('#iframetu').attr('src',url);
            }
            else if(urls=="comday.aspx")
            {
                var RadNum = Math.random();
                var  day = document.getElementById("txtSendTimeMIN").value;
                var url= urls+"?day="+day+"&str="+RadNum+"&type="+type+""; 
                    url=encodeURI(encodeURI(url));
                    $('#iframetu').attr('src',url);
            }
            else if(urls=="commonth.aspx")
            {
                var RadNum = Math.random();
                var  month = document.getElementById("txtSendTimeMIN").value;
                var url= urls+"?month="+month+"&str="+RadNum+"&type="+type+""; 
                    url=encodeURI(encodeURI(url));
                    $('#iframetu').attr('src',url);
            }
            else{
                var RadNum = Math.random();
                var  year = document.getElementById("txtSendTimeMIN").value;
                var url= urls+"?year="+year+"&str="+RadNum+"&type="+type+""; 
                    url=encodeURI(encodeURI(url));
                    $('#iframetu').attr('src',url);
            }
        } 
        //日图表
        function loadday()
        {
            $('#txturl').val('comday.aspx');
            tubiao();
        }
         //周图表
        function loadweek()
        {
            $('#txturl').val('comweek.aspx');
            tubiao();

        }
        //月图表
        function loadmonth()
        {
            $('#txturl').val('commonth.aspx');
            tubiao();
        }
         
       //年图表
        function loadyear()
        {
            $('#txturl').val('comyear.aspx');
            tubiao();
        }
        
                        
   
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
            body
            {
                overflow: hidden;
            }
            html
            {
                overflow: hidden;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="divall">
        <div class="tools_box">
            <div class="tools_bar">
                <a id="A1" class="tools_btn" onclick="loadday();"><span><b class="import">日图表</b></span></a>
                <a id="A2" class="tools_btn" onclick="loadweek();"><span><b class="import">周图表</b></span></a>
                <a id="A3" class="tools_btn" onclick="loadmonth();"><span><b class="import">月图表</b></span></a>
                <a id="020201" class="tools_btn" onclick="loadyear();"><span><b class="import">年图表</b></span></a>
                <input id="txturl" type="text" style="display: none;" runat="server" value="comday.aspx" />
                <div class="search_box">
                    图形：
                    <asp:DropDownList ID="ddltype" runat="server" CssClass="select2">
                        <asp:ListItem>树状图</asp:ListItem>
                        <asp:ListItem>饼状图</asp:ListItem>
                    </asp:DropDownList>
                    日期：
                    <input id="txtSendTimeMIN" type="text" class="txtInput" maxlength="10" size="12"
                        name="SendTimeMIN" runat="server" />
                    <img style="cursor: hand" onclick="popUpCalendar(this,txtSendTimeMIN,'yyyy-mm-dd','');"
                        src="../js/date_selector/calendar.gif" align="absMiddle" border="0" />
                    <input id="Button2" type="button" value="查询" class="btnInput" onclick="f_search();" />
                </div>
            </div>
        </div>
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="center" title="图形报表" style="padding: 2px;">
                <iframe id="iframetu" frameborder="0" src="comday.aspx?str=Math.random()" width="100%"
                    height="300px;"></iframe>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
