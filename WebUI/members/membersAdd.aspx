<%@ Page Language="C#" AutoEventWireup="true" CodeFile="membersAdd.aspx.cs" Inherits="membersAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
        <link href="../images/style.css" rel="stylesheet" type="text/css" />
        <link href="../css/forms.css" rel="stylesheet" type="text/css" />

        <script src="../js/jsAddress.js" type="text/javascript"></script>

        <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

        <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

        <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

        <script src="../js/Public.js" type="text/javascript"></script>

        <script type="text/javascript">
    window.onload = function onlodd() {
        document.getElementById('txtmNum').focus();
    }
    window.onload = function addresss() {
        var xxa = $("#cmbProvince").val() + "," + $("#cmbCity").val() + "," + $("#cmbArea").val();
        $("#txtadd").val(xxa);
    }
    function checkmemnum() {
        var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
        var obj = document.getElementById("txtmNum");
        if (!reg.test(obj.value)) {
            f_alert2('warn', '会员编号格式不正确,请重新输入！');
            $("#txtmNum").val("");

        } else {
            var memid = $("#txtmNum").val();
            $.ajax({
                url: "Ajaxcheckmnum.aspx?mnum=" + memid + "",
                type: "get",
                cache: false,
                success: function(date) {
                    if (date == "false") {

                       f_alert2('warn', '会员卡号已存在，请重新录入！');
                        $("#txtmNum").val("");
                        return;

                    }
                }

            })
        }

    }
    
     

    function addmem() {
        if ($("#txtmNum").val()!=""&& $("#txtmobile").val()!=""&&$("#txtname").val()!=""&&$("#txtpastdate").val()!=""&&$("#ddllevel").val()!="NONE"&&$("#ddlmakecard").val()!="NONE") 
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
        window.parent.lload();
        
    }
    
    function chongzhi(xx)
    {
        window.parent.chongzhi(xx);
//        f_opensadd('370','620','../membusiness/recharge.aspx','会员充值','addss');
    }
    
    
    
    function closeflash()
    {
//              $(window.parent.document).find("input[id='Button1']").click();  
//            parent.$.ligerDialog.close(); 
    }
        </script>

        <script type="text/javascript">
    //弹出窗体
    var i=1;
    function f_opensadd(height, width, url, title,namm) {
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
            buttons: [
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
    function checkpwd() {
        var x = document.getElementById("txtPassword").value;
        var y = document.getElementById("txtPasswords").value;
        if (x != y) {
            f_alert2('warn', '两次密码不相符,请重新输入！');
            $("#txtPasswords").val("");
            return;
        } else {}
    }
    
    function checksphone() {
        var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
        var obj = document.getElementById("txtmobile");
        if (!reg.test(obj.value)) {
            f_alert2('warn', '会员编号格式不正确,请重新输入！');
            $("#txtmobile").val("");

        } else {
            var mphone = $("#txtmobile").val();
            $.ajax({
                url: "Ajaxcheckmobile.aspx?mphone=" + mphone + "",
                type: "get",
                cache: false,
                success: function(date) {
                    if (date == "false") {

                       f_alert2('warn', '该手机号码已注册，请重新录入！');
                        $("#txtmobile").val("");
                        return;

                    }
                }

            })
        }

    }
    
     //选择有效期
        function  pastdate()
        {
             $.ligerDialog.open({ target: $("#pastdates"),width:300,height:170,isHidden:true,title:"选择有效期" });
        }
        
        //确定选择有效期
        function pastok()
        {
            if($('#txtpast').val()!="")
            {
                $('#txtpastdate').val($('#txtpast').val());
            }
            else
            {
                 $('#txtpastdate').val("永久有效");
            }
            $.ligerDialog.hide({ target: $("#pastdates") });
            
        }
        //有效期判断
        function datepast()
        {
            var type = $('#ddlpast').val();
             $.ajax({
                    url:"../Consumption/chongci/AjaxSelectdate.aspx?type="+type+"",
                    type: "get",
                    cache: false,
                    success: function(date) {
                        $('#txtpast').val(date);
                    }
             });
        }
        
        
        //推荐人
        function tuijian()
        {
        if($("#txttuijian").val()!="")
        {
            if( $("#txttuijian").val()!= $("#txtmNum").val())
            {
                var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
                var obj = document.getElementById("txttuijian");
                if (!reg.test(obj.value)) {
                    f_alert2('warn', '会员编号格式不正确,请重新输入！');
                    $("#txttuijian").val("");

                } else {
                    var memid = $("#txttuijian").val();
                    $.ajax({
                        url: "Ajaxchecktuijian.aspx?mnum=" + memid + "",
                        type: "get",
                        cache: false,
                        success: function(date) {

                             var xx = new Array();
                                xx = date.split('&');
                                if(xx[0]=="OK")
                                {
                                     $("#txttuijianname").val(xx[1]);
                                }
                                else
                                {
                                   f_alert2('warn', '推荐人卡号不存在！');
                                   $("#txttuijian").val(""); 
                                    $("#txttuijianname").val("");
                                }
                         

                        }

                    })
                }
                }
                else
                {
                       f_alert2('warn', '推荐人卡号不能与新增卡号相同!');
                       $("#txttuijian").val("");
                       $("#txttuijianname").val("");
                }
                }
        }
        </script>

        <script type="text/javascript">
    $(function() {

        $("#txtbirth").ligerDateEditor({
            label: '',
            labelWidth: 130,
            labelAlign: 'right',
            initValue: '<%=datenow %>'
        });
         $("#txtpast").ligerDateEditor({
            label: '',
            labelWidth: 120,
            labelAlign: 'right',
            initValue: ''
        });
    });
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div class="divgirdtop">
            <img src="../images/ico-show-txt.png" />登记会员信息
        </div>
        <table class="addedit">
            <tr>
                <th>
                    <span class="spanxing">*</span>会员卡号：
                </th>
                <td>
                    <input id="txtmNum" type="text" class="txtInputyes" style="width: 130px;" onchange="checkmemnum();"
                        runat="server" />
                </td>
                <th>
                    <span class="spanxing">*</span>会员级别：
                </th>
                <td>
                    <asp:DropDownList ID="ddllevel" runat="server" Style="width: 138px;" CssClass="select">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="display: none;">
                <th>
                    密码：
                </th>
                <td>
                    <input id="txtPassword" type="password" class="txtInput2" style="width: 130px;" runat="server" /><span
                        class="spanxing">*</span>
                </td>
                <th>
                    重复密码：
                </th>
                <td>
                    <input id="txtPasswords" type="password" class="txtInput2" style="width: 130px;"
                        onchange="checkpwd();" runat="server" /><span class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    <span class="spanxing">*</span>会员姓名：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInputyes" style="width: 130px;" runat="server" />
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
                    <span class="spanxing">*</span>身份证号：
                </th>
                <td>
                    <input id="txtnoid" type="text" class="txtInputyes" style="width: 130px;" runat="server" />
                </td>
                <th>
                    <span class="spanxing">*</span>生日：
                </th>
                <td>
                    <input id="txtbirth" type="text" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    <span class="spanxing">*</span>手机号码：
                </th>
                <td>
                    <input id="txtmobile" type="text" class="txtInputyes" style="width: 130px;" runat="server"
                        onchange="checksphone();" />
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
	addressInit('cmbProvince', 'cmbCity', 'cmbArea', '广东', '广州市', '市辖区');
	
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
                    <span class="spanxing">*</span>过期日期：
                </th>
                <td>
                    <input id="txtpastdate" type="text" runat="server" style="width: 130px;" onclick="pastdate();"
                        class="txtInputyes" />
                </td>
                <th>
                    <span class="spanxing">*</span>办卡人员：
                </th>
                <td>
                    <asp:DropDownList ID="ddlmakecard" runat="server" Style="width: 138px;" CssClass=" select">
                    </asp:DropDownList>
                </td>
            </tr>
             <tr>
                <th>
                    推荐人卡号：
                </th>
                <td>
                    <input id="txttuijian" type="text" runat="server" style="width: 130px;" 
                        class="txtInputyes" onchange="tuijian();" />
                </td>
                <th>
                    推荐人姓名：
                </th>
                <td>
                   <input id="txttuijianname" type="text" runat="server" style="width: 130px;" 
                        class="txtInputyes" />
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
            <input id="Button1" type="button" value="保 存" onclick="addmem();" class=" btnSubmit" />
        </div>
        <div style="display: none;">
            <asp:Button ID="Button2" runat="server" CssClass="txtInput2" Text="保 存" OnClick="Button2_Click" />
        </div>
    </div>
    <!--选择有效期-->
    <div id="pastdates" style="width: 260px; margin: 3px; display: none; height: 50px;">
        <fieldset align="middle" class="FieldSet" style="width: 240px; height: 100px; margin-left: 10px;
            text-align: center; float: left; padding-top: 10px;">
            <legend><font color="#0000ff">选择有效期</font></legend>
            <div style="margin-top: 15px; color: Black;">
                <table>
                    <tr>
                        <td>
                            <select id="ddlpast" class="select2" onchange="datepast();">
                                <option value="100">永久有效</option>
                                <option value="30">一月</option>
                                <option value="90">三月</option>
                                <option value="180">半年</option>
                                <option value="1">一年</option>
                                <option value="3">三年</option>
                            </select>
                        </td>
                        <td>
                            <input id="txtidpast" type="text" style="display: none;" />
                            <input id="txtpast" type="text" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <span id="Span1" style="font-size: 12px; color: Red;"></span>
                            <input id="Button9" type="button" value="确 认" class=" btnSubmit" onclick="pastok();" />
                        </td>
                    </tr>
                </table>
            </div>
        </fieldset>
    </div>
    <!--选择有效期结束-->
    </form>
</body>
</html>
