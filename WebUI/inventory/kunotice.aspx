<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kunotice.aspx.cs" Inherits="kunotice" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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

    <script type="text/javascript">
    $(function() {
        $("#tree1").ligerTree({
            checkbox: true
        });
        $("#tree2").ligerTree({
            checkbox: false
        });
        $("#tree3").ligerTree({
            checkbox: false,
            parentIcon: null,
            childIcon: null
        })
         
    });
   
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 150,
            heightDiff: 0
        })
    });
    
   
    </script>

    <script type="text/javascript">

     function selectt(xx,types) {
        $("#txttnum").val(xx);
        load();
        
    }
    function alll() {
       $("#txttnum").val("");
        load();
    }
   
    

    </script>

   

    <style type="text/css">
        #layout1
        {
            padding: 2px;
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
    
    <!----------加载列表-------->

    <script type="text/javascript">   
       $(function() {  
         load();
        });
        
        var gg =null;
       
        function load()
        {

     var tnum= document.getElementById("txttnum").value;
       var url="tnum="+tnum+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '编码',
                    name: 'cNum',
                    align: 'left',
                    width: 100,
                    isAllowHide: false
                },
                
                 {
                    display: '名称',
                    name: 'cName',
                    width: 150,
                    align: 'left'
                },
               
                {
                    display: '所属类别',
                    name: 'tName',
                    
                    width: 70
                   
                },
               
                {
                    display: '销售价格',
                    name: 'cPrice',
                    width: 60,
                    align: 'right'
                },
                {
                    display: '进货价格',
                    name: 'cInprice',
                     width: 60,
                     align: 'right'
                    
                    
                   
                },
                  {
                    display: '库存数量',
                    name: 'cCount',
                     width: 60,
                     align: 'right'
                    
                    
                   
                },
               
                {
                    display: '隐藏',
                    name: 'cIfshow',
                     width: 50,
                     render:function (row){return (row.cIfshow =="0")?'否':'是';}
                    
                }
                 
                ],
          
                url: "Ajaxconsumeslist.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true,
//                  
                   onSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                        $("#txtcnum").val(rowdata.cNum);
                        
                   },
                     onUnSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                    $("#txtcnum").val("");
                   },
                   onReload:function(grid)
                   {
                    $("#txtcnum").val("");
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
              $("#txtnum").val("");
              $("#txtname").val("");
              $("#txtcnum").val("");
               $("#txttnum").val("");
              load();
        }
        
                         
                                                                    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div id="layout1">
            <div position="left" title="消费项目类别" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="消费项目" style="padding: 2px;">
      
                <div class="divgirdtop">
                    <img src="../images/ico-show-txt.png" /><span id="mtype">消费项目库存提醒列表</span><input id="txtcnum"
                        type="text" style="display: none;" /><input id="txttnum" type="text" style="display: none;" />
                </div>
                <div style="margin: 0; padding: 0; width: 99.7%">
                    <div id="maingrid4" style="margin: 0; padding: 0;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
