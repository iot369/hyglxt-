<%@ Page Language="C#" AutoEventWireup="true" CodeFile="regoods.aspx.cs" Inherits="regoods" %>

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

        <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

        <script src="../js/Public.js" type="text/javascript"></script>

        <script src="../js/jsAddress.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

        <!--------------加载页面------------>

        <script type="text/javascript">
    
          $(function() {
            $("#listview").ligerLayout({
                leftWidth: 120,
                heightDiff: 0
            })
        });
        </script>

        <script type="text/javascript">
         $(function() { 
   
         });
        
        var gg =null;
       
        function load()
        {
        var  xiaofei = document.getElementById("txtxiaofei").value;
        var  mnum = document.getElementById("txtmnum").value;
        var url="xiaofei="+xiaofei+"&mnum="+mnum+""; 
            url=encodeURI(encodeURI(url));
          gg= $("#maingrid4").ligerGrid({
                checkbox: false,
                columns: [{
                    display: '消费单号',
                    name: 'C_Id',
                    align: 'left',
                    width: 120,
                    isAllowHide: false
                },
                
                 {
                    display: '卡号',
                    name: 'Card_Id',
                    width: 80,
                    align: 'center'
                },
               
                {
                    display: '姓名',
                    name: 'ClientName',
                     align: 'center',
                    width: 50
                   
                },
                 {
                    display: '卡类型',
                    name: 'CardType',
                     align: 'center',
                    width: 60
                   
                },
               
                {
                    display: '销售金额',
                    name: 'Money',
                    width:60,
                    align: 'right'
                },
                {
                    display: '储值',
                    name: 'BlancePay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '现金',
                    name: 'CashPay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '银行',
                    name: 'BankPay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '积分',
                    name: 'JifenPay',
                     width: 50,
                     type:'currency'
                   
                },
                   {
                    display: '其他',
                    name: 'ElsePay',
                     width: 50,
                     type:'currency'
                   
                },
                {
                    display: '消费类型',
                    name: 'Type',
                     width: 60,
                     type:'currency'
                   
                },
                
                {
                    display: '消费时间',
                    name: 'Addtime',
                     width: 120
                    
                },
                {
                    display: '消费店铺',
                    name: 'Shop',
                     width: 130,
                     align: 'left'
                   
                }
                
                
                ],
          
                url: "Ajaxlist.aspx?"+url,
                dataAction: 'server',
                pageSize: 20,
                pageSizeOptions: [5,10, 15, 20, 30],
                width: '100%',
                height: '100%',
                rownumbers:true,
                  onDblClickRow:function (rowdata, rowindex, rowDomElement)
                   {    
                            
                            xiaoi(rowdata.C_Id);                
                                                
                   }
                   
            });
       
                $("#pageloading").hide();
           
        }
        
       

        
       function lload()
        {
            gg.loadData();
        }
        
        function f_search()
        {
            load();
//           var xiaofei=  $("#txtxiaofei").val();
//           var mnum=  $("#txtmnum").val();
//            gg.setParm("xiaofei",xiaofei);
//            gg.setParm("mnum",mnum);
//            gg.loadData();
        }
        
         function f_opensxiao(height, width, url, title) {
            $.ligerDialog.open({
                height: height,
                url: '' + url + '',
                width: width,
                isResize: true,
                slide: false,
                isHidden: false,
                name: 'winadd',
                title: title
               
            })
        }
        
        
        function xiaoi(sid)
        {
                var RadNum = Math.random();
                var url ="gooddetail.aspx?str="+RadNum+"&cid="+sid;
                f_opensxiao('300', '600', url, '会员收银消费详细');
        }
        
  
        
       
        
                        
   
        </script>



        <style type="text/css">
            #layout1
            {
                padding: 1px;
            }
            #listview
            {
                padding: 1px;
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
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="divall">
        <div class="tools_box">
            <div class="tools_bar">
                <input id="txturl" type="text" style="display: none;" runat="server" value="comzhou.aspx" />
                <div class="search_box">
                    消费编号：<input id="txtxiaofei" type="text" class="txtInput2" />
                    会员卡号：<input id="txtmnum" type="text" class="txtInput2" />
                    <input id="Button2" type="button" value="查询" class=" btnInput" onclick="f_search();" />
                </div>
            </div>
        </div>
        <div id="listview">
            <input id="Text1" type="text" runat="server" style="display: none;" />
            <div position="center" title="消费数据列表" style="padding: 2px;">
                <div id="maingrid4" style="margin: 0; padding: 0;">
                </div>
            </div>
        </div>
      
    </div>
    </form>
</body>
</html>
