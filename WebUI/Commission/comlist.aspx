<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comlist.aspx.cs" Inherits="comlist" %>

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
        <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
        <link href="../css/forms.css" rel="stylesheet" type="text/css" />

        <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

        <script src="../js/Public.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

        <link href="../js/date_selector/popcalendar.css" rel="stylesheet" type="text/css" />

        <script src="../js/date_selector/popcalendar.js" type="text/javascript"></script>

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
            body
            {
                overflow: hidden;
            }
            html
            {
                overflow: hidden;
            }
        </style>

        <script type="text/javascript">
        
         $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        })
    });
       
       $(function() {  
         load();
         document.getElementById("txtmnum").focus();
        });
        

        
        var gg =null;
       
        function load()
        {
          gg=null;
          var  num = document.getElementById("txtnum").value;
          var name= document.getElementById("txtname").value;
          var begin= document.getElementById("txtbegin").value;
          var over= document.getElementById("txtover").value;
          var url="name="+num+"&num="+num+"&begin="+begin+"&over="+over+""; 
            url=encodeURI(encodeURI(url));
          var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '用户编号',
                    name: 'tnum',
                    align: 'left',
                    width: 100
                   
                },
                {
                    display: '用户名称',
                    name: 'tname',
                    width: 80,
                    align: 'center'
                },
                {
                    display: '发卡张数',
                    name: 'tfcount',
                    width: 100,
                    align: 'center'
                },
                {
                    display: '发卡提成',
                    name: 'tfmoney',
                     align: 'right',
                    width: 100
                   
                },
                {
                    display: '消费金额',
                    name: 'txall',
                    width: 100,
                    align: 'right'
                },
                {
                    display: '消费提成',
                    name: 'txmoney',
                     width: 100,
                     align: 'right',
                     type:'currency'
                   
                }
                ],
          
                url: "Ajaxloadcom.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '400px',
                rownumbers:true    
            });
        }
        
         function lload()
        {
            gg.loadData();
        }
        
         function relooad()
        {
         var  num = document.getElementById("txtnum").value;
         var name = document.getElementById("txtname").value;
         var begin = document.getElementById("txtbegin").value;
         var over= document.getElementById("txtover").value;
         
                gg.removeParm("num");
                gg.removeParm("name");
                gg.removeParm("begin");
                gg.removeParm("over");

            gg.setParm("num",num);
            gg.setParm("name",name);
            gg.setParm("begin",begin);
            gg.setParm("over",over);
            gg.loadData();
        }
        
        function f_search()
        {
              $("#txtnum").val("");
              $("#txtname").val("");
              $("#txtbegin").val("");
              $("#txtover").val("");
              
                gg.setParm("num","");
                gg.setParm("name","");
                gg.setParm("begin","");
                gg.setParm("over","");
                gg.loadData();
        }
        
                         
                                                                    
    </script>

        <script type="text/javascript">
        function keyLogin(){  
        if (event.keyCode==13)   //回车键的键值为13   
            load();
        }  

        </script>
</head>
<body onkeydown="keyLogin();">
    <form id="form1" runat="server">
    <div class="divall">
        <div class="tools_box">
            <div class="tools_bar">
                <div class="search_box" style="float: left;">
                    用户编号：<input id="txtnum" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                    用户名称：<input id="txtname" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                    开始：
                    <input id="txtbegin" type="text" class="txtInput" maxlength="10" size="12" name="SendTimeMIN"
                        runat="server" />
                    <img style="cursor: hand" onclick="popUpCalendar(this,txtbegin,'yyyy-mm-dd','');"
                        src="../js/date_selector/calendar.gif" align="absMiddle" border="0" />
                    结束：
                    <input id="txtover" type="text" class="txtInput" maxlength="10" size="12" name="SendTimeMIN"
                        runat="server" />
                    <img style="cursor: hand" onclick="popUpCalendar(this,txtover,'yyyy-mm-dd','');"
                        src="../js/date_selector/calendar.gif" align="absMiddle" border="0" />
                    <input id="Button2" type="button" value="查询" class=" btnInput" onclick="relooad();" /> <asp:Button ID="Button1" runat="server" Text="导出" CssClass="btnInput" 
                        onclick="Button1_Click" BorderStyle="None" />
                </div>
            </div>
        </div>
        <div id="layout1">
            <div position="center" title="业务提成列表" style="padding: 2px;">
                <div id="maingrid4" style="margin: 0; padding: 0;">
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
