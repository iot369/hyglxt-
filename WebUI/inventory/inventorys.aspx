<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inventorys.aspx.cs" Inherits="inventorys" %>

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

    <!--------------加载页面------------>

    <script type="text/javascript">
   
   
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        })
    });
    
   
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

    <script type="text/javascript">
    
    function deletemem() {
        var num = $("#txtanum").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除该入库单吗？',
            function(type) {
                if (type) del()
            })
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    function del() {
        var nums = $("#txtanum").val();
        $.ajax({
            url: "Ajaxdel.aspx?num=" + nums + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date=="true") {
                          $("#txtanum").val("");
                    f_alert2('warn', '删除成功！');
                       lload();
                
                } else {
             f_alert2('warn', '删除失败！');
                }
            }
        })
    }
    function viewmen(){
      var RadNum = Math.random();
         var num = $("#txtanum").val();
        if (num != "") {
           f_opens('500','800','inventoryview.aspx?str='+RadNum+'&num='+num+'','查看入库单','views');
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    
    </script>

    <script type="text/javascript">
    //弹出窗体
    var i=1;
    function f_opens(height, width, url, title,namm) {
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

    <script type="text/javascript">   
       $(function() {  
         load();
        });
        
        var gg =null;
       
        function load()
        {
        gg=null;
     var  num = document.getElementById("txtnum").value;
       var url="num="+num+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '入库单号',
                    name: 'yNum',
                    align: 'center',
                    width: 150,
                    isAllowHide: false
                },
                  {
                    display: '日期',
                    name: 'yDate',
                    width: 100,
                    align: 'center'
                },
                
                 {
                    display: '付款方式',
                    name: 'yPaytype',
                    width: 100,
                    align: 'center'
                },
                 {
                    display: '操作人',
                    name: 'yMaker',
                    width: 70,
                    align: 'center'
                },             
                 {
                    display: '店铺',
                    name: 'yShopnum',
                     width: 150,
                     align: 'left',
                    type: 'gDate'
                },
                 {
                    display: '备注',
                    name: 'yRemark',
                     width: 150,
                     align: 'left',
                    type: 'gDate'
                }  
                ],
                url: "Ajaxlist.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true,                  
                   onSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                        $("#txtanum").val(rowdata.yNum);        
                        
                   },
                     onUnSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                    $("#txtanum").val("");
                 
                   },
                   onReload:function(grid)
                   {
                    $("#txtanum").val("");
                     $('#btndel').attr("disabled","");
                   }
                   
            });
       
                $("#pageloading").hide();
//                grid = $("#maingrid").ligerGetGridManager();
//                $('#maingrid').ligerGrid().set('dataAction','server');
           
        }
        
     

        
        function lload()
        {
            gg.loadData();
            $('#btndel').attr("disabled","");
        }
        
       function relload()
        {
            var num =$("#txtnum").val();
            gg.setParm("num",num);
            gg.loadData();

        }
        
        function f_search()
        {
              $("#txtnum").val("");
              $("#txtanum").val("");
             gg.setParm("num","");
             gg.loadData();
              $('#btndel').attr("disabled","");
        }
        
                         
                                                                    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="center" title="入库单列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <a onclick="f_opens('590','900','kuadd.aspx','新增入库','addss');" class="tools_btn">
                            <span><b class="adds">添加</b></span></a> <a onclick="viewmen();" class="tools_btn"><span>
                                <b class="all">查看</b></span></a> <a onclick="deletemem();" id="btndel" class="tools_btn">
                                    <span><b class="recycle">删除</b></span></a>
                        <div class="search_box">
                            单号：<input id="txtnum" type="text" class="txtInput2" style="width: 90px;" runat="server" />
               
                            <input id="Button2" type="button" value="查询" class=" btnInput" onclick="relload();" />
                            <input id="Button1" type="button" value="清空" class=" btnInput" onclick="f_search();" />
                        </div>
                    </div>
                </div>
                <div class="divgirdtop">
                    <img src="../images/ico-show-txt.png" /><span id="mtype">全部</span><input id="txtanum"
                        type="text" style="display: none;" />
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
