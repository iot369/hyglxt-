<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memlists.aspx.cs" Inherits="memlists" %>

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
        $("#tree2").ligerTree({
            checkbox: false
           
        });         
    });
   
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        })
    });
     $(function() {
        var rightstr ='<%=userjiao %>';
        if(rightstr!="")
        {
        var strs = new Array();
                 strs = rightstr.substring(0, rightstr.length - 1).split("|");
                 for (var i = 0; i < strs.length; i++)
                 {
                    $('#'+strs[i]).css("display","block");
                  }
        }
    });
    
     $(function() { 
 
         load();
        });
        
        var gg =null;
       
        function load()
        {
        gg=null;
     var sname ="<%=sname %>"
     var  mnum = document.getElementById("txtmnum").value;
     var mname = document.getElementById("txtmname").value;
     var mmobile = document.getElementById("txtmmoblie").value;
     var lnum= document.getElementById("txtlnum").value;
       var url="mnum="+mnum+"&mname="+mname+"&mmobile="+mmobile+"&lnum="+lnum+"&sname="+sname+""; 
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
                }
                ],
          
                url: "Ajaxmemberlist.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true,
                   onDblClickRow:function (rowdata, rowindex, rowDomElement)
                   {                     
                       viewmens(rowdata.mNum);                                  
                   },
                   onSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                        $("#txtbnum").val(rowdata.mNum);                       
                   },
                     onUnSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                    $("#txtbnum").val("");
                   },
                   onReload:function(grid)
                   {
                    $("#txtbnum").val("");
                   }
                   
            });
       
                $("#pageloading").hide();
//                grid = $("#maingrid").ligerGetGridManager();
//                $('#maingrid').ligerGrid().set('dataAction','server');
           
        }
        
       

        
        function lload()
        {
            gg.loadData();
        }
        
         function relooad()
        {
         var  mnum = document.getElementById("txtmnum").value;
         var mname = document.getElementById("txtmname").value;
         var mmobile = document.getElementById("txtmmoblie").value;
         var lnum= document.getElementById("txtlnum").value;

            gg.setParm("mnum",mnum);
            gg.setParm("mname",mname);
            gg.setParm("mmobile",mmobile);
            gg.setParm("lnum",lnum);
            gg.loadData();
        }
        
        function f_search()
        {
              $("#txtmnum").val("");
              $("#txtmname").val("");
              $("#txtbnum").val("");
              $("#txtmmoblie").val("");
              $("#txtlnum").val("");
              $("#mtype").html("全部");
                gg.setParm("mnum","");
                gg.setParm("mname","");
                gg.setParm("mmobile","");
                gg.setParm("lnum","");
                gg.loadData();
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
     function selectt(xx,types) {
        $("#txtlnum").val(xx);
        $("#mtype").html(types);
        relooad();
        
    }
    function alll() {
       $("#txtlnum").val("");
       $("#mtype").html("全部");
        relooad();
    }
    function deletemem() {
        var num = $("#txtbnum").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除会员信息吗？',
            function(type) {
                if (type) del()
            })
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    function del() {
        var nums = $("#txtbnum").val();
        $.ajax({
            url: "Ajaxdeletemen.aspx?mnum=" + nums + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "true") {
                    $("#txtbnum").val("");
                    f_alert2('success', '删除成功！');
                       lload();
                } else {
                    f_alert2('warn', '删除失败！')
                }
            }
        })
    }
    function viewmen(){
      var RadNum = Math.random();
         var num = $("#txtbnum").val();
        if (num != "") {
           f_opens('440','700','memberview.aspx?str='+RadNum+'&mnum='+num+'','查看会员','views');
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    
      function viewmens(nums){
         var RadNum = Math.random();
           f_opens('440','700','memberview.aspx?str='+RadNum+'&mnum='+nums+'','查看会员','view');
       
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
            title: title,
            buttons: [
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

 

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="left" title="会员类别" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="会员信息列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <a id="020201" style="display:none;" onclick="f_opensadd('405','660','membersAdd.aspx','登记会员','addss');"
                            class="tools_btn"><span><b class="adds">添加</b></span></a> <a id="020202" style="display:none;" onclick="viewmen();"
                                class="tools_btn"><span><b class="all">编辑</b></span></a> <a id="020203" style="display:none;" onclick="deletemem();"
                                    class="tools_btn"><span><b class="recycle">删除</b></span></a>
                        <div class="search_box">
                            卡号：<input id="txtmnum" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                            会员姓名：<input id="txtmname" type="text" class="txtInput2" style="width: 60px;" runat="server" />
                            会员手机：<input id="txtmmoblie" type="text" class="txtInput2" style="width: 80px;" runat="server" /><input
                                id="Button2" type="button" value="查询" class="btnInput" onclick="relooad();" />
                            <input id="Button1" type="button" value="清空" class="btnInput" onclick="f_search();" />
                        </div>
                    </div>
                </div>
                
                <div class="divgirdtop">
                    <img src="../images/ico-show-txt.png" /><span id="mtype">全部</span><input id="txtbnum"
                        type="text" style="display: none;" /><input id="txtlnum" type="text" style="display: none;" />
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
