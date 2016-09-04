<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zonglist.aspx.cs" Inherits="zonglist" %>

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
            height:'60px',
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
   
     var  begin = document.getElementById("begins").value;
     var  over = document.getElementById("overs").value;
     var dian = $('#ddldian').val();
       var url="begin="+begin+"&over="+over+"&dian="+dian+"";
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '店铺编号',
                    name: 'ShopId',
                    align: 'left',
                    width: 100,
                    isAllowHide: false
                },
                
                 {
                    display: '店铺名称',
                    name: 'Shop',
                    width: 150,
                    align: 'center'
                },
               
                {
                    display: '销售金额',
                    name: 'money',
                     align: 'center',
                    width: 70
                   
                },
                 {
                    display: '储值',
                    name: 'BlancePay',
                     align: 'center',
                    width: 60
                   
                },
               
                {
                    display: '现金',
                    name: 'CashPay',
                    width:60
                
                },
                {
                    display: '银行',
                    name: 'BankPay',
                     width: 60,
                     type:'currency'
                   
                },
                   {
                    display: '积分',
                    name: 'JifenPay',
                     width: 60,
                     type:'currency'
                   
                },
                   {
                    display: '其他',
                    name: 'ElsePay',
                     width: 60,
                     type:'currency'
                   
                },
                   {
                    display: '充值总额',
                    name: 'chong',
                     width: 60,
                     type:'currency'
                   
                }
                
                ],
          
                url: "Ajaxzong.aspx?"+url,
                dataAction: 'server',
                pageSize: 20,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true,
                 onDblClickRow:function (rowdata, rowindex, rowDomElement)
                   {                
                        f_opensadd('600','880','fenview.aspx?str='+Math.random()+'&shopnum='+rowdata.ShopId+'&begins='+$('#begins').val()+'&overs='+$('#overs').val()+'','店铺结算','views');
                        
                   }
                   
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
               document.getElementById("Button3").click();

        }
        
         function daochu()
    {
    document.getElementById("Button1").click();
    }
        
       
        
                        
   
    </script>
    
    <script type="text/javascript">
    //弹出窗体
    var i=1;
    function f_opensadd(height, width, url, title,namm) {
        var nammm = namm+i;
        $.ligerDialog.open({
            height: height,
            url: '' + url + '',
            width: width,
            isResize: false,
            slide: false,
            isHidden: true,
            name: nammm,
            title: title
           
        })
        i++;
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
                <input id="txturl" type="text" style="display: none;" runat="server" value="comzhou.aspx" />
                <div class="search_box">
             【店铺】<asp:DropDownList ID="ddldian" CssClass="select" runat="server">
                    </asp:DropDownList>       【结算日期】 自
                    <input id="begins" type="text" class="txtInput" maxlength="10" size="12" name="SendTimeMIN"
                        runat="server" onclick="popUpCalendar(this,begins,'yyyy-mm-dd','');" />
                    至
                    <input id="overs" type="text" class="txtInput" maxlength="10" size="12" name="SendTimeMIN"
                        runat="server" onclick="popUpCalendar(this,overs,'yyyy-mm-dd','');" />
                    <input id="Button2" type="button" value="查询" class=" btnInput" onclick="f_search();" />
                    &nbsp;
                     <asp:Button ID="Button1" runat="server" Text="导出" CssClass="btnInput" 
                        onclick="Button1_Click" BorderStyle="None" />
                </div>
            </div>
        </div>
       
        <div id="listview">
            <input id="Text1" type="text" runat="server" style="display: none;" />
            <div position="center" title="数据列表" style="padding: 2px;">
                <div id="maingrid4" style="margin: 0; padding: 0;">
                </div>
            </div>
        </div>
        <div style="display:none">
            <asp:Button ID="Button3" runat="server" Text="Button" onclick="Button3_Click" />
        </div>
    </div>
    </form>
</body>
</html>