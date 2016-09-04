<%@ Page Language="C#" AutoEventWireup="true" CodeFile="levellist.aspx.cs" Inherits="levellist" %>

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

    <script src="../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>

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

        $("#txtpastdate").ligerDateEditor({
            label: '',
            labelWidth: 105,
            labelAlign: 'right',
            initValue: '<%=daten %>'
        });
           $('#divinfo').attr("disabled","disabled");
       
    });
    
     $(function () {
               $("#txtzhe").ligerSpinner({ height: 20,Width: 107,type: 'float',maxValue:1, readonly: false});
                $("#txtjifen").ligerSpinner({ height: 20,Width: 107, type: 'int',minValue:1, readonly: false });
                
             
           });
    
   
    </script>

    <script type="text/javascript">
    
    
//    function loadtree()
//    {
//        $.ajax({
//            url: "Ajaxselectlevel.aspx?lnum=" + nums + "",
//            type: "get",
//            cache: false,
//            success: function(date) {
//                if (date == "false") {
//                    f_alert2('warn', '读取出错，请联系管理员！');
//                      
//                } else {
//              $('#levellist').html(date);
//                        
//                   
//                }
//            }
//        })
//    }
        function bcc()
        {
            if($("#addup").val()=="add"){
             if ($("#txtname").val()!=""&&$("#lBuyprice").val()!=""&&$("#ljifen").val()!=""&& $("#lDiscount").val()!="") 
                {
                     var url="lName=" + $('#txtname').val() + "&lBuyprice=" + $('#txtlBuyprice').val() + "&ljifen=" + $('#txtjifen').val() + "&lDiscount=" +  $('#txtzhe').val() + "&lNblance=" + $('#txtlNblance').val() + ""; 
                         url+="&lNjifen=" + $('#txtlNjifen').val() + "&lRemark=" + $('#txtremark').val() + "&lPasttime=" + $('#txtpastdate').val() + "&lStates=" + $('#ddlstate').val() + "";
                         url=encodeURI(encodeURI(url)); 
                         $.ajax({
                            url: "Ajaxleveladd.aspx?"+url,
                            type: "get",
                            cache: false,
                            success: function(date) {
                                if (date == "false") {
                                       f_alert2('warn', '添加失败，请联系管理员！'); 
                                } else {
                                    
                                    f_alert2('warn', '添加成功！');
                                    $('#Button1').click();
                                     $('#bc').attr("disabled","disabled");       
                                }
                            }
                        })
                    } else {
                f_alert2('warn', '请完整填写必要信息！');
                }
            }
            else{
             if ($("#txtname").val()!=""&&$("#lBuyprice").val()!=""&&$("#ljifen").val()!=""&& $("#lDiscount").val()!="") 
                {
                var url="lNum="+$('#txtlevel').val()+"&lName=" + $('#txtname').val() + "&lBuyprice=" + $('#txtlBuyprice').val() + "&ljifen=" + $('#txtjifen').val() + "&lDiscount=" +  $('#txtzhe').val() + "&lNblance=" + $('#txtlNblance').val() + ""; 
                 url+="&lNjifen=" + $('#txtlNjifen').val() + "&lRemark=" + $('#txtremark').val() + "&lPasttime=" + $('#txtpastdate').val() + "&lStates=" + $('#ddlstate').val() + "";
                 url=encodeURI(encodeURI(url)); 
                 $.ajax({
                    url: "Ajaxlevelup.aspx?"+url,
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "true") {
                                f_alert2('warn', '编辑成功！');
                                upone($('#txtlevel').val(),$('#txtname').val());  
 
                        } else {
                            f_alert2('warn', '编辑失败，请联系管理员！');        
                        }
                    }
                })
                 } else {
                f_alert2('warn', '请完整填写必要信息！');
            }
            }
        }
        
        function addone(lnum,lname)
        {
            $('#ttrree').append('<li id=\"l'+lnum+'""\"><span><a onclick=\"selectt('+lnum+')\" id=\"'+lnum+'\" >'+lname+'</a></span></li>');
             $("#tree2").ligerTree({
            checkbox: false }); 
        }
        
        function upone(lnum,lname)
        {
            $('#'+lnum).html(lname);
        }
        
        function delone(lnum)
        {
            $('#l'+lnum).css('display','none');
        }


     function selectt(nums) {
       $("#txtlevel").val(nums);
           $.ajax({
            url: "Ajaxselectlevel.aspx?lnum=" + nums + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "false") {
                    f_alert2('warn', '等级信息出错，请联系管理员！');
                       $("#txtlevel").val("");
                } else {
               var str = new Array();
                   str = date.split("&");
                   $('#txtname').val(str[0]);
                    $('#txtlBuyprice').val(str[1]);
                     $('#txtjifen').val(str[2]);
                      $('#txtzhe').val(str[3]);
                       $('#txtlNblance').val(str[4]);
                        $('#txtlNjifen').val(str[5]);
                         $('#txtpastdate').val(str[6]);
                          $('#txtremark').val(str[7]);
                          $('#ddlstate').val(str[8]);
                          $('#dels').attr("disabled","");
                          $('#bc').attr("disabled","");
                          $('#divinfo').attr("disabled","");
                          $('#adds').attr("disabled","disabled");
                          $("#addup").val("up");                           
                }
            }
        })
        
    }
    function alll() {
       $('#divinfo').attr("disabled","disabled");
       $("#txtlevel").val("");
       $('#txtname').val("");
       $('#txtlBuyprice').val("");
       $('#txtjifen').val("1");
       $('#txtzhe').val("1.00");
       $('#txtlNblance').val("");
       $('#txtlNjifen').val("");
       $('#txtremark').val("");
       $('#dels').attr("disabled","disabled");
       $('#bc').attr("disabled","disabled");
       $('#adds').attr("disabled","");
       
                   
    }
    
    function addss()
    {
       $('#adds').attr("disabled","disabled");
       $('#divinfo').attr("disabled","");
       $('#bc').attr("disabled","");
       $("#addup").val("add");
       $("#txtlevel").val("");
       $('#txtname').val("");
       $('#txtlBuyprice').val("0");
       $('#txtjifen').val("1");
       $('#txtzhe').val("1.00");
       $('#txtlNblance').val("0");
       $('#txtlNjifen').val("0");
       $('#txtremark').val("");
         
    }
    function deletemem() {
        var num = $("#txtlevel").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除该会员登记吗？',
            function(type) {
                if (type) del()
            })
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    
    function del() {
        var lnum = $("#txtlevel").val();
        $.ajax({
            url: "Ajaxdellevel.aspx?lnum=" + lnum + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "true") {
                    f_alert2('warn', '删除成功！');
                      alll(); 
                       delone(lnum);
                } else if(date == "No") {
                    f_alert2('warn', '该等级下存在会员,不能删除！')
                }else{
                    f_alert2('warn', '删除失败,请联系管理员！')
                }
            }
        })
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
        <div class="tools_box">
            <div class="tools_bar">
                <a onclick="addss();" id="adds" class="tools_btn"><span><b class="adds">添加</b></span></a>
                <a disabled="disabled" id="dels" onclick="deletemem();" class="tools_btn"><span><b
                    class="recycle">删除</b></span></a> <a disabled="disabled" onclick="bcc();" id="bc"
                        class="tools_btn"><span><b class="recharge">保存</b></span></a>
                <div class="search_box">
                    <div style="display: none;">
                        <asp:Button ID="Button1" runat="server" Text="刷新类别" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div id="layout1">
            <input id="addup" type="text" runat="server" style="display: none;" />
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="left" title="会员等级" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="等级信息" style="padding: 2px;">
                <div id="divinfo" style="margin: 0; padding: 0; width: 99.7%">
                    <table class="addedit">
                        <tr>
                            <th>
                                等级名称：
                            </th>
                            <td>
                                <input id="txtname" type="text" class="txtInput2" style="width: 100px;" onchange="checkmemnum();"
                                    runat="server" /><span class="spanxing">*</span>
                            </td>
                            <th>
                                售卡金额：
                            </th>
                            <td>
                                <input id="txtlBuyprice" type="text" class="txtInput2" style="width: 100px;" runat="server"
                                    value="0" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                积分比例：
                            </th>
                            <td>
                                <input id="txtjifen" type="text" value="1" />
                            </td>
                            <th>
                                折扣系数：
                            </th>
                            <td>
                                <input id="txtzhe" type="text" value="1.00" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                初始金额：
                            </th>
                            <td>
                                <input id="txtlNblance" type="text" class="txtInput2" style="width: 100px;" runat="server"
                                    value="0" />
                            </td>
                            <th>
                                初始积分：
                            </th>
                            <td>
                                <input id="txtlNjifen" type="text" class="txtInput2" style="width: 100px;" runat="server"
                                    value="0" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                有效期：
                            </th>
                            <td>
                                <input id="txtpastdate" type="text" runat="server" style="width: 100px;" />
                            </td>
                            <th>
                                是否启用：
                            </th>
                            <td>
                                <asp:DropDownList ID="ddlstate" runat="server" Style="width: 108px;" CssClass="select">
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                    <asp:ListItem Value="0">否</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                备注：
                            </th>
                            <td colspan="3">
                                <asp:TextBox ID="txtremark" runat="server" CssClass="txtInput2" TextMode="MultiLine"
                                    Style="width: 400px; height: 50px;"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
