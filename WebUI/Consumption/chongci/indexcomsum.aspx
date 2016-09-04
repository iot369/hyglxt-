<%@ Page Language="C#" AutoEventWireup="true" CodeFile="indexcomsum.aspx.cs" Inherits="indexcomsum" %>

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
        $(function() {
           loadcard();
             
        });
 
        </script>

        <script type="text/javascript">
     function loadcard()//读卡
        {
           $.ligerDialog.open({ target: $("#target1"),width:300,height:180,isHidden:true,title:"读取会员信息" });
           document.getElementById("txtpwd").focus();
        }
        
         function postDate()//加载会员信息
        {
           $("#CardType").val('');
           $("#txtLevels").val('');
           $("#txtname").val('');
           $("#txtBalance").val('');
           $("#txtDate").val('');
           $("#CardId").val('');
            var txtmNum= $("#txtpwd").val();
            $.ajax({
                    url:"AjaxAdd.aspx?type=postDate&cNum="+txtmNum,
                    type: "get",
                    cache: false,
                    success: function(date) {
                        var Sarry=new Array();
                            Sarry=date.toString().split('@');
                            if(Sarry[0]=="不存在")
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
                                var tb = document.getElementById('newTB');
                               var rowNum=tb.rows.length;
                               for (var z=1;z<rowNum;z++)
                               {
                                   tb.deleteRow(z);
                                   rowNum=rowNum-1;
                                   z=z-1;
                               }
                               j=0;
                               $("#CardType").val(Sarry[0]);
                               $("#txtname").val(Sarry[2]);
                               $("#txtBalance").val(Sarry[3]);
                               $("#txtDate").val(Sarry[4]);
                               $("#CardId").val(Sarry[5]);
                               $("#HidPwd").val(Sarry[6]);
                               $("#discount").val(Sarry[9]);
                               $("#Hidjifen").val(Sarry[10]);
                               $("#txtLevels").val(Sarry[8]);
                               $.ligerDialog.hide({ target: $("#target1") });
                               $("#txtpwd").val('');
                                add1();
                            }
                    }
                });
        }
        
            var cGetRow=-99999;
            var f=0;
            function add1()
            {
                var tb = document.getElementById('newTB');
                var rowNum=tb.rows.length;
                for (var z=1;z<rowNum;z++)
                {
                     tb.deleteRow(z);
                     rowNum=rowNum-1;
                     z=z-1;
                }
                f=0;
                var txtmNum= $("#CardId").val();
                 
                 $.ajax({
                        url:"Ajaxloadci.aspx?mnum="+txtmNum,
                        type: "get",
                        cache: false,
                        success: function(date) {
                        if(date!="false")
                        {
                            var str = new Array();
                                str = date.substring(0, date.length - 1).split("|");
                                for (var i = 0; i < str.length; i++) {
                                     var str1 = new Array();
                                         str1 = str[i].split("#");
                                         var ddd ="";
                                         var remark="";
                                         if(str1[4]=="0")
                                         {
                                            ddd="disabled=disabled";
                                            $('#checkall').attr("disabled","disabled");
                                            remark="【计次项目已过期】";  
                                         }
                                    var newTr = newTB.insertRow(-1);
                                    //添加两列
                                    var newTd0 = newTr.insertCell(-1);
                                    var newTd1 = newTr.insertCell(-1);
                                    var newTd2 = newTr.insertCell(-1);
                                    var newTd3 = newTr.insertCell(-1);
                                    var newTd4 = newTr.insertCell(-1);
                                    var newTd5 = newTr.insertCell(-1);

                                    //设置列内容和属性
                                    newTd0.innerHTML ="<input onclick=\"Scount('"+i+"');\" "+ddd+" id=\"Check"+i+"\" type=\"checkbox\" name=\"Check\" value='' /><input class=\"detail\"  Id=\"uid"+i+"\"  name=\"uid\" value=\""+str1[0]+"\" type=\"text\" style=\"width:95%;display:none;\" /> " ; 
                                    newTd1.innerHTML="<input class=\"detail\"  Id=\"txtname"+i+"\"  name=\"txtname\"   value=\""+str1[1]+"\" type=\"text\" style=\"width:95%;text-align: left;\" /> " ;
                                    newTd2.innerHTML="<input class=\"detail\"  Id=\"txtcount"+i+"\"  name=\"txtcount\" readonly=\"readonly\" value=\""+str1[2]+"\"   type=\"text\" style=\"width:95%;text-align: center;\" /> " ;
                                    newTd3.innerHTML="<input class=\"detail\"  Id=\"txtkouci"+i+"\" onClick=\"txtarea('"+i+"');\" onchange=\"jicichange('"+i+"');\"   name=\"txtkouci\" value='1' type=\"text\" style=\"width:95%;text-align: center;\" /> " ;
                                    newTd4.innerHTML="<input class=\"detail\"  Id=\"txtpastdate"+i+"\"  name=\"txtpastdate\"  readonly=\"readonly\" type=\"text\" value=\""+str1[3]+"\"  style=\"width:95%;text-align: center;\" /> " ;
                                    newTd5.innerHTML="<input class=\"detail\"  Id=\"txtremark"+i+"\" value=\""+remark+"\"  name=\"txtremark\" type=\"text\" style=\"width:95%;text-align: center;\" /> " ;

                                    newTd0.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd1.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd2.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd3.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd4.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    newTd5.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                                    f++;
                            }
                        }
                     }
                  });
            }
    
      function Scount(id)//统计数量
      {
           if($('#Check'+id).attr("checked")==true)
           {
                var num = Number($("#SCount").html())+Number($("#txtkouci"+id).val());
                 $("#SCount").html(num);
                 if( Number($("#SCount").html())>0)
                 {
                 $('#Button6').attr("disabled","");
                 }
                 else
                 {
                  $('#Button6').attr("disabled","disabled");
                 }
                 txtarea(id);
           }
           else
           {
                 var num = Number($("#SCount").html())-Number($("#txtkouci"+id).val());
                 $("#SCount").html(num);
                  if( Number($("#SCount").html())>0)
                 {
                 $('#Button6').attr("disabled","");
                 }
                 else
                 {
                  $('#Button6').attr("disabled","disabled");
                 }
           }
      }
        
        function countall()//统计所有
        {
            if($('#checkall').attr("checked")== true)
            {
               var count=0;
               var txtNum=document.getElementsByName("txtkouci");
               for (var x = 0; x < txtNum.length; x++) {
                 count+=Number(txtNum[x].value);
               }
               $("#SCount").html(count);
               $('#Button6').attr("disabled","");
               for (var J = 0; J <f; J++) 
               {
                   $('#Check'+J).attr("checked","checked");
               }
               
            }
            else
            {
                $("#SCount").html("0");
                $('#Button6').attr("disabled","disabled");
               for (var J = 0; J <f; J++) 
               {
                   $('#Check'+J).attr("checked","")
               }
            }
          
        }
        
        //次数改变
        function jicichange(id)
        {
            var cout = $('#txtcount'+id).val();
            var jici = $('#txtkouci'+id).val();
            if(Number(jici)>Number(cout))
            {
                f_alert2('warn', '该计次项目超过可用次数，谢谢!');
                $('#txtkouci'+id).val(cout);
            }
        }
        
        //计次选择
         function aaa()
        {
            var ax ="";
            var xxx = document.getElementsByName("Check");
            var uid = document.getElementsByName("uid");
            var txtkouci = document.getElementsByName("txtkouci")
            for(i=0;i<xxx.length;i++)
            {
                if(xxx[i].checked== true)
                {
                
                    ax += uid[i].value+"#"+txtkouci[i].value+"|";
                   
                }
            }
                $.ajax({
                        url:"Ajaxkouci.aspx?detail="+ax,
                        type: "get",
                        cache: false,
                        success: function(date) {
                        if(date!="false")
                            {
                                f_alert2('success', '扣次成功!');
                                add1();
                            }
                            else
                            {
                                f_alert2('warn', '扣次失败，请联系管理人员!');
                            }
                        }
              });
        }
        
      function keyLogin(){  
        if (event.keyCode==13)
        {   //回车键的键值为13
         
            if(document.getElementById("txtpwd").value!="")
            {
            postDate();
            }
        
        }
    }
   function clearpww()
   {
        $('#txtpwd').val("");
        document.getElementById("txtpwd").focus();
   } 
   
   function txtarea(id)
   {

        $('#txtkouci'+id).select();

  }
    
   
    function ClearDate()//清空会员信息
        {
          $.ligerDialog.confirm('确定要清空吗?', function (yes)
                     {
                        if(yes)
                        {
                           $("#CardType").val('');
                           $("#txtLevels").val('');
                           $("#txtname").val('');
                           $("#txtBalance").val('');
                           $("#txtDate").val('');
                           $("#CardId").val('');
                           $("#SCount").html("0");
                           $('#Button6').attr("disabled","disabled");
                           $('#checkall').attr("checked","");
                           var tb = document.getElementById('newTB');
                           var rowNum=tb.rows.length;
                           for (var z=1;z<rowNum;z++)
                           {
                               tb.deleteRow(z);
                               rowNum=rowNum-1;
                               z=z-1;
                           }
                           j=0;
                          
                     }
            });
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
<body onkeydown="keyLogin();">
    <form id="form1" runat="server">
    <div class="divall">
        <div id="layout1">
            <div style="width: 99.7%; height: 200px; overflow-y: scroll; border-bottom-style: solid;
                border-bottom-width: 1px; border-bottom-color: #95b8e7; border-left-style: solid;
                border-left-width: 1px; border-left-color: #95b8e7; border-right-style: solid;
                border-right-width: 1px; border-right-color: #95b8e7;">
                <table id="newTB" style="width: 97%; border-top-style: solid; border-bottom-style: solid;
                    border-left-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px;
                    border-top-color: #CCCCCC; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC;">
                    <tr>
                        <th style="width: 30px" class="msttop">
                            <input id="checkall" type="checkbox" name="checkboxx" onclick="countall();" />
                        </th>
                        <th style="width: 150px" class="msttop">
                            计次项目
                        </th>
                        <th style="width: 80px" class="msttop">
                            可用次数
                        </th>
                        <th style="width: 80px" class="msttop">
                            扣除次数
                        </th>
                        <th style="width: 100px" class="msttop">
                            有效期
                        </th>
                        <th style="width: 150px" class="msttop">
                            备注
                        </th>
                    </tr>
                </table>
            </div>
            <div class="divgirdbottom" style="text-align: left;">
                &nbsp;&nbsp; 合计：[<span style="color: Red;">总次数</span><span id="SCount" style="color: Red;">0</span>]
            </div>
            <div style="width: 100%; height: 30px; line-height: 30px; text-align: right; padding-right: 15px;">
                <input id="Button3" type="button" value="读 卡" class=" btnInput" onclick="loadcard();" />
                <input id="Button5" type="button" value="清 空" class=" btnInput" onclick="ClearDate();" />
                <input id="Button6" type="button" value="扣 次" class=" btnInput" onclick="aaa();"
                    disabled="disabled" />
            </div>
            <div style="width: 100%; text-align: center;">
                <fieldset align="middle" style="width: 98%; height: 124px; padding-top: 2px;">
                    <legend><font color="#0000ff">会员信息</font></legend>
                    <table class="addedit" style="margin-top: 10px;">
                        <tr>
                            <th>
                                会员卡号：
                            </th>
                            <td>
                                <input id="CardId" type="text" class="txtInput2" style="width: 130px;" runat="server"
                                    readonly="readonly" />
                            </td>
                            <th>
                                会员级别：
                            </th>
                            <td>
                                <input id="txtLevels" type="text" class="txtInput2" style="width: 130px;" runat="server"
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
                </fieldset>
            </div>
        </div>
        <!--读卡-->
        <div id="target1" style="width: 260px; margin: 3px; display: none; height: 120px;">
            <fieldset align="middle" class="FieldSet" style="width: 240px; height: 120px; margin-left: 10px;
                text-align: center; float: left; padding-top: 10px;">
                <legend><font color="#0000ff">输入卡号/手机号</font></legend>
                <div style="margin-top: 15px; color: Black;">
                    <table>
                        <tr>
                            <td>
                                卡号/手机号:
                                <input id="txtpwd" type="text" class="txtInput2" style="width: 130px;" runat="server"
                                    onclick="clearpww();" />
                                <br />
                                <span id="show" style="font-size: 12px; color: Red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <input id="Button4" type="button" value="确 认" class=" btnSubmit" onclick="postDate();" />
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </div>
        <!--读卡结束-->
    </div>
    </form>
</body>
</html>
