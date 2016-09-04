<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inventoryview.aspx.cs"
    Inherits="inventoryview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>div print</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
        <link href="../../images/style.css" rel="stylesheet" type="text/css" />
        <link href="../../css/forms.css" rel="stylesheet" type="text/css" />
        <link href="../../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

        <script src="../../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

        <script src="../../js/Public.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>

        <script src="../../lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>

        <link href="../css/forms.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript">
    
        
            var cGetRow=-99999;
            var i=0;
            function add1(cnum,cname,cype)
            {  
                var xx = aa();
                if(xx.indexOf(cnum)<0)
                { 
                                
                                    var newTr = newTB.insertRow(-1);
                                    //添加两列
                                    var newTd0 = newTr.insertCell(-1);
                                    var newTd1 = newTr.insertCell(-1);
                                    var newTd2 = newTr.insertCell(-1);
                                    var newTd3 = newTr.insertCell(-1);
                                    var newTd4 = newTr.insertCell(-1);
                                    var newTd5 = newTr.insertCell(-1);
                                    var newTd6 = newTr.insertCell(-1);
                                    
                                    //设置列内容和属性
                                    newTd0.innerHTML ='<img src=\"../../images/check_error.gif\" onclick=\"GetRow()\"/>'; 
                                    newTd1.innerHTML="<input class=\"detail\"  Id=\"txtnum"+i+"\"  name=\"txtnum\" readonly=\"readonly\"  value=\""+cnum+"\" type=\"text\" style=\"width:95%;text-align: left;\" /> " ;
                                    newTd2.innerHTML="<input class=\"detail\"  Id=\"txtname"+i+"\"  name=\"txtname\" readonly=\"readonly\" value=\""+cname+"\"   type=\"text\" style=\"width:95%;text-align: left;\" /> " ;
                                    newTd3.innerHTML="<input class=\"detail\"  Id=\"txttype"+i+"\"    name=\"txttype\" value=\""+cype+"\" type=\"text\" style=\"width:95%;text-align: center;\" /> " ;
                                    newTd4.innerHTML="<input class=\"detail\"  Id=\"txtprice"+i+"\" onclick=\"this.select();\"  name=\"txtprice\"   type=\"text\" value=\"0\"  style=\"width:95%;text-align: center;\" /> " ;
                                    newTd5.innerHTML="<input class=\"detail\"  Id=\"txtcount"+i+"\" onclick=\"this.select();\" value=\"1\"  name=\"txtcount\" type=\"text\" style=\"width:95%;text-align: center;\" /> " ;
                                    newTd6.innerHTML="<input class=\"detail\"  Id=\"txtremark"+i+"\" onclick=\"this.select();\"  name=\"txtremark\" type=\"text\" style=\"width:95%;text-align: left;\" /> " ;

                                    newTd0.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd1.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd2.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd3.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd4.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd5.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd6.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    i++;
                 }
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
            .detail
            {
                color: #000000;
                font-size: 12px;
                background-color: #ffffff;
                border: none;
                width: 95%;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="divall">
        <div id="layout1">
            <div style="width: 100%; text-align: center; margin-bottom: 5px;">
                <div style="font-size: 16px;">
                    消费项目入库单
                </div>
                <table class="addedit" style="margin-top: 10px;">
                    <tr>
                        <th>
                            入库单号：
                        </th>
                        <td>
                            <asp:Label ID="lblnum" runat="server" Text="Label"></asp:Label>
                        </td>
                        <th>
                            入库时间：
                        </th>
                        <td>
                            <asp:Label ID="lbldate" runat="server" Text="Label"></asp:Label>
                        </td>
                        <th>
                            操作人员：
                        </th>
                        <td>
                            <asp:Label ID="lblmark" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            结账方式：
                        </th>
                        <td>
                            <asp:Label ID="lblpay" runat="server" Text="Label"></asp:Label>
                        </td>
                        <th>
                            入库店铺：
                        </th>
                        <td>
                            <asp:Label ID="lblshop" runat="server" Text="Label"></asp:Label>
                        </td>
                        <th>
                            备注：
                        </th>
                        <td>
                            <asp:Label ID="lblremark" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <table id="newTB"  class="GridBar">
                <tr style="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;">
                    <th style="width: 80px" class="msttop">
                        序号
                    </th>
                    <th style="width: 200px" class="msttop">
                        项目编码
                    </th>
                    <th style="width: 250px" class="msttop">
                        名称
                    </th>
                    <th style="width: 150px" class="msttop">
                        类别
                    </th>
                    <th style="width: 100px" class="msttop">
                        进货价
                    </th>
                    <th style="width: 100px" class="msttop">
                        数量
                    </th>
                    <th style="width: 200px" class="msttop">
                        备注
                    </th>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Container.ItemIndex+1%>
                            </td>
                            <td>
                                <%#Eval("lNum")%>
                            </td>
                            <td>
                                <%#Eval("lName")%>
                            </td>
                            <td>
                                <%#Eval("lType")%>
                            </td>
                            <td>
                                <%#Eval("lPrice")%>
                            </td>
                            <td>
                                <%#Eval("lCount")%>
                            </td>
                            <td>
                                <%#Eval("lRemark")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
