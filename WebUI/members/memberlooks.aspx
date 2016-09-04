<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberlooks.aspx.cs" Inherits="memberlooks" %>

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

        <%--系统加载--%>

        <script type="text/javascript">
     $(function ()
        {
            $("#tab1").ligerTab();
            navtab = $("#tab1").ligerGetTabManager();
              var xxa = $("#cmbProvince").val() + "," + $("#cmbCity").val() + "," + $("#cmbArea").val();
                $("#txtadd").val(xxa);
        });
        
     $(function() {

        $("#txtbirth").ligerDateEditor({
            label: '',
            labelWidth: 130,
            labelAlign: 'right',
            initValue: '<%=DateTime.Parse( dt.Rows[0]["mBirth"].ToString()).ToString("yyyy-MM-dd") %>'
        });
      addresss();
    });
  function addresss() {
        var xxa = $("#cmbProvince").val() + "," + $("#cmbCity").val() + "," + $("#cmbArea").val();
        $("#txtadd").val(xxa);
    }
    
      $(function() {
        var rightstr ='<%=userjiao %>';
        var strs = new Array();
                 strs = rightstr.substring(0, rightstr.length - 1).split("|");
                 for (var i = 0; i < strs.length; i++)
                 {
                    $('#'+strs[i]).css("display","block");
                  }
    });

        </script>

        <%--充值信息列表--%>

        <script type="text/javascript">   
       $(function() {
    var mnum = $("#txtnum").val();
    var grid = null;
    $("#maingrid4").ligerGrid({
        checkbox: false,
        columns: [{
            display: '充值单号',
            name: 'cNum',
            align: 'center',
            width: 100,
            isAllowHide: false
        },
        
         {
            display: '充值金额',
            name: 'cChongMoney',
            width: 70,
            align: 'right'
        },
       
        {
            display: '赠送金额',
            name: 'cGive',
            width: 70,
            align: 'right'
        },
       
        {
            display: '余额',
            name: 'cYue',
            width: 70,
            align: 'right'
        },
        {
            display: '日期',
            name: 'cDate',
             width: 130,
            type: 'date'
        },
        {
            display: '备注',
            name: 'cRemark',
             width: 180,
             align: 'left'
            
        }
        ],
        url: "datall.aspx?tables=memberchong&orders=cId&mnum="+mnum+"",
        dataAction: 'server',
        pageSize: 10,
        pageSizeOptions: [5,10, 15, 20, 30],
        width: '100%',
        height: '330px'
    });
    $("#pageloading").hide();
    grid = $("#maingrid").ligerGetGridManager();
    $('#maingrid4').ligerGrid().set('dataAction','server');


});
                    
                                                                    
    </script>

        <script type="text/javascript">
    function addmem() {
        if ($("#txtnum").val()!="") 
        {
            $.ligerDialog.confirm('你确定要保存会员信息吗',
                function(type) {
                if (type)ll();               
            });
        } else {
            f_alert2('warn', '请完整填写必要信息！');
        }

    }
    function ll()
    {
        document.getElementById("Button2").click();
        f_alert2('warn', '保存成功！'); 
        window.parent.lload();
    }
     function closeflash()
    {
            parent.$.ligerDialog.close(); 
    }
    
        </script>

        <%---重置密码---%>

        <script type="text/javascript">
    function f_opens(height, width, url, title) {
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
        var mnum = $("#txtnum").val();
        var url ="../membusiness/setpwd.aspx?mnum="+mnum; 
        f_opens('145', '280', url, '重置密码');
    }
        </script>

        <%---会员升级---%>

        <script type="text/javascript">
    function f_openslevel(height, width, url, title) {
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
                    $.ligerDialog.confirm('你确定要升级会员吗？',
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
    
    function uplevel(){
        f_alert2('warn', '保存成功！');
        window.parent.lload();
        document.getElementById("Button2").click();
    }
    
    function uplevels()
    {
     var RadNum = Math.random();
        var mnum = $("#txtnum").val();
        var url ="../membusiness/uplevel.aspx?str="+RadNum+"&mnum="+mnum; 
        f_openslevel('100', '280', url, '会员升级');
    }
        </script>

        <%---会员换卡---%>

        <script type="text/javascript">
    function f_openschange(height, width, url, title) {
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
                    $.ligerDialog.confirm('你确定更换会员卡号吗？',
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
    
    function change(nums){
        f_alert2('warn', '保存成功！');
        $("#txtnum").val(nums);
         window.parent.lload();
         
    }
    
    function notice(type)
    {
        if(type=="1")
        {
         f_alert2('warn', '会员编号格式不正确,请重新输入！');
        }
        else if(type=="2")
        {
            f_alert2('warn', '会员卡号已存在，请重新录入！');
        }
        else
        {
            f_alert2('warn', '请输入新的会员卡号！');
        }
        
    }
    
    function changes()
    {
     var RadNum = Math.random();
        var mnum = $("#txtnum").val();
        var url ="../membusiness/mnumchange.aspx?str="+RadNum+"&mnum="+mnum; 
        f_openschange('100', '280', url, '会员换卡');
    }
        </script>

        <%---会员升级---%>

        <script type="text/javascript">
    function f_opensgua(height, width, url, title) {
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
                    $.ligerDialog.confirm('你确定要操作吗？',
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
    
    function guashi(){
        f_alert2('warn', '保存成功！');
        window.parent.lload();
        document.getElementById("Button2").click();
    }
    
    function guashis()
    {
     var RadNum = Math.random();
        var mnum = $("#txtnum").val();
        var url ="../membusiness/guashi.aspx?str="+RadNum+"&mnum="+mnum; 
        f_opensgua('100', '280', url, '会员挂失');
    }
        </script>
        
         <%---会员延期---%>

        <script type="text/javascript">
    function f_opensyan(height, width, url, title) {
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
                    $.ligerDialog.confirm('你确定要操作吗？',
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
    
    function yanqi(){
        f_alert2('warn', '保存成功！');
        window.parent.lload();
        document.getElementById("Button2").click();
    }
    
    function yanqis()
    {
     var RadNum = Math.random();
        var mnum = $("#txtnum").val();
        var url ="../membusiness/yanqi.aspx?str="+RadNum+"&mnum="+mnum; 
        f_opensyan('140', '280', url, '会员延期');
    }
        </script>

        <%--消费信息列表--%>

        <script type="text/javascript">   
       $(function() {
    var mnum = $("#txtnum").val();
    var grid = null;
    $("#mainxiao").ligerGrid({
        checkbox: false,
        columns: [{
            display: '消费单号',
            name: 'C_Id',
            align: 'center',
            width: 100,
            isAllowHide: false
        },
        
         {
            display: '消费类型',
            name: 'Type',
            width: 70,
            align: 'center'
        },
       
        {
            display: '消费金额',
            name: 'Money',
            width: 70,
            align: 'right'
        },
        {
            display: '日期',
            name: 'Addtime',
             width: 100,
            type: 'date'
        },
        {
            display: '消费店铺',
            name: 'Shop',
            width: 120,
            align: 'left'
        },
   
        {
            display: '备注',
            name: 'Remark',
             width: 180,
             align: 'left'
            
        }
        ],
        url: "Ajaxxiaolist.aspx?tables=Consumption_Back_select&orders=Id&mnum="+mnum+"",
        dataAction: 'server',
        pageSize: 10,
        pageSizeOptions: [5,10, 15, 20, 30],
        width: '100%',
        height: '330px',
         onDblClickRow:function (rowdata, rowindex, rowDomElement)
                   {                     
                  xiaofei(rowdata.C_Id,rowdata.Type);                                 
                   }
    });
    $("#pageloading").hide();
    grid = $("#mainxiao").ligerGetGridManager();
    $('#mainxiao').ligerGrid().set('dataAction','server');


});
                    
                                                                    
    </script>

        <%--积分兑换--%>

        <script type="text/javascript">   
       $(function() {
    var mnum = $("#txtnum").val();
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
        url: "Ajaxpresent.aspx?mnum="+mnum+"",
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

        <%--查看消费商品--%>

        <script type="text/javascript">
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
    
    
  function xiaofei(sid,type)
    {
        if(type=="收银消费")
        {
            var RadNum = Math.random();
            var url ="consumdetail.aspx?str="+RadNum+"&cid="+sid; 
            f_opensxiao('300', '600', url, '会员收银消费详细');
        }
        else if(type=="冲次消费")
        {
             var RadNum = Math.random();
            var url ="comsumchongci.aspx?str="+RadNum+"&cid="+sid; 
            f_opensxiao('300', '600', url, '会员冲次消费详细');
        }
         else if(type=="退货消费")
        {
             var RadNum = Math.random();
            var url ="comsumtuihuo.aspx?str="+RadNum+"&cid="+sid; 
            f_opensxiao('300', '600', url, '会员退货消费详细');
        }
    }
        </script>

        <%--计次消费--%>

        <script type="text/javascript"> 
    $(function() { 
     var mnum = $("#txtnum").val(); 
    var grid = null;
    $("#jici").ligerGrid({
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
            display: '原价',
            name: 'uPrice',
            width: 70,
            align: 'center'
        },
        {
            display: '折后价',
            name: 'uMoney',
             width: 70,
            type: 'date'
        },
        {
            display: '获得积分',
            name: 'uJifen',
             width: 60,
             align: 'center'
            
        },
         {
            display: '数量',
            name: 'uAllcount',
            width: 60,
            align: 'center'
        },
         {
            display: '剩余次数',
            name: 'uCount',
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
        url: "Ajaxjici.aspx?tables=conscishu&orders=uId&mnum="+mnum+"",
        dataAction: 'server',
        pageSize: 10,
        pageSizeOptions: [5,10, 15, 20, 30],
          width: '100%',
        height: '330px'
       
    });
    $("#pageloading").hide();
    grid = $("#jici").ligerGetGridManager();
    $('#jici').ligerGrid().set('dataAction','server');

});
                                                                    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div class="tools_box">
            <div class="tools_bar">
                <a id="020205" style="display: none;" onclick="changes();" class="tools_btn"><span><b
                    class="adds">会员换卡</b></span></a> <a id="020206" style="display: none;" onclick="uplevels();"
                        class="tools_btn"><span><b class="all">会员升级</b></span></a> <a id="020207" style="display: none;"
                            onclick="setpwd();" class="tools_btn"><span><b class="recycle">重置密码</b></span></a>
                <a id="020208" style="display: none;" onclick="guashis();" class="tools_btn"><span><b
                    class="common">会员挂失</b></span></a><a id="020209" style="display: none;" onclick="yanqis();"
                        class="tools_btn"><span><b class="common">会员延期</b></span></a>
            </div>
        </div>
        <div id="tab1" style="overflow: hidden; border: 1px solid #A3C0E8;">
            <div title="会员信息">
                <div style="padding: 2px; width: 99.5%">
                    <table class="addedit">
                        <tr>
                            <th>
                                会员卡号：
                            </th>
                            <td>
                                <input id="txtnum" type="text" class="txtInput2" disabled="disabled" style="width: 130px;"
                                    onchange="checkmemnum();" runat="server" />
                            </td>
                            <th>
                                会员级别：
                            </th>
                            <td>
                                <input id="txtlevel" type="text" class="txtInput2" disabled="disabled" style="width: 130px;"
                                    onchange="checkmemnum();" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                可用积分：
                            </th>
                            <td>
                                <input id="txtjifen" type="text" class="txtInput2" disabled="disabled" style="width: 130px;"
                                    runat="server" />
                            </td>
                            <th>
                                可用余额：
                            </th>
                            <td>
                                <input id="txtBlancce" type="text" class="txtInput2" disabled="disabled" style="width: 130px;"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                会员姓名：
                            </th>
                            <td>
                                <input id="txtname" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                            </td>
                            <th>
                                性别：
                            </th>
                            <td>
                                <asp:DropDownList ID="ddlsex" runat="server" Style="width: 138px;" CssClass="select">
                                    <asp:ListItem>先生</asp:ListItem>
                                    <asp:ListItem>女士</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                身份证号：
                            </th>
                            <td>
                                <input id="txtnoid" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                            </td>
                            <th>
                                生日：
                            </th>
                            <td>
                                <input id="txtbirth" type="text" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                手机号码：
                            </th>
                            <td>
                                <input id="txtmobile" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                            </td>
                            <th>
                                联系QQ：
                            </th>
                            <td>
                                <input id="txtqq" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                微信：
                            </th>
                            <td>
                                <input id="txtwechat" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                            </td>
                            <th>
                                电子邮箱：
                            </th>
                            <td>
                                <input id="txtemail" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                办卡店铺：
                            </th>
                            <td>
                                <input id="txtshop" type="text" class="txtInput2" style="width: 130px;" runat="server"
                                    disabled="disabled" />
                            </td>
                            <th>
                                有效期：
                            </th>
                            <td>
                                <input id="txtpastdate" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                所在省市：
                            </th>
                            <td colspan="3">
                                <select id="cmbProvince" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                                </select>&nbsp;省
                                <select id="cmbCity" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                                </select>&nbsp;市
                                <select id="cmbArea" class="select" style="width: 100px;" runat="server" onchange="addresss();">
                                </select>&nbsp;(镇/区)<input id="txtadd" type="text" style="display: none;" runat="server" />

                                <script type="text/javascript">
	                                addressInit('cmbProvince', 'cmbCity', 'cmbArea', '<%=dt.Rows[0]["mProvince"].ToString() %>', '<%=dt.Rows[0]["mCity"].ToString() %>', '<%=dt.Rows[0]["mTown"].ToString() %>');
                                </script>

                            </td>
                        </tr>
                        <tr>
                            <th>
                                详细地址：
                            </th>
                            <td colspan="3">
                                <input id="txtaddress" type="text" class="txtInput2" style="width: 450px;" runat="server" />
                            </td>
                        </tr>
                         <tr>
                            <th>
                                推荐人卡号：
                            </th>
                            <td>
                                <input id="txttuijian" type="text" runat="server" style="width: 130px;" class="txtInput2"
                                    readonly="readonly" />
                            </td>
                            <th>
                                推荐人姓名：
                            </th>
                            <td>
                                <input id="txttuijianname" type="text" runat="server" style="width: 130px;" class="txtInput2" readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                备注：
                            </th>
                            <td colspan="3">
                                <asp:TextBox ID="txtremark" runat="server" CssClass="txtInput2" TextMode="MultiLine"
                                    Style="width: 450px; height: 50px;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="divgirdbottom">
                        <div>
                            <asp:Button ID="Button2" runat="server" Text="保 存" OnClick="Button2_Click" CssClass="btnSubmit" />
                        </div>
                    </div>
                </div>
            </div>
            <div title="充值记录">
                <div style="padding: 2px; width: 99.5%">
                    <div id="maingrid4" style="margin: 0; padding: 0">
                    </div>
                </div>
            </div>
            <div title="消费纪录">
                <div style="padding: 2px; width: 99.5%">
                    <div id="mainxiao" style="margin: 0; padding: 0">
                    </div>
                </div>
            </div>
            <div title="积分兑换">
                <div style="padding: 2px; width: 99.5%">
                    <div id="jifenyue" style="margin: 0; padding: 0">
                    </div>
                </div>
            </div>
            <div title="计次项目">
                <div style="padding: 2px; width: 99.5%">
                    <div id="jici" style="margin: 0; padding: 0">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
