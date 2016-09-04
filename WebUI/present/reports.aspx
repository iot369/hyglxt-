<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reports.aspx.cs" Inherits="reports" %>

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

        <script src="/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

        <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

        <script src="../js/Public.js" type="text/javascript"></script>

        <script src="../js/jsAddress.js" type="text/javascript"></script>

        <%--积分兑换--%>

        <script type="text/javascript">   
       $(function() {
    var grid = null;
    $("#jifenyue").ligerGrid({
        checkbox: false,
        columns: [{
            display: '单号',
            name: 'cNum',
            align: 'center',
            width: 100,
            isAllowHide: false
        },
         {
            display: '会员卡号',
            name: 'cMnum',
            width: 100,
            align: 'center'
        },
         {
            display: '礼品名称',
            name: 'gName',
            width: 70,
            align: 'center'
        },
       
        {
            display: '兑换积分',
            name: 'jifen',
            width: 70,
            align: 'right'
        },
        {
            display: '日期',
            name: 'cDate',
             width: 100,
            type: 'date'
        },
        {
            display: '兑换店铺',
            name: 'cShopname',
            width: 120,
            align: 'left'
        }
   
       
        ],
        url: "Ajaxpresentall.aspx",
        dataAction: 'server',
        pageSize: 10,
        pageSizeOptions: [5,10, 15, 20, 30],
        width: '100%',
        height: '330px'
    });
    $("#pageloading").hide();
    grid = $("#jifenyue").ligerGetGridManager();
    $('#jifenyue').ligerGrid().set('dataAction','server');


});
                    
                                                                    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div class="divgirdtop">
            <img src="../../images/ico-show-txt.png" /><span id="mtype">积分兑换记录</span><input id="txtbnum"
                type="text" style="display: none;" /><input id="txtlnum" type="text" style="display: none;" />
        </div>
        <div id="jifenyue" style="margin: 0; padding: 0">
        </div>
    </div>
    </form>
</body>
</html>
