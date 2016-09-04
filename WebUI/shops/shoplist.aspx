<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shoplist.aspx.cs" Inherits="shoplist" %>

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
            leftWidth: 120,
            heightDiff: 0
        })
    });
    
    function selectt(snum,types) {
        $("#txttnum").val(snum);
        $("#mtype").html(types);
        load();
    }
     function alll() {
        $("#txttnum").val("");
        $("#mtype").html("全部");
        load();
    }
    
   
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
    
    
    function deletemem() {
        var num = $("#txtsnum").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除店铺信息吗？',
            function(type) {
                if (type) del()
            })
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    function del() {
        var snum = $("#txtsnum").val();
        $.ajax({
            url: "Ajaxdeleteshops.aspx?snum=" + snum + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "true") {
                    $("#txtsnum").val("");
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
         var num = $("#txtsnum").val();
        if (num != "") {
           f_opens('270','600','shopview.aspx?str='+RadNum+'&snum='+num+'','编辑店铺','views');
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
//    
//      function viewmens(nums){
//         var RadNum = Math.random();
//           f_opens('440','700','memberview.aspx?str='+RadNum+'&mnum='+nums+'','查看会员','view');
//       
//    }
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
       $(function() {  
         load();
        });
        
        var gg =null;
       
        function load()
        {
     var  sname = document.getElementById("txtname").value;
     var scontact = document.getElementById("txtcontact").value;
     var stnum = document.getElementById("txttnum").value;
       var url="sname="+sname+"&scontact="+scontact+"&stnum="+stnum+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '店铺名称',
                    name: 'sName',
                    align: 'left',
                    width: 150,
                    isAllowHide: false
                }, 
                 {
                    display: '联系人',
                    name: 'sContact',
                    width: 70,
                    align: 'center'
                },
               
                {
                    display: '联系电话',
                    name: 'sMobile',
                     align: 'center',
                    width: 120
                   
                },
                {
                    display: '类别',
                    name: 'tName',
                    width: 80,
                    align: 'center'
                },  
                 {
                    display: '登记日期',
                    name: 'sDate',
                     width: 90,
                    type: 'date'
                }
                ],
          
                url: "Ajaxshopslist.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true,

                   onSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                    $("#txtsnum").val(rowdata.sNum);
                    zong(rowdata.sName)
                   },
                     onUnSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                    $("#txtsnum").val("");
                   },
                   onReload:function(grid)
                   {
                    $("#txtsnum").val("");
                   }
                   
            });
       
                $("#pageloading").hide();
                grid = $("#maingrid").ligerGetGridManager();
//                $('#maingrid').ligerGrid().set('dataAction','server');
           
        }
        
       
        function zong(xx)
        {
            if(xx=="总部")
            {
                $('#090101').attr('disabled','disabled');
            }
            else
            {
                $('#090101').attr('disabled','');
            }
        }
        
        function lload()
        {
            gg.loadData();
        }
        
        function f_search()
        {
              $("#txtname").val("");
              $("#txtcontact").val("");
              $("#txttnum").val("");
              $("#mtype").html("全部");
              load();
        }
        
                         
                                                                    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="left" title="店铺类别" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="店铺信息列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <a onclick="f_opens('270','600','shopsadd.aspx','登记店铺','addss');" class="tools_btn">
                            <span><b class="adds">添加</b></span></a> <a onclick="viewmen();" class="tools_btn"><span>
                                <b class="all">查看</b></span></a> <a id="090101" onclick="deletemem();" class="tools_btn"><span><b
                                    class="recycle">删除</b></span></a>
                        <div class="search_box">
                            店铺名称：<input id="txtname" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                            联系人：<input id="txtcontact" type="text" class="txtInput2" style="width: 60px;" runat="server" />
                            <input id="Button2"  type="button" value="查询" class=" btnInput" onclick="load();" />
                            <input id="Button1" type="button" value="清空" class=" btnInput" onclick="f_search();" />
                        </div>
                    </div>
                </div>
                <div class="divgirdtop">
                    <img  src="../images/ico-show-txt.png" /><span id="mtype">全部</span><input id="txtsnum" type="text" style="display: none;" /><input
                        id="txttnum" type="text" style="display: none;" />
                </div>
                <div style="margin: 0; padding: 0; width: 99.6%">
                    <div id="maingrid4" style="margin: 0; padding: 0;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
