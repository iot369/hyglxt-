<%@ Page Language="C#" AutoEventWireup="true" CodeFile="text.aspx.cs" Inherits="text" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />                   
    <script src="../lib/jquery/jquery-1.3.2.min.js"  type="text/javascript"></script>
    <script src="/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    
    <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

    <style type="text/css">
       .l-selected .l-grid-row-cell, .l-grid-row-over {background: #eee8e8;}
    </style>         
    <script type="text/javascript">   
       $(function() {
    
    var grid = null;
    $("#maingrid").ligerGrid({
        checkbox: false,
        columns: [{
            display: '充值单号',
            name: 'cNum',
            align: 'left',
            width: 150,
            isAllowHide: false
        },
        {
            display: '充值金额',
            name: 'cChongMoney',
            Width: 70
        },
        {
            display: '赠送金额',
            name: 'cGive',
            width: 60,
            align: 'left'
        },
        {
            display: '余额',
            name: 'cYue',
            width: 70,
            align: 'left'
        },
        {
            display: '日期',
            name: 'cDate',
             width: 120,
            type: 'date'
        }],
        url: "datall.aspx?tables=memberchong&orders=cId",
        dataAction: 'server',
        pageSize: 10,
        pageSizeOptions: [5,10, 15, 20, 30],
        width: '100%',
        height: '400px'
    });
    $("#pageloading").hide();
    grid = $("#maingrid").ligerGetGridManager();
//    $('#userTable').ligerGrid().set('dataAction','server');


});
                    
                                                                    
    </script>
</head>
<body style="padding:0px; margin:0px; overflow:hidden;">
<%--<div class="l-loading" style="display:block" id="pageloading"></div> 
--%>    
    <form id="form1" runat="server">         
    <input type="text" style="display:none"/>
    <asp:Button ID="Button2" runat="server" UseSubmitBehavior="false" Visible="false" />    
    <div id="toptoolbar"></div> 
         
    <div id="maingrid" style="margin:0; padding:0"></div>
    </form>          
</body>
</html>

