<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comsumchongci.aspx.cs" Inherits="comsumchongci" %>

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



    <%--消费详细列表--%>

    <script type="text/javascript">   
       $(function() {
    var mnum = "<%=cid %>";
    var grid = null;
    $("#mainxiao").ligerGrid({
        checkbox: false,
        columns: [{
            display: '商品编号',
            name: 'uNum',
            align: 'left',
            width: 80,
            isAllowHide: false
        },
        
         {
            display: '商品名称',
            name: 'uName',
            width: 130,
            align: 'left'
        },
       
        {
            display: '单价',
            name: 'uPrice',
            width: 70,
            align: 'center'
        },
        {
            display: '积分',
            name: 'uJifen',
             width: 70
           
        },
        {
            display: '次数',
            name: 'uAllcount',
            width: 60,
            align: 'center'
        },
   
        {
            display: '消费次数',
            name: 'uXiao',
             width: 60,
             align: 'center'
            
        },
         {
            display: '有效期',
            name: 'uPastdate',
             width: 80,
             align: 'center'
            
        }
        ],
        url: "Ajaxcomsumchongci.aspx?tables=conscishu&orders=uId&mnum="+mnum+"",
        dataAction: 'server',
        pageSize: 10,
        pageSizeOptions: [5,10, 15, 20, 30],
        width: '100%',
        height: '100%'
       
    });
    $("#pageloading").hide();
    grid = $("#mainxiao").ligerGetGridManager();
    $('#mainxiao').ligerGrid().set('dataAction','server');


});
                    
                                                                    
    </script>



</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div id="tab1" style="overflow: hidden; border: 1px solid #A3C0E8;">
            <div style="padding: 2px; width: 99.5%">
                <div id="mainxiao" style="margin: 0; padding: 0">
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
