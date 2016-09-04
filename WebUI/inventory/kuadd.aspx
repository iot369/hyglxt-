<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kuadd.aspx.cs" Inherits="kuadd" %>

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

        <script type="text/javascript">
    
        
            var cGetRow=-99999;
            var i=0;
            function add1(cnum,cname,cype,cprice)
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
                                    newTd4.innerHTML="<input class=\"detail\"  Id=\"txtprice"+i+"\" onclick=\"this.select();\"  name=\"txtprice\"   type=\"text\" value=\""+cprice+"\"   style=\"width:95%;text-align: center;\" /> " ;
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
           function addpro(){
                 var RadNum = Math.random();
                   f_opensadd('440','740','selectconsumes.aspx?str='+RadNum+'','选择入库消费项目','view');
            }
            
            
         //获取编号
        function aa() {
            var strj = "";
            var str1 = document.getElementsByName("txtnum");
            for (i = 0; i < str1.length; i++) {
                if(str1[i].value!="")
                {
                strj += str1[i].value + "|";
                }
            }    
            return strj;
        }
        
        
        //消费明细
         function aabb() {
            var strj = "";
            var str1 = document.getElementsByName("txtnum");
            var str2 = document.getElementsByName("txtname");
            var str3 = document.getElementsByName("txttype");
            var str4 = document.getElementsByName("txtprice");
            var str5 = document.getElementsByName("txtcount");
            var str6 = document.getElementsByName("txtremark");
            
            for (i = 0; i < str1.length; i++) {
                if(str1[i].value!="")
                {
                    strj += str1[i].value + "," + str2[i].value  +"," + str3[i].value+"," + str4[i].value+"," + str5[i].value+"," +str6[i].value + "|";
                }
            }  
              
            document.getElementById("HiddenField1").value=strj;
            
             $.ligerDialog.confirm('你确定要保存入库单吗',
                function(type) {
                if (type)ll();               
            });
        }
        
        function ll()
        {
            document.getElementById("Button2").click();

            window.parent.lload();
            
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
                title: title
            })
            i++;
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
<body >
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
                            <input id="txtnums" type="text" class="txtInput2" style="width: 150px;" runat="server"
                                readonly="readonly" />
                        </td>
                        <th>
                            入库时间：
                        </th>
                        <td>
                            <input id="txtdate" type="text" class="txtInput2" style="width: 150px;" runat="server"
                                readonly="readonly" />
                        </td>
                        <th>
                            操作人员：
                        </th>
                        <td>
                            <input id="txtmarkname" type="text" class="txtInput2" style="width:150px;" runat="server"
                                readonly="readonly" />
                        </td>
                       
                    </tr>
                    <tr>
                        <th>
                            结账方式：
                        </th>
                        <td>
                            <input id="txtpaytype" type="text" class="txtInput2" style="width: 150px;" runat="server" />
                        </td>
                         <th>
                            入库店铺：
                        </th>
                        <td>
                            <input id="txtshopname" type="text" class="txtInput2" style="width: 150px;" runat="server"/>
                        </td>
                         <th>
                            备注：
                        </th>
                        <td>
                            <input id="txtremark" type="text" class="txtInput2" style="width: 150px;" runat="server"/>
                        </td>
                        
                    </tr>
                </table>
            </div>
            <div style="border-color: #95b8e7; border-width: 1px; border-style: solid; width: 99.7%;
                height: 400px; overflow-y: scroll;">
                <table id="newTB" style="width: 97%; border-top-style: solid; border-bottom-style: solid;
                    border-left-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px;
                    border-top-color: #CCCCCC; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC;
                    margin-top: 1px; margin-left: 1px;">
                    <tr>
                        <th style="width: 80px" class="msttop">
                            操作
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
                </table>
            </div>
            <div class="divgirdbottom" style="text-align: left; padding-left: 5px;">
                <input id="Button1" type="button" value="添加入库项目" class=" btnInput" onclick="addpro();" />
            </div>
            <div style="width: 100%; height: 30px; line-height: 30px; text-align: center; padding-right: 15px;">
                <input id="Button3" type="button" value="保存入库单" class=" btnInput" onclick="aabb();" /> 
            </div>
            <div style="display:none;">
                <asp:Button ID="Button2" runat="server" Text="Button" 
                    onclick="Button2_Click"  />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
