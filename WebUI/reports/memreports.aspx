<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memreports.aspx.cs" Inherits="memreports" %>

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

    <script src="../js/jsAddress.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

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
     window.onload = function addresss() {
        var xxa = $("#cmbProvince").val() + "," + $("#cmbCity").val() + "," + $("#cmbArea").val();
        $("#txtadd").val(xxa);
    }
     $(function() { 
 
         load();
        });
        
        var gg =null;
       
        function load()
        {
        gg=null;
   
     var  cmbProvince = document.getElementById("cmbProvince").value;
     var cmbCity = document.getElementById("cmbCity").value;
     var cmbArea = document.getElementById("cmbArea").value;
       var url="cmbProvince="+cmbProvince+"&cmbCity="+cmbCity+"&cmbArea="+cmbArea+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '卡号',
                    name: 'mNum',
                    align: 'left',
                    width: 80,
                    isAllowHide: false
                },
                
                 {
                    display: '姓名',
                    name: 'mName',
                    width: 50,
                    align: 'center'
                },
               
                {
                    display: '手机号码',
                    name: 'mMobile',
                     align: 'left',
                    width: 90
                   
                },
               
                {
                    display: '级别',
                    name: 'lName',
                    width: 50,
                    align: 'center'
                },
                {
                    display: '储值金额',
                    name: 'mBalance',
                     width: 60,
                     align: 'right',
                     type:'currency'
                   
                },
                {
                    display: '可用积分',
                    name: 'mIntegral',
                     width: 60,
                     align: 'right'
                   
                },
                {
                    display: '状态',
                    name: 'mStates',
                     width: 40,
                     render:function (row){return (row.mStates =="0")?'正常':'挂失';}
                    
                },
                 {
                    display: '有效期',
                    name: 'mPastdate',
                     width: 75,
                    type: 'date'
                },
                 {
                    display: '办卡时间',
                    name: 'mMakedate',
                     width: 75,
                    type: 'date'
                },
                 {
                    display: '办卡店铺',
                    name: 'sName',
                     width: 100,
                     align: 'left'
                    
                },
                 {
                    display: '省份',
                    name: 'mProvince',
                     width: 60,
                     align: 'center'
                    
                },
                 {
                    display: '所在市',
                    name: 'mCity',
                     width: 60,
                     align: 'center'
                    
                },
                 {
                    display: '镇区',
                    name: 'mTown',
                     width: 60,
                     align: 'center'
                    
                }
                ],
          
                url: "Ajaxmemlist.aspx?"+url+"",
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
        
        //区域图表
        function loadarea()
        {
            $('#txturl').val('memberarea.aspx');
            tubiao();
        }
        
         //年龄图表
        function loadage()
        {
           $('#txturl').val('memberage.aspx');
           tubiao();
        }
          function loadnew()
        {
           $('#txturl').val('membernewo.aspx');
           tubiao();
        }
        
        function tubiao()
        {
           var RadNum = Math.random();
            var urls=$('#txturl').val();
            var  cmbProvince = document.getElementById("cmbProvince").value;
            var cmbCity = document.getElementById("cmbCity").value;
            var cmbArea = document.getElementById("cmbArea").value;
            var url= urls+"?cmbProvince="+cmbProvince+"&cmbCity="+cmbCity+"&cmbArea="+cmbArea+"&str="+RadNum+""; 
                url=encodeURI(encodeURI(url));
                $('#iframetu').attr('src',url);
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="divall">
        <div class="tools_box">
            <div class="tools_bar">
                <a id="A1" class="tools_btn" onclick="loadarea();"><span><b class="import">区域图表</b></span></a><a id="020201"
                    class="tools_btn" onclick="loadage();"><span><b class="import">年龄图表</b></span></a>
                    <a id="A2"
                    class="tools_btn" onclick="loadnew();"><span><b class="import">新老图表</b></span></a>
                    <input id="txturl" type="text" style="display: none;" runat="server" value="memberarea.aspx"/>
                <div class="search_box">
                    <select id="cmbProvince" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                    </select>&nbsp;省
                    <select id="cmbCity" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                    </select>&nbsp;市
                    <select id="cmbArea" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                    </select>&nbsp;(镇/区)<input id="txtadd" type="text" style="display: none;" runat="server" />

                    <script type="text/javascript">
	addressInit('cmbProvince', 'cmbCity', 'cmbArea', '广东', '东莞市', '全部');
	
                    </script>

                    <input id="Button2" type="button" value="查询" class=" btnInput" onclick="f_search();" />
                </div>
            </div>
        </div>
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="center" title="图形报表" style="padding: 2px;">
                <iframe id="iframetu" frameborder="0" src="memberarea.aspx" width="100%" height="300px;"></iframe>
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
