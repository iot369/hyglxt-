<%@ Page Language="C#" AutoEventWireup="true" CodeFile="warnlist.aspx.cs" Inherits="warnlist" %>

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
 
         load();
        });
        
        var gg =null;
       
        function load()
        {
        gg=null;

     var lnum= document.getElementById("txtlnum").value;
       var url="lnum="+lnum+""; 
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
                    display: '办卡店铺',
                    name: 'sName',
                     width: 100,
                     align: 'left' 
                },
                {
                    display: '发送提醒短信',
                    name: 'mNum',
                     width: 100,
                    render: function (rowdata, rowindex, rowDomElement) {
                         //this     这里指向grid
                         //record   行数据
                         //rowindex 行索引
                         //value    当前的值，对应record[column.name]
                         //column   列信息
                         return " <img  onclick=\"sendmessage('"+rowdata.mNum+"');\" src=\"../images/yellow_mail.png\" />";
                     }
                }
                ],
         
                url: "Ajaxlist.aspx?"+url+"",
                dataAction: 'server',
                pageSize: 10,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true
                   
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

            var lnum= document.getElementById("txtlnum").value;
            gg.setParm("lnum",lnum);
            gg.loadData();
        }
        
        function f_search()
        {

              $("#txtlnum").val("");
              $("#mtype").html("到期提醒");
                gg.loadData();
        }
        
        
        function sendmessage(num)
        {
        
          $.ligerDialog.confirm('你确定要给该会员发送提醒吗',
                function(type) {
                if (type)seee(num)               
            });
        }
        
        function seee(num)
        {
             var lnum= document.getElementById("txtlnum").value;
                     $.ajax({
                        url: "Ajaxsentsms.aspx?mnum=" + num + "&type="+lnum+"",
                        type: "get",
                        cache: false,
                        success: function(date) {
                            if (date == "false") {f_alert2('warn', '发送信息失败，请联系管理员！');}
                            else{f_alert2('warn', '提醒信息发送成功！');}
                                }
                            });
        }

        </script>

        <script type="text/javascript">
        function selectt(xx,types) {
        $("#txtlnum").val(xx);
        $("#mtype").html(types);
        relooad();
        
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
            <div position="left" title="提醒类别" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="会员信息列表" style="padding: 2px;">
             <div class="divgirdtop">
                    <img src="../images/ico-show-txt.png" /><span id="mtype">到期提醒</span><input id="Text1" type="text" style="display: none;" value="001" />
                </div>
                <input id="txtlnum" type="text" style="display: none;" value="001" />
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
