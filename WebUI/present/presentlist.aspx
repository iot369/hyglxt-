<%@ Page Language="C#" AutoEventWireup="true" CodeFile="presentlist.aspx.cs" Inherits="presentlist" %>

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
            $.ligerDialog.confirm('你确定要删除该礼品吗？',
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
            url: "Ajaxdelpre.aspx?gnum=" + nums + "",
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
           f_opens('320','550','presentedit.aspx?str='+RadNum+'&gnum='+num+'','查看礼品','views');
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
            title: title,
            buttons: [{
                text: '保存',
                onclick: function(item, dialog) {
                    document.getElementById(nammm).contentWindow.addmem();
                      
                }
            },
            {
                text: '关闭',
                onclick: function(item, dialog) {     
                    dialog.close();
                }
            }]
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
     var name = document.getElementById("txtname").value;
       var url="num="+num+"&name="+name+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '编码',
                    name: 'gNum',
                    align: 'center',
                    width: 100,
                    isAllowHide: false
                },
                  {
                    display: '名称',
                    name: 'gName',
                    width: 150,
                    align: 'left'
                },
                
                 {
                    display: '所需积分',
                    name: 'gJifen',
                    width: 70,
                    align: 'center'
                },
                 {
                    display: '剩余数量',
                    name: 'gCount',
                    width: 70,
                    align: 'center'
                },             
                {
                    display: '是否兑换',
                    name: 'gState',
                     width: 60,
                     render:function (row){return (row.gState =="1")?'是':'否';}
                    
                }, 
                 {
                    display: '添加日期',
                    name: 'gDate',
                     width: 100,
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
                        $("#txtanum").val(rowdata.gNum);        
                        
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
            var name =$("#txtname").val();
            gg.setParm("num",num);
            gg.setParm("name",name);
            gg.loadData();

        }
        
        function f_search()
        {
              $("#txtnum").val("");
              $("#txtname").val("");
              $("#txtanum").val("");
             gg.setParm("num","");
            gg.setParm("name","");
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
            <div position="center" title="礼品信息列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <a onclick="f_opens('320','550','presentadd.aspx','添加礼品','addss');" class="tools_btn">
                            <span><b class="adds">添加</b></span></a> <a onclick="viewmen();" class="tools_btn"><span>
                                <b class="all">查看</b></span></a> <a onclick="deletemem();" id="btndel" class="tools_btn">
                                    <span><b class="recycle">删除</b></span></a>
                        <div class="search_box">
                            编码：<input id="txtnum" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                            名称：<input id="txtname" type="text" class="txtInput2" style="width: 60px;" runat="server" />
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
