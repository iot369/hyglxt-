<%@ Page Language="C#" AutoEventWireup="true" CodeFile="consumdetail.aspx.cs" Inherits="consumdetail" %>

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
        var grid = null; 
       $(function() {
    var mnum = "<%=cid %>";
    
    grid=$("#mainxiao").ligerGrid({
        checkbox: false,
        columns: [{
            display: '商品编号',
            name: 'dNum',
            align: 'left',
            width: 80,
            isAllowHide: false
        },
        
         {
            display: '商品名称',
            name: 'dName',
            width: 130,
            align: 'left'
        },
       
        {
            display: '原价',
            name: 'dPrice',
            width: 70,
            align: 'center'
        },
        {
            display: '折后价',
            name: 'dMoney',
             width: 70,
            type: 'date'
        },
        {
            display: '数量',
            name: 'dCount',
            width: 60,
            align: 'center'
        },
   
        {
            display: '折扣',
            name: 'dZhe',
             width: 60,
             align: 'center'
            
        },
         {
               display: '状态',
                name: 'dStates',
                width: 50,
                render:function (row){return (row.dStates =="0")?'正常':'已退货';}
                    
         },
         {
            display: '操作',
            name: 'dId',
             width: 60,
             align: 'center',
             render: function (rowdata, rowindex, rowDomElement) {
                          //this     这里指向grid
                          //record   行数据
                          //rowindex 行索引
                          //value    当前的值，对应record[column.name]
                          //column   列信息
                         return "<a onclick=\"tuihuo('"+rowdata.dId+"','"+rowdata.dStates+"','"+rowdata.dcId+"')\">退货</a>";
                     }
            
        }
        ],
        url: "Ajaxconsumdeatil.aspx?tables=consumptiondetail&orders=dId&mnum="+mnum+"",
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

function tuihuo(xx,state,dnum)
{
    if(state=="0")
    {
    
         $.ligerDialog.confirm('你确定提交退货吗？',
            function(type) {
                if (type)
                 $.ajax({
                  url: "../regoods/Ajaxtuihuo.aspx?did=" + xx + "&dnum="+dnum+"",
                   type: "get",
                   cache: false,
                   success: function(date) {
                        if(date=="true")
                        {
                            f_alert2('success', '退货成功！');
                            grid.loadData();
                        }
                        else
                        {
                             f_alert2('warn', '退货失败，请联系管理员！');
                        }
                     }
              });
              
            })
        
     }
     else
     {
        f_alert2('warn', '该商品已退货！');
     }
}
                    
                                                                    
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
