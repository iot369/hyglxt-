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

    <script src="../../js/jsAddress.js" type="text/javascript"></script>

    <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <%-- <link href="../lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />--%>

    <script src="../../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

    <script src="../../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

    <script src="../../js/Public.js" type="text/javascript"></script>

    <script type="text/javascript">
       window.onload = function onlodd() {
        document.getElementById('txtmNum').focus();
    }
    function LoadCard()
    {
        var txtNum = $("#txtmNum").val();
        if(txtNum=="")
        {
            f_alert2('warn', '请输入卡号!');
            return;
        }
         $.ajax({
                    url: "AJaxDAL.aspx?Type=load&Id="+txtNum,
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "false") {

                            f_alert2('warn', '读取失败，请联系管理人员！');
                            return false;

                        }
                        else{
                            var Sarry=new Array();
                            Sarry=date.toString().split('@');
                            if(Sarry[0]=="临时卡")
                            {
                               $("#CardType").val('临时卡');
                                $("#txtname").val('临时卡');
                               $("#FKType").val('现金');
                            }
                            else if(Sarry[0]=="不存在")
                            {
                                f_alert2('warn', '卡号不存在!');
                            }
                            else if(Sarry[0]=="挂失")
                            {
                                f_alert2('warn', '该会员卡已挂失，不能消费!');
                            }
                             else if(Sarry[0]=="过期")
                            {
                                f_alert2('warn', '该会员卡已过期，不能消费!');
                            }
                            else
                            {
                               $("#CardType").val(Sarry[0]);
                               $("#txtlevel").val(Sarry[8]);
                               $("#txtname").val(Sarry[2]);
                               $("#txtBalance").val(Sarry[3]);
                               $("#txtDate").val(Sarry[4]);
                               $("#lDiscount").val(Sarry[9]);
                               $("#ljifen").val(Sarry[10]);
                               HeJi();
                            }
                        }
                    }
                });
    }
    function BtnSub()
    {
         var txtNum = $("#txtmNum").val();
         var CardType = $("#CardType").val();
         var FKType = $("#FKType").val();
         if(txtNum =="")
         {
             f_alert2('warn', '请输入卡号!');
             return;
         }
         if(CardType =="")
         {
             f_alert2('warn', '该卡无效!');
             return;
         }
         if(FKType=="请选择")
         {
              f_alert2('warn', '请选择付款类型!');
              return;
         }
         if(FKType=="余额支付"&&CardType=="临时卡")
         {
              f_alert2('warn', '临时卡不能选择余额支付!');
              return;
         }
         if(FKType=="余额支付")
         {
             if(Number($("#txtXFMoney").val())>Number($("#txtBalance").val()))
             {
               f_alert2('warn', '余额不足!');
               return;
             }
         }
         $.ligerDialog.open({ target: $("#target1"),width:300,height:180,isHidden:true });    }
    
    function closes()
    {
        $.ligerDialog.hide({ target: $("#target1") });
    }
    function clears()
    {
        $("#txtmNum").val('');
        $("#CardType").val('');
         $("#txtlevel").val('');
         $("#txtname").val('');
          $("#txtBalance").val('');
          $("#txtDate").val('');
         $("#txtXFMoney").val('0');
          $("#txtXFMoney2").val('0');
          $("#FKType").val('');
          $("#txtremark").val('');
    }
    function postDate()
    {
     
       var txtmNum= $("#txtmNum").val();
        var CardType= $("#CardType").val();
         var txtlevel= $("#txtlevel").val();
          var txtname= $("#txtname").val();
           var txtBalance= $("#txtBalance").val();
            var txtDate= $("#txtDate").val();
            var txtpwd= $("#txtpwd").val();
            var txtXFMoney= $("#txtXFMoney2").val();
            var FKType= $("#FKType").val();
            var JiFen=parseInt(Number($("#ljifen").val())*Number($("#txtXFMoney2").val()));
            var txtremark= $("#txtremark").val();
             
             $.ajax({
                    url: encodeURI("AJaxDAL.aspx?Type=sub&Id="+txtmNum+"&pwd="+txtpwd+"&CardType="+CardType+"&txtname="+txtname+"&PayType="+FKType+"&Remark="+txtremark+"&txtXFMoney="+txtXFMoney+"&JiFen="+JiFen),
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "false") {
                           document.getElementById("show").innerHTML="密码错误!";
                            return false;
                        }
                        else{
                         closes();
                         pwdclear();
                         clears();
                         f_alert2('success', '消费成功!');
                        }
                    }
                });
    }
    function pwdclear()
    {
        $("#txtpwd").val('');
        document.getElementById("show").innerHTML="";
    }
    function checknum(obj)
    {
      obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
      obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
      obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
      obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
      HeJi();
    }
    function HeJi()
    {
       $("#txtXFMoney2").val(Number($("#txtXFMoney").val())*Number($("#lDiscount").val()).toFixed(2));
    }
    
     var ss=0;
  function keyLogin(){  
        if (event.keyCode==13)   //回车键的键值为13
        if(document.getElementById("txtmNum").value!="")
        {
            LoadCard();
        }
        else
        {
            document.getElementById("txtmNum").focus();
        }
    }  
    </script>

</head>
<body onkeydown="keyLogin();">
    <form id="form1" runat="server">
    <input id="lDiscount" type="hidden" runat="server" value="1" />
    <input id="ljifen" type="hidden" runat="server" value="0" />
    <div class="divall">
        <div id="bg">
        </div>
        <div class="divgirdtop">
            <img src="../../images/ico-show-txt.png" />会员信息
        </div>
        <table class="addedit">
            <tr>
                <th>
                    卡号/手机号：
                </th>
                <td>
                    <input id="txtmNum" type="text" class="txtInput2"   style="width: 130px;" runat="server"
                        onclick="clears();" />
                    <input id="Button2" type="button" value="读卡" class=" btnInput" onclick="LoadCard();" />
                </td>
                <th>
                    会员级别：
                </th>
                <td>
                    <input id="txtlevel" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
            </tr>
            <tr>
                <th>
                    姓名：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
                <th>
                    可用金额：
                </th>
                <td>
                    <input id="txtBalance" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
            </tr>
            <tr>
                <th>
                    有效日期：
                </th>
                <td>
                    <input id="txtDate" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
                <th>
                    卡片类型：
                </th>
                <td>
                    <input id="CardType" type="text" class="txtInput2" style="width: 130px;" runat="server"
                        readonly="readonly" />
                </td>
            </tr>
        </table>
        <div class="divgirdtop" style="margin-top: 5px;">
            <img src="../../images/ico-show-txt.png" />快速消费
        </div>
        <table class="addedit">
            <tr>
                <th>
                    消费金额：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <input id="txtXFMoney" type="text" class="txtInput2" style="width: 120px; height: 30px;
                        font-size: 28px; color: #FF0000; font-family: 微软雅黑; line-height: 30px;" value="0"
                        onchange="HeJi();" onkeyup="checknum(this);" /><span style="font-size: 22px; color: #FF0000;
                            font-family: 微软雅黑; padding-left: 10px;" id="chong">元</span>
                </td>
            </tr>
            <tr>
                <th>
                    实付金额：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <input id="txtXFMoney2" type="text" class="txtInput2" style="width: 120px; height: 30px;
                        font-size: 28px; color: #FF0000; font-family: 微软雅黑; line-height: 30px;" runat="server"
                        value="0" onchange="heji();" onkeyup="checknum(this);" readonly="readonly" /><span
                            style="font-size: 22px; color: #FF0000; font-family: 微软雅黑; padding-left: 10px;"
                            id="Span1">元</span>
                </td>
            </tr>
            <tr>
                <th>
                    付款类型：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <select id="FKType">
                        <option value="请选择">请选择</option>
                        <option value="现金">现金</option>
                        <option value="银行卡">银行卡</option>
                        <option value="储值支付">储值支付</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    备注：
                </th>
                <td style="vertical-align: middle; height: 40px;">
                    <textarea id="txtremark" cols="20" rows="2" style="width: 90%; height: 50px;" class="txtInput2"></textarea>
                </td>
            </tr>
        </table>
        <div class="divgirdbottom">
            <input id="Button1" type="button" value="付 款" class="btnSearch" onclick="BtnSub();" />
        </div>
    </div>
    <div id="target1" style="width: 260px; margin: 3px; display: none; height: 120px;">
        <fieldset align="middle" class="FieldSet" style="width: 240px; height: 120px; margin-left: 10px;
            text-align: center; float: left; padding-top: 10px;">
            <legend><font color="#0000ff">输入密码</font></legend>
            <div style="margin-top: 15px; color: Black;">
                <table>
                    <tr>
                        <td>
                            密码:
                            <input id="txtpwd" type="password" class="txtInput2" style="width: 130px;" runat="server"
                                onclick="pwdclear();" />
                            <br />
                            <span id="show" style="font-size: 12px; color: Red;"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <input id="Button3" type="button" value="确 认" class="btnSubmit" onclick="postDate();" />
                        </td>
                    </tr>
                </table>
            </div>
        </fieldset>
    </div>
    </form>
</body>
</html>
