<%@ Page Language="C#" AutoEventWireup="true" CodeFile="presentedit.aspx.cs" Inherits="presentedit" %>

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

    <script src="../js/jsAddress.js" type="text/javascript"></script>

    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

    <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

    <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

    <script src="../js/Public.js" type="text/javascript"></script>

    <script src="../js/jquery.ajaxfileupload.js" type="text/javascript"></script>

    <script type="text/javascript">
//  function checkmemnum() {
//        var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
//        var obj = document.getElementById("txtnum");
//        if (!reg.test(obj.value)) {
//            f_alert2('warn', '用户工号格式不正确,请重新输入！');
//            $("#txtnum").val("");

//        } else {
//            var num = $("#txtnum").val();
//            $.ajax({
//                url: "Ajaxchecknum.aspx?anum=" + num + "",
//                type: "get",
//                cache: false,
//                success: function(date) {
//                    if (date == "false") {

//                       f_alert2('warn', '用户工号已存在，请重新录入！');
//                        $("#txtnum").val("");
//                        return;

//                    }
//                }

//            })
//        }

//    }
//     function checkuser() {
//       
//            var auser = $("#txtusername").val();
//        var url="auser=" + auser + ""; 
//            url=encodeURI(encodeURI(url)); 
//            $.ajax({
//                url: "Ajaxcheckuser.aspx?"+url+"",
//                type: "get",
//                cache: false,
//                success: function(date) {
//                    if (date == "false") {

//                       f_alert2('warn', '用户登录帐号已存在，请重新录入！');
//                        $("#txtusername").val("");
//                        return;

//                    }
//                }

//            })
//    }


   
  

    function addmem() {
        if ($("#txtnum").val()!=""&&$("#txtname").val()!=""&&$("#txtjifen").val()!="") 
        {
            $.ligerDialog.confirm('你确定要保存礼品信息吗',
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
    

    </script>

    <script type="text/javascript">
//    $(function() {
//        $('#fup').change(function() {
//            upload();
//        });
//    });
    
   
  
    function upload() {
     var gnum = $('#txtnum').val();
        if(gnum!="")
        {
                $.ajaxFileUpload({
                    url: 'ajaxUpload.aspx?random=' + Math.random() + '&gnum=' + gnum,
                    secureuri: false,
                    fileElementId: 'fup',
                    dataType: 'json',
                    success: function(data, status) {
                        if (data.status == 'success') {
                                imgss();

                        } else {
                            alert(data.msg);
                        }
                    },
                    error: function(data, status, e) {
                        alert(data.msg);
                        alert(status);
                        alert(e);
                    }
                });
            }
            else{
             f_alert2('warn', '请填写礼品编号！');
            }

        }
         function imgss() {
           var gnum = $('#txtnum').val();
            $.ajax({
                url: "selectimg.aspx?gnum=" + gnum + "",
                type: "get",
                cache: false,
                success: function(date) {
                var url="pimg/"+date;
                     $('#tmp').attr('src',url);
                }

            })
        }
    


//    var isIE = (document.all) ? true: false;
//    var isIE7 = isIE && (navigator.userAgent.indexOf('MSIE 7.0') != -1);
//    var isIE8 = isIE && (navigator.userAgent.indexOf('MSIE 8.0') != -1);
//    var isMozilla = /mozilla/.test(navigator.userAgent) && !/(compatible|webkit)/.test(navigator.userAgent);
//    var isOpera = /Opera/.test(navigator.userAgent);
//    var thehid = document.getElementById("fup");
//    //        if(isIE7 || isIE8){
//    //            thehid.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='hidden')"
//    //        }
//    function GetThePath() {
//        var thefile = document.getElementById("fup");
//        var thepath = thefile.value;
//        if (isIE7 || isIE8) {
//            thefile.select();
//            var thepath = document.selection.createRange().text;
//            document.selection.empty();
//        } else if (isMozilla) {
//            thepath = thefile.files[0].getAsDataURL();
//        }
//        lujing = thepath;
//        //            alert(lujing);
//        //alert(document.getElementById('你的隐藏字段').value);
//        
//    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div class="divgirdtop">
            <img src="../images/ico-show-txt.png" />编辑礼品
        </div>
        <table class="addedit">
            <tr>
                <th>
                    编号：
                </th>
                <td>
                    <input id="txtnum" type="text" class="txtInput2" style="width: 100px;" runat="server"
                        disabled="disabled" /><span class="spanxing">*</span>
                </td>
                <th>
                    名称：
                </th>
                <td>
                    <input id="txtname" type="text" class="txtInput2" style="width: 100px;" runat="server" /><span
                        class="spanxing">*</span>
                </td>
            </tr>
            <tr>
                <th>
                    所需积分：
                </th>
                <td>
                    <input id="txtjifen" type="text" class="txtInput2" style="width: 100px;" runat="server" /><span
                        class="spanxing">*</span>
                </td>
                <th>
                    是否可兑换：
                </th>
                <td colspan="3">
                    <asp:DropDownList ID="ddlifuser" runat="server" Style="width: 108px;" CssClass="select">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>
                    礼品数量：
                </th>
                <td colspan="3">
                    <input id="txtcout" type="text" class="txtInput2" style="width: 100px;" value="1"
                        runat="server" /><span class="spanxing">*</span>
                        
                </td>
            </tr>
            <tr>
                <th>
                    上传图片：
                </th>
                <td colspan="3">
                    <asp:FileUpload ID="fup" runat="server" CssClass="txtInput" /><input id="btnadd"
                        type="button" value="上传" class="btnInput" style="height: 24px;" onclick="upload();" />
                    <asp:HiddenField ID="hf" runat="server" />
                </td>
            </tr>
            <tr>
                <th>
                    图片信息：
                </th>
                <td colspan="3">
                    <img style="border: 1px solid #C0C0C0; padding: 3px; width: 100px; height: 100px;
                        margin: 2px;" id="tmp" src="<%=imgs %>"  onerror="this.src='../images/noimg.gif '"/>
                </td>
            </tr>
        </table>
        <div class="divgirdbottom">
            <div style="display: none;">
            <asp:Button ID="Button2" runat="server" Text="保 存" OnClick="Button2_Click"  />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
