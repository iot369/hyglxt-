<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selectconsumes.aspx.cs"
    Inherits="selectconsumes" %>

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
    var checkObj;
    function Check(onClickObj) {
        if (checkObj != null) {
            checkObj.checked = false
        }
        if (checkObj == onClickObj) {
            onClickObj.checked = false
        } else onClickObj.checked = true;
        checkObj = onClickObj
    }
     function selectt(xx,types) {
        $("#txttnum").val(xx);
        load();
        
    }
    function alll() {
       $("#txttnum").val("");
        load();
    }
    function deletemem() {
        var num = $("#txtcnum").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除该消费项目吗？',
            function(type) {
                if (type) del()
            })
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    function del() {
        var nums = $("#txtcnum").val();
        $.ajax({
            url: "Ajaxdelconsumes.aspx?cnum=" + nums + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "true") {
                    $("#txtcnum").val("");
                    f_alert2('warn', '删除成功！');
                       lload();
                } else {
                    f_alert2('warn', '删除失败！')
                }
            }
        })
    }
    function viewmen(){
      var RadNum = Math.random();
         var num = $("#txtcnum").val();
        if (num != "") {
           f_opens('300','600','consumeview.aspx?str='+RadNum+'&cnum='+num+'','查看消费项目','views');
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    
//      function viewmens(nums){
//         var RadNum = Math.random();
//           f_opens('440','700','memberview.aspx?str='+RadNum+'&mnum='+nums+'','查看会员','view');
//       
//    }
        </script>

        <!----------弹出窗体-------->

        <script type="text/javascript">
   
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
        gg=null;
     var  cnum = document.getElementById("txtnum").value;
     var cname = document.getElementById("txtname").value;
     var tnum= document.getElementById("txttnum").value;
       var url="cnum="+cnum+"&cname="+cname+"&tnum="+tnum+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [
                 {
                    display: '操作',
                    name: 'cNum',
                     width: 40,
                     align: 'center',
                     render: function (rowdata, rowindex, rowDomElement) {
                                  //this     这里指向grid
                                  //record   行数据
                                  //rowindex 行索引
                                  //value    当前的值，对应record[column.name]
                                  //column   列信息
                                 return "<input id=\"Check"+rowdata.cId+"\" type=\"checkbox\" onclick=\"winadd('"+rowdata.cId+"','"+rowdata.cNum+"','"+rowdata.cName+"','"+rowdata.tName+"','"+rowdata.cInprice+"')\" />";
                             }
                },
                {
                    display: '编码',
                    name: 'cNum',
                    align: 'left',
                    width: 90,
                    isAllowHide: false
                },
                
                 {
                    display: '名称',
                    name: 'cName',
                    width: 130,
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
                   
                }
               
               
                 
                ],
          
                url: "../consumes/Ajaxconsumeslist.aspx?"+url+"",
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
         
         function winadd(ids,cnum,cname,ctype,cprice)
         {
            var xx = $("#Check"+ids).attr("checked");
             if(xx==true)
             {
                window.parent.add1(cnum,cname,ctype,cprice);
              }
              else
              {
                
              }
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
                <div class="tools_box">
                    <div class="tools_bar">
                        <div class="search_box">
                            编码：<input id="txtnum" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                            名称：<input id="txtname" type="text" class="txtInput2" style="width: 60px;" runat="server" />
                            <input id="Button2"  type="button" value="查询" class=" btnInput" onclick="load();" />
                            <input id="Button1" type="button" value="清空" class=" btnInput" onclick="f_search();" />
                        </div>
                    </div>
                </div>
                <div class="divgirdtop">
                    <img src="../images/ico-show-txt.png" /><span id="mtype">所有消费项目</span><input id="txtcnum"
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
