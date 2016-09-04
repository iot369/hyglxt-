<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TemporaryAdd.aspx.cs" Inherits="TemporaryAdd" %>

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
            document.getElementById("txtPId").focus();

        });
    </script>

    <%--充值信息列表--%>
    <style type="text/css">
        .l-selected .l-grid-row-cell, .l-grid-row-over
        {
            background: #eee8e8;
        }
        .detail
        {
            color: #000000;
            font-size: 12px;
            background-color: #ffffff;
            border: none;
            width: 95%;
        }
    </style>

    <script type="text/javascript">

     function closeflash()
    {
            parent.$.ligerDialog.close(); 
    }
    
    function teamAdd()
    {
         var txtNum="";
         var txtId=document.getElementsByName("Lin");
         for (var x = 0; x < txtId.length; x++) {
             txtNum+=txtId[x].value+"|";
       }
        var txtPId = "";
        var txtZhuId=document.getElementsByName("Zhu");
         for (var y = 0; y < txtZhuId.length; y++) {
             txtPId+=txtZhuId[y].value+"|";
       }
        if(txtNum==""||txtPId=="")
        {
            f_alert2('warn', '请输入卡号!');
            return;
        }
         $.ajax({
                    url: "AJaxTemporaryAdd.aspx?Type=team&Id="+txtNum+"&PId="+txtPId,
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "false") {

                            f_alert2('warn', '开卡失败，请联系管理人员！');
                            return false;

                        }
                        else{
                            f_alert2('success', '开卡成功！');
                           var tb = document.getElementById('newTB');
                           var rowNum=tb.rows.length;
                           for (var z=1;z<rowNum;z++)
                           {
                               tb.deleteRow(z);
                               rowNum=rowNum-1;
                               z=z-1;
                           }
                            $("#txtnum").val('');
                             $("#txtPId").val('');
                                   
                        }
                    }
                });
    }
    function UsersAdd()
    {
       
        var txtNum = $("#UserId").val();
        if(txtNum=="")
        {
            f_alert2('warn', '请输入卡号!');
            return;
        }
         $.ajax({
                    url: "AJaxTemporaryAdd.aspx?Type=users&Id="+txtNum,
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "false") {

                            f_alert2('warn', '开卡失败，请联系管理人员！');
                            return false;

                        }
                        else{
                            f_alert2('warn', '开卡成功！');
                            $("#UserId").val('');
                                   
                        }
                    }
                });
    }
    function clears(Id)
    {
      $("#"+Id).val('');
    }
    var cGetRow=-99999;
            var i=1;
            function add1()
            {
               var txtId=document.getElementsByName("Lin");
               for (var x = 0; x < txtId.length; x++) {
                if(txtId[x].value==document.getElementById("txtnum").value){
                   return;
                }
               }
                var newTr = newTB.insertRow(-1);
                //添加两列
                var newTd0 = newTr.insertCell(-1);
                var newTd1 = newTr.insertCell(-1);
                var newTd2 = newTr.insertCell(-1);
                //设置列内容和属性
                newTd0.innerHTML ="<input class=\"detail\"  Id=\"Zhu"+i+"\"  name=\"Zhu\" value='"+ document.getElementById("txtPId").value +"' type=\"text\"  readonly=readonly style=\"width:95%;\" /> " ;
                newTd1.innerHTML="<input class=\"detail\"  Id=\"Lin"+i+"\"  name=\"Lin\" value='"+document.getElementById("txtnum").value+"' type=\"text\"  readonly=readonly style=\"width:95%;\" /> " ;
                newTd2.innerHTML='<img src="../../images/check_error.gif" onclick=\"GetRow()\"/>';

                newTd0.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd1.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd2.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";  
               i++;
            }
           function GetRow(){
 //获得行索引
 //两个parentElement分别是TD和TR，rowIndex是TR的属性
 //this.parentElement.parentElement.rowIndex
    cGetRow=window.event.srcElement.parentElement.parentElement.rowIndex;
    
    DelRow(cGetRow);//点击checkbox时，直接删除行。
  }
  function DelRow(iIndex){
 //删除一行
 if(iIndex==-99999){
   alert("系统提示：没有选中行号!");
 }else{
   newTB.deleteRow(iIndex);
   iIndex==-99999;//将rowIndex恢复默认值。
 }
  }
  var ss=0;
  function keyLogin(){  
        if (event.keyCode==13)   //回车键的键值为13
        if(document.getElementById("txtnum").value!="")
        {

         add1();
         document.getElementById("txtnum").value="";
         document.getElementById("txtnum").focus();
        }
        else
        {
          document.getElementById("txtnum").focus();
        }
    }  
    </script>

</head>
<body onkeydown="keyLogin();">
    <form id="form1" runat="server">
    <div class="divall">
        <div id="tab1" style="overflow: hidden; border: 1px solid #A3C0E8;">
            <div title="团队开卡">
                <div style="padding: 2px; width: 99.5%">
                    <table class="addedit">
                        <tr>
                            <th>
                                主卡卡号：
                            </th>
                            <td style="vertical-align: middle; height: 40px;">
                                <input id="txtPId" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                                <img src="../images/check_error.gif" onclick="clears('txtPId');" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                会员卡号：
                            </th>
                            <td style="vertical-align: middle; height: 40px;">
                                <input id="txtnum" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                                <img src="../images/check_error.gif" onclick="clears('txtnum');" />
                                <input id="Button3" type="button" value="添 加" class=" btnSearch" onclick="add1();" />
                            </td>
                        </tr>
                    </table>
                    <div style="width: 100%; height: 310px; overflow-y: scroll; border-bottom-style: solid;
                        border-bottom-width: 1px; border-bottom-color: #95b8e7; border-left-style: solid;
                        border-left-width: 1px; border-left-color: #95b8e7; border-right-style: solid;
                        border-right-width: 1px; border-right-color: #95b8e7;">
                        <table id="newTB" style="width: 94%; border-top-style: solid; border-bottom-style: solid;
                            border-left-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px;
                            border-top-color: #CCCCCC; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC;">
                            <tr>
                                <th class="msttop">
                                    主卡卡号
                                </th>
                                <th class="msttop">
                                    临时卡号
                                </th>
                                <th class="msttop">
                                    操作
                                </th>
                            </tr>
                        </table>
                    </div>
                    <div class="divgirdbottom">
                        <input id="Button2" type="button" value="开 卡" class=" btnSearch" onclick="teamAdd();" />
                    </div>
                </div>
            </div>
            <div title="个人开卡">
                <div style="padding: 2px; width: 99.5%">
                    <table class="addedit">
                        <tr>
                            <th>
                                会员卡号：
                            </th>
                            <td style="vertical-align: middle; height: 40px;">
                                <input id="UserId" type="text" class="txtInput2" style="width: 130px;" runat="server" />
                                <img src="../images/check_error.gif" onclick="clears('UserId');" />
                            </td>
                        </tr>
                    </table>
                    <div class="divgirdbottom">
                        <input id="Button1" type="button" value="开 卡" class=" btnSearch" onclick="UsersAdd();" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
