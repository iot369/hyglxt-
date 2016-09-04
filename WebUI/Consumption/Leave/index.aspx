<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
    <link href="../../images/style.css" rel="stylesheet" type="text/css" />
    <link href="../../css/forms.css" rel="stylesheet" type="text/css" />
    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

    <script src="../../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

    <script src="../../js/Public.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

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
         document.getElementById("txtmnum").focus();
        });
        
        var gg =null;
       
        function load()
        {
          gg=null;
          var  mnum = document.getElementById("txtmnum").value;
          var lnum= document.getElementById("txtlnum").value;
          var url="mnum="+mnum+"&lnum="+lnum+""; 
            url=encodeURI(encodeURI(url));
          var grid = null;
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '单据编号',
                    name: 'C_Id',
                    align: 'left',
                    width: 220
                   
                },
                {
                    display: '消费卡号',
                    name: 'Card_Id',
                    width: 90,
                    align: 'center'
                },
                {
                    display: '类型',
                    name: 'Type',
                    width: 80,
                    align: 'center'
                },
               
                {
                    display: '时间',
                    name: 'Addtime',
                     align: 'center',
                    width: 100
                   
                },
               
                {
                    display: '消费商店',
                    name: 'Shop',
                    width: 100,
                    align: 'center'
                },
                {
                    display: '消费金额',
                    name: 'Money',
                     width: 80,
                     align: 'right',
                     type:'currency'
                   
                },
                {
                    display: '备注',
                    name: 'Remark',
                     width: 120,
                     align: 'left'
                   
                }
                ],
          
                url: "AjaxDate.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '400px',
                rownumbers:true
                   
            });
           document.getElementById("txtmnum").value="";
           document.getElementById("txtmnum").focus();
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
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="center" title="会员信息列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <div class="search_box" style="float: left;">
                            卡号：<input id="txtmnum" type="text" class="txtInput2" style="width: 90px;" runat="server" />
                            <input id="Button2" type="button" value="查询" class=" btnInput" onclick="load();" />
                        </div>
                    </div>
                </div>
                <div class="divgirdtop">
                    <img src="../../images/ico-show-txt.png" /><span id="mtype">全部消费记录</span><input id="txtbnum"
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
