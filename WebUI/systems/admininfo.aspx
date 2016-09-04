<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admininfo.aspx.cs" Inherits="admininfo" %>

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
        $("#txtrnum").val(xx);
        $("#mtype").html(types);
        load();
        
    }
    function alll() {
       $("#txtrnum").val("");
       $("#mtype").html("全部");
        load();
    }
    
    function deletemem() {
        var num = $("#txtanum").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除用户信息吗？',
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
            url: "Ajaxdeladmin.aspx?anum=" + nums + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date=="true") {
                 f_alert2('warn', '删除失败！');
                } else {
                      $("#txtanum").val("");
                    f_alert2('warn', '删除成功！');
                       lload();
                }
            }
        })
    }
    function viewmen(){
      var RadNum = Math.random();
         var num = $("#txtanum").val();
        if (num != "") {
           f_opens('270','550','adminview.aspx?str='+RadNum+'&anum='+num+'','查看用户','views');
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
     var rnum= document.getElementById("txtrnum").value;
       var url="num="+num+"&name="+name+"&rnum="+rnum+""; 
            url=encodeURI(encodeURI(url));
     
         var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '工号',
                    name: 'aNum',
                    align: 'center',
                    width: 60,
                    isAllowHide: false
                },
                  {
                    display: '帐号',
                    name: 'aUsername',
                    width: 50,
                    align: 'center'
                },
                
                 {
                    display: '姓名',
                    name: 'aName',
                    width: 50,
                    align: 'center'
                },
                {
                    display: '性别',
                    name: 'aSex',
                     align: 'center',
                    width: 40                  
                },
               
                {
                    display: '联系电话',
                    name: 'aPhone',
                    width: 80,
                    align: 'center'
                },
                {
                    display: '角色权限',
                    name: 'rName',
                     width: 60,
                     align: 'center'                                
                },
                {
                    display: '所属店铺',
                    name: 'sName',
                     width: 140,
                     align: 'left'
                   
                },
                {
                    display: '启用',
                    name: 'aIfuser',
                     width: 40,
                     render:function (row){return (row.aIfuser =="1")?'是':'否';}
                    
                },
                
                 {
                    display: '登记日期',
                    name: 'aDate',
                     width: 75,
                    type: 'date'
                }
                
                ],
          
                url: "Ajaxadminlist.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true,
//                  
                   onSelectRow:function (rowdata, rowindex, rowDomElement)
                   {
                        $("#txtanum").val(rowdata.aNum);
                        ifdel(rowdata.aNum);
                        
                        
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
        
       function ifdel(rname)
       {
          if(rname=="10000")
          {
            $('#btndel').attr("disabled","disabled");
          }
          else
          {
            $('#btndel').attr("disabled","");
          }
       }

        
        function lload()
        {

            gg.loadData();
            $('#btndel').attr("disabled","");
        }
        
        function f_search()
        {
              $("#txtnum").val("");
              $("#txtname").val("");
              $("#txtanum").val("");
               $("#txtrnum").val("");
                 $("#mtype").html("全部");
               gg =null;
              load();
              $('#btndel').attr("disabled","");
        }
        
                         
                                                                    
    </script>
    
    
     <%---重置密码---%>

    <script type="text/javascript">
    function f_opensmima(height, width, url, title) {
        $.ligerDialog.open({
            height: height,
            url: '' + url + '',
            width: width,
            isResize: true,
            slide: false,
            isHidden: false,
            name: 'winadd',
            title: title,
            buttons: [{
                text: '保存',
                onclick: function(item, dialog) {
                    $.ligerDialog.confirm('你确定要修改会员密码吗？',
                    function(type) {if (type)document.getElementById('winadd').contentWindow.handlebtn();});
                    
                }
            },
            {
                text: '关闭',
                onclick: function(item, dialog) {
                    document.getElementById('winadd').contentWindow.closeflash();
                    dialog.close()
                }
            }]
        })
    }
    
    function setok(){
        f_alert2('warn', '保存成功！');
         window.parent.lload();
    }
    
    function setpwd()
    {
        var anum = $("#txtanum").val();
        if(anum!="")
        {
          var url ="setpwd.aspx?anum="+anum; 
        f_opensmima('115', '280', url, '重置密码');
        }else
        {
        f_alert2('warn', '请选择一条记录！')
        }
      
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="left" title="权限角色" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="用户信息列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <a onclick="f_opens('270','550','adminadd.aspx','登记用户','addss');"  class="tools_btn">
                            <span><b class="adds">添加</b></span></a> <a onclick="viewmen();" class="tools_btn"><span>
                                <b class="all">查看</b></span></a> <a onclick="deletemem();" id="btndel"   class="tools_btn"><span><b
                                    class="recycle">删除</b></span></a><a onclick="setpwd();" id="A1"   class="tools_btn"><span><b
                                    class="combine">重置密码</b></span></a>
                        <div class="search_box">
                            工号：<input id="txtnum" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                            用户姓名：<input id="txtname" type="text" class="txtInput2" style="width: 60px;" runat="server" />
                            <input id="Button2" type="button" value="查询" class=" btnInput" onclick="load();" />
                            <input id="Button1" type="button" value="清空" class=" btnInput" onclick="f_search();" />
                        </div>
                    </div>
                </div>
                <div class="divgirdtop">
                    <img src="../images/ico-show-txt.png" /><span id="mtype">全部</span><input id="txtanum"
                        type="text" style="display: none;" /><input id="txtrnum" type="text" style="display: none;" />
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
