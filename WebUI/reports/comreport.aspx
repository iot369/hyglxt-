<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comreport.aspx.cs" Inherits="comreport" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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
            height:'57%',
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

    <script type="text/javascript">
     $(function() { 
 
         load();
        });
        
        var gg =null;
       
        function load()
        {
        gg=null;
   
     var  year = document.getElementById("ddlyear").value;
       var url="year="+year+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '消费单号',
                    name: 'C_Id',
                    align: 'left',
                    width: 120,
                    isAllowHide: false
                },
                
                {
                    display: '卡号',
                    name: 'Card_Id',
                    width: 80,
                    align: 'center'
                },
               
                {
                    display: '姓名',
                    name: 'ClientName',
                     align: 'center',
                    width: 50
                   
                },
                 {
                    display: '卡类型',
                    name: 'CardType',
                     align: 'center',
                    width: 60
                   
                },
               
                {
                    display: '销售金额',
                    name: 'Money',
                    width:60,
                    align: 'right'
                },
                {
                    display: '储值',
                    name: 'BlancePay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '现金',
                    name: 'CashPay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '银行',
                    name: 'BankPay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '积分',
                    name: 'JifenPay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '其他',
                    name: 'ElsePay',
                     width: 50,
                     type:'currency'
                   
                },
                {
                    display: '消费类型',
                    name: 'Type',
                     width: 60,
                     type:'currency'
                   
                },
                
                {
                    display: '消费时间',
                    name: 'Addtime',
                     width: 120
                    
                },
                {
                    display: '消费店铺',
                    name: 'Shop',
                     width: 130,
                     align: 'left'
                   
                }
                
                
                ],
          
                url: "Ajaccom.aspx?"+url,
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true
                   
            });
       
                $("#pageloading").hide();
           
        }
        
       

        
       function lload()
        {
            gg.loadData();
        }
        
        function f_search()
        {
              load();
              tubiao();

        }
        
        //zhou图表
        function loadzhou()
        {
            $('#txturl').val('comzhou.aspx');
            tubiao();
        }
        
   
        
        function tubiao()
        {
            var type= document.getElementById("ddltype").value;
            var urls=$('#txturl').val();
            if(urls=="commonth.aspx")
            {
                var RadNum = Math.random();
                var  year = document.getElementById("ddlyear").value;
                var url= urls+"?year="+year+"&str="+RadNum+"&type="+type+""; 
                    url=encodeURI(encodeURI(url));
                    $('#iframetu').attr('src',url);
            }
            else if(urls=="comzhou.aspx"){
                var RadNum = Math.random();
                var  month = document.getElementById("txtSendTimeMIN").value;
                var url= urls+"?month="+month+"&str="+RadNum+"&type="+type+""; 
                    url=encodeURI(encodeURI(url));
                    $('#iframetu').attr('src',url);
            }
            else{
                  var RadNum = Math.random();
                    var url= urls+"?str="+RadNum+"&type="+type+""; 
                    url=encodeURI(encodeURI(url));
                    $('#iframetu').attr('src',url);
            }
        }
         //yue图表
        function loadmonth()
        {
            $('#txturl').val('commonth.aspx');
            tubiao();

        }
        
         
       //地点图表
        function loadadd()
        {
            $('#txturl').val('comdian.aspx');
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
                <a id="A1" class="tools_btn" onclick="loadzhou();"><span><b class="import">每周图表</b></span></a>
                <a id="A2" class="tools_btn" onclick="loadmonth();"><span><b class="import">年份图表</b></span></a>
                <a id="020201" class="tools_btn" onclick="loadadd();"><span><b class="import">店铺图表</b></span></a>
                <input id="txturl" type="text" style="display: none;" runat="server" value="comzhou.aspx" />
                <div class="search_box">
                    图形：
                    <asp:DropDownList ID="ddltype" runat="server" CssClass="select2">
                        <asp:ListItem>树状图</asp:ListItem>
                        <asp:ListItem>折线图</asp:ListItem>
                    </asp:DropDownList>
                    每周：
                    <input id="txtSendTimeMIN" type="text" class="txtInput" maxlength="10" size="12"
                        name="SendTimeMIN" runat="server" />
                    <img style="cursor: hand" onclick="popUpCalendar(this,txtSendTimeMIN,'yyyy-mm-dd','');"
                        src="../js/date_selector/calendar.gif" align="absMiddle" border="0" />
                    年份：
                    <asp:DropDownList ID="ddlyear" runat="server" CssClass="select2">
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                    </asp:DropDownList>
                    <input id="Button2" type="button" value="查询" class=" btnInput" onclick="f_search();" />
                </div>
            </div>
        </div>
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="center" title="图形报表" style="padding: 2px;">
                <iframe id="iframetu" frameborder="0" src="comzhou.aspx?str=Math.random()" width="100%"
                    height="300px;"></iframe>
            </div>
        </div>
        <div id="listview">
            <input id="Text1" type="text" runat="server" style="display: none;" />
            <div position="center" title="数据列表" style="padding: 2px;">
                <div id="maingrid4" style="margin: 0; padding: 0;">
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
