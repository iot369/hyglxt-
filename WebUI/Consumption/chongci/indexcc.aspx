<%@ Page Language="C#" AutoEventWireup="true" CodeFile="indexcc.aspx.cs" Inherits="indexcc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>div print</title>
    <object id="factory" style="display: none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
        codebase="smsx.cab" viewastext>
    </object>
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
    var manager = null;
    $(function() {
        $("#tree2").ligerTree({
        slide: false,
         checkbox: false
        });
        
        var pri ="<%=priint %>";
        if(pri=="1")
        {
            $('#zddyxp').attr('checked','checked');
        }
        else
        {
            $('#zddyxp').attr('checked','');
        }
//        document.getElementById('txtmnum').focus();

        
        $("#txtpast").ligerDateEditor({
            label: '',
            labelWidth: 120,
            labelAlign: 'right',
            initValue: ''
        });
        
        $("#layout1").ligerLayout({
            leftWidth: 150,
            heightDiff: 0
        });

         $.ligerDialog.open({ target: $("#target1"),width:300,height:180,isHidden:true,title:"读取会员信息" });
         document.getElementById("txtpwd").focus();  
         
    });
    
    
    $(function (){
        $("#tree2").ligerTree({ checkbox: true });   
        manager = $("#tree2").ligerGetTreeManager();     
         manager.collapseAll();
       });
       
           var cGetRow=-99999;
            var i=1;
            function add1(Id,Name,Price,cNum)
            {
                //判断是否已经添加过，如果是数量+1
                 var txtId=document.getElementsByName("CId");
                  var txtNum=document.getElementsByName("txtNum");
               for (var x = 0; x < txtId.length; x++) {
               var Sarry=new Array();
               Sarry=txtId[x].value.split('&');
                if(Sarry[1]==Id){
                   txtNum[x].value=Number(txtNum[x].value)+1;
                   Scount(); 
                   Sum(Sarry[0]);                  
                   SMoney();
                   return;
                }
               }
                //
               
                var newTr = newTB.insertRow(-1);
                //添加两列
                var newTd0 = newTr.insertCell(-1);
                var newTd1 = newTr.insertCell(-1);
                var newTd2 = newTr.insertCell(-1);
                var newTd3 = newTr.insertCell(-1);
                var newTd4 = newTr.insertCell(-1);
                var newTd5 = newTr.insertCell(-1);
                var newTd6 = newTr.insertCell(-1);
                var newTd7 = newTr.insertCell(-1);
                var newTd8 = newTr.insertCell(-1);
                //设置列内容和属性
                newTd0.innerHTML ="<input class=\"detail\"  Id=\"txtcnum"+i+"\"  name=\"txtcnum\" value=\""+cNum+"\" type=\"text\" style=\"width:95%;display:none;\" /><input class=\"detail\"  Id=\"txtnames"+i+"\"  name=\"txtnames\" value=\""+Name+"\" type=\"text\" style=\"width:95%;\" /> " ; 
                newTd1.innerHTML="<input id=\"Hidden"+i+"\" type=\"hidden\" name='CId' value=\""+i+"&"+Id+"\" /><input class=\"detail\"  Id=\"txtPrice"+i+"\"  name=\"txtPrice\" onchange=\"Sum('"+i+"');\" value="+Price+" type=\"text\" style=\"width:95%;text-align: right;\" /> " ;
                newTd2.innerHTML="<input class=\"detail\"  Id=\"txtNum"+i+"\"  name=\"txtNum\" value='1' onchange=\"Scount();Sum('"+i+"');\"  type=\"text\" style=\"width:95%;text-align: center;\" /> " ;
                newTd3.innerHTML="<input class=\"detail\"  Id=\"txtZK"+i+"\"  name=\"txtZK\" value='"+ $("#discount").val()+"' type=\"text\" style=\"width:95%;text-align: right;\" /> " ;
                newTd4.innerHTML="<input class=\"detail\"  Id=\"txtAllmoney"+i+"\"  name=\"txtAllmoney\" type=\"text\" style=\"width:95%;text-align: right;\" /> " ;
                newTd5.innerHTML="<input class=\"detail\"  Id=\"txtjifen"+i+"\"  name=\"txtjifen\" type=\"text\" style=\"width:95%;text-align: center;\" /> " ;
                newTd6.innerHTML="<input class=\"detail\"  Id=\"txtpastdate"+i+"\" onclick=\"pastdate('"+i+"');\"  name=\"txtpastdate\" value=\"永久\" type=\"text\" style=\"width:95%;text-align: center;\" /> " ;
                newTd7.innerHTML="<input class=\"detail\"  Id=\"txtremark"+i+"\"  name=\"txtremark\" type=\"text\" style=\"width:95%;\" /> " ;
                newTd8.innerHTML='<img src="../../images/check_error.gif" onclick=\"GetRow()\"/>';

                newTd0.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd1.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd2.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd3.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd4.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd5.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd6.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
                newTd7.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";  
               newTd8.style.cssText="text-align: center;border-right-style: solid;border-right-width: 1px;border-right-color: #CCCCCC;border-top-style: solid;border-top-width: 1px;border-top-color: #CCCCCC;";
               Scount();
               Sum(i);
               SMoney();
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
             Scount();
             SMoney();
          }
        function Scount()//统计数量
        {
           var count=0;
           var txtNum=document.getElementsByName("txtNum");
           for (var x = 0; x < txtNum.length; x++) {
             count+=Number(txtNum[x].value);
           }
           document.getElementById("SCount").innerHTML=count;
           if(count>0)
           {
             document.getElementById("Button6").disabled=false;
           }
           else
           {
              document.getElementById("Button6").disabled=true;
           }
        }
        function SMoney()//统计总金额
        {
           var count=0;
           var txtAllmoney=document.getElementsByName("txtAllmoney");
           for (var y = 0; y < txtAllmoney.length; y++) {
             count+=Number(txtAllmoney[y].value);
           }
           SJiFen
           document.getElementById("SMoney").innerHTML=count.toFixed(2);
           var ssa=document.getElementById("Hidjifen").value;
           document.getElementById("SJiFen").innerHTML=parseInt(count.toFixed(2)*Number(document.getElementById("Hidjifen").value));
           $("#PayMoney").val(count.toFixed(2));
            $("#yingshou").html(count.toFixed(2));
           
        }
        function Sum(Id)//计算单行总金额
        {
           var aa=Id;
           document.getElementById("txtAllmoney"+Id).value=(Number(document.getElementById("txtPrice"+Id).value)*Number(document.getElementById("txtNum"+Id).value)*Number(document.getElementById("txtZK"+Id).value)).toFixed(2);
           var ssa=document.getElementById("Hidjifen").value;
           document.getElementById("txtjifen"+Id).value=parseInt(Number(document.getElementById("txtAllmoney"+Id).value)*Number(document.getElementById("Hidjifen").value));
           SMoney();
        }
        
        
        //选择有效期
        function  pastdate(id)
        {
            $('#txtidpast').val(id);
             $.ligerDialog.open({ target: $("#pastdates"),width:300,height:170,isHidden:true,title:"选择有效期" });
        }
        
        //确定选择有效期
        function pastok()
        {
            var id = $('#txtidpast').val();
            if($('#txtpast').val()!="")
            {
                $('#txtpastdate'+id).val($('#txtpast').val());
            }
            else
            {
                 $('#txtpastdate'+id).val("永久");
            }
            $.ligerDialog.hide({ target: $("#pastdates") });
            
        }
        //有效期判断
        function datepast()
        {
            var type = $('#ddlpast').val();
             $.ajax({
                    url:"AjaxSelectdate.aspx?type="+type+"",
                    type: "get",
                    cache: false,
                    success: function(date) {
                        $('#txtpast').val(date);
                    }
             });
        }
        
        //读取消费项目
        function addshop()
        {
          var txtmNum= $("#txtmnum").val();
            $.ajax({
                    url:"AjaxAdd.aspx?type=addshop&cNum="+txtmNum,
                    type: "get",
                    cache: false,
                    success: function(date) {
                        if (date == "false") {
                            f_alert2('warn', '项目编码不存在!');
                            clears();
                            return false;
                        }
                        else{
                        var sarry=new Array();
                        sarry=date.split('@');
                        add1(sarry[0],sarry[1],sarry[2]);
                      
                        clears();
                        }
                    }
                });
        }
        
        
        function clears()
        {
            $("#txtmnum").val('');
            document.getElementById('txtmnum').focus();
        }
        
        function loadcard()//读卡
        {
           $.ligerDialog.open({ target: $("#target1"),width:300,height:180,isHidden:true,title:"读取会员信息" });
           document.getElementById("txtpwd").focus();
        }
        
        //打印小票明细
        function aa() {
            var strj = "";
            var str1 = document.getElementsByName("txtnames");
            var str2 = document.getElementsByName("txtPrice");
            var str3 = document.getElementsByName("txtNum");
            var str4 = document.getElementsByName("txtAllmoney");
            for (i = 0; i < str1.length; i++) {
                if(str1[i].value!="")
                {
                strj += str1[i].value + "," + str2[i].value  +"," + str3[i].value+"," + str4[i].value+ "|";
                }

            }    
            return strj;
        }
        
        //消费明细
         function aabb() {
            var strj = "";
            var str1 = document.getElementsByName("txtnames");
            var str2 = document.getElementsByName("txtPrice");
            var str3 = document.getElementsByName("txtNum");
            var str4 = document.getElementsByName("txtAllmoney");
            var str5 = document.getElementsByName("txtcnum");
            var str6 =document.getElementsByName("txtZK");
            var str7 =document.getElementsByName("txtjifen");
            var str8 =document.getElementsByName("txtpastdate");
            for (i = 0; i < str1.length; i++) {
                if(str1[i].value!="")
                {
              strj += str1[i].value + "," + str2[i].value  +"," + str3[i].value+"," + str4[i].value+"," + str5[i].value+"," + str6[i].value+ "," + str7[i].value+ "," + str8[i].value+ "|";
                 }

            }    
            return strj;
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
                               ReLoadDis();
                            }
                    }
                });
        }
        function ReLoadDis()//重新加载折扣
        {
           var txtId=document.getElementsByName("CId");
           var txtZK=document.getElementsByName("txtZK");
           for (var y = 0; y < txtZK.length; y++) {
              txtZK[y].value=$("#discount").val();
               var Sarry=new Array();
                   Sarry=txtId[y].value.split('&');
                   Scount(); 
                   Sum(Sarry[0]);                  
                   SMoney();
           }
           
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
                          
                     }
            });
        }
        
        function checks()//结账
        {
            if($("#CardId").val()=="")
            {
               f_alert2('warn', '请先读卡!');
               return;
            }
            if($("#CardType").val()=="临时卡")
            {
               document.getElementById("ckchuz").disabled=true;
               document.getElementById("ckjifen").disabled=true;
               $('#ckCash').attr('checked','checked');
               $('#txtCash').val($("#PayMoney").val());
               $('#txtCash').attr('disabled','');
               
                 $('#ckchuz').attr('checked','');
               $('#txtchuz').val('0.00');
               $('#txtpassword').attr('disabled','disabled');
                $('#txtchuz').attr('disabled','disabled');
            }
            else
            {
               document.getElementById("ckchuz").disabled=false;
               document.getElementById("ckjifen").disabled=false;
               $('#ckchuz').attr('checked','checked');
               $('#txtchuz').val($("#PayMoney").val());
               $('#txtpassword').attr('disabled','');
                $('#txtchuz').attr('disabled','');
                
               $('#ckCash').attr('checked','');
               $('#txtCash').val('0.00');
               $('#txtCash').attr('disabled','disabled');
    
            }
            $.ligerDialog.open({ target: $("#checkDiv"),width:410,height:460,isHidden:true });
        }
        function checktype(Id,txtId,otherId,title)
        {
           if(document.getElementById(Id).checked==true)
           {
             document.getElementById(txtId).disabled=false;
             if(otherId!="")
             {
                 document.getElementById(otherId).disabled=false;
                 document.getElementById(otherId).value="";
             }
           }
           else
           {
             if(otherId!="")
             {
                 document.getElementById(otherId).disabled=true;
                  document.getElementById(otherId).value=title;
             }
              document.getElementById(txtId).disabled=true;
              document.getElementById(txtId).value="0.00";
           }
           Sumchange();
        }
        function Sumchange()//找零
        {
           var Count=0;
           Count=Number($("#txtCash").val())+Number($("#txtchuz").val())+Number($("#txtjf").val())+Number($("#txtyhk").val())+Number($("#txtother").val())-Number($("#PayMoney").val());

           if(Count<0)
           {
             Count=0;
           }
           document.getElementById("changes").innerHTML=Count.toFixed(2);
 
        }
        function Canelchange()//取消结账
        {
            if(document.getElementById("ckCash").checked==true)
            {
              document.getElementById("ckCash").click();
            }
            if(document.getElementById("ckchuz").checked==true)
            {
              document.getElementById("ckchuz").click();
            }
            if(document.getElementById("ckjifen").checked==true)
            {
              document.getElementById("ckjifen").click();
            }
            if(document.getElementById("ckbank").checked==true)
            {
              document.getElementById("ckbank").click();
            }
            if(document.getElementById("ckother").checked==true)
            {
              document.getElementById("ckother").click();
            }
            $.ligerDialog.hide({ target: $("#checkDiv") });
        }
        function postChange()//结账提交
        {
        
           var Count=0;//计算金额
           Count=Number($("#txtCash").val())+Number($("#txtchuz").val())+Number($("#txtjf").val())+Number($("#txtyhk").val())+Number($("#txtother").val())-Number($("#PayMoney").val());
           var shishou = Number($("#txtCash").val())+Number($("#txtchuz").val())+Number($("#txtjf").val())+Number($("#txtyhk").val())+Number($("#txtother").val());
           
           if(Count<0)
           {
             f_alert2('warn', '实付金额不足!');
             return;
           }
           
            var CardId= $("#CardId").val();
            var txtpassword="";
            var PayMoney=$("#PayMoney").val();
            var txtname=$("#txtname").val();
            var SJiFen= document.getElementById("SJiFen").innerHTML;
            var txtremark= $("#txtremark").val();
            var _strczzf=0;
            var strPayType="";
            if(document.getElementById("ckCash").checked==true)
            {
               strPayType+="现金*"+$("#txtCash").val()+"*|";
            }
            if(document.getElementById("ckchuz").checked==true)
            {
               strPayType+="储值*"+$("#txtchuz").val()+"*|";
               if($("#txtpassword").val()!=$("#HidPwd").val())
               {
                   f_alert2('warn', '支付密码错误!');
                   return;
               }
               if(Number($("#txtchuz").val()) > Number($("#PayMoney").val()))
               {
                   f_alert2('warn', '储值支付金额不能大于实际金额!');
                   return;
               }
               if(Number($("#txtchuz").val()) > Number($("#txtBalance").val()))
               {
                   f_alert2('warn', '储值余额不足!');
                   return;
               }
               _strczzf=$("#txtchuz").val();
            }
            if(document.getElementById("ckjifen").checked==true)
            {
               strPayType+="积分*"+$("#txtjf").val()+"*|";
               
            }
            if(document.getElementById("ckbank").checked==true)
            {
               strPayType+="银行*"+$("#txtyhk").val()+"*"+$("#txtaccount").val()+"|";
            }
            if(document.getElementById("ckother").checked==true)
            {
               strPayType+="其他*"+$("#txtother").val()+"*"+$("#txtothermark").val()+"|";
            }
            $.ajax({
                    url:encodeURI("AjaxAdd.aspx?liushui=<%=liushui %>&type=change&CardId="+CardId+"&txtremark="+txtremark+"&PayMoney="+PayMoney+"&txtname="+txtname+"&PayType="+strPayType+"&txtchuz="+_strczzf+"&CardType="+$("#CardType").val()+"&SJiFen="+SJiFen+"&cash="+$("#txtCash").val()+"&blance="+$("#txtchuz").val()+"&bank="+$("#txtyhk").val()+"&jifen="+$("#txtjf").val()+"&elses="+$("#txtother").val()+"&zhaoling="+$("#changes").html()+"&detail=" + aabb()),
                    type: "get",
                    cache: false,
                    success: function(date) {
                       if(date=="false")
                       {
                           f_alert2('warn', '支付失败!');
                       }
                       else
                       {
                             //打印
                           if($('#zddyxp').attr('checked')==true)
                           {
                                     var url="liushui=<%=liushui %>&CardId=" + $("#CardId").val() + "&yingshou=" + $("#PayMoney").val() + "&shishou=" + shishou + "&yingzhao=" + $('#changes').html() + "&jifen=" + $('#SJiFen').html() + "&SCount=" + $('#SCount').html() + "&detail=" + aa() + "";
                                         url=encodeURI(encodeURI(url)); 
                                     var RadNum = Math.random();
                                    window.showModalDialog('printtext.aspx?'+url+'&Radstr=' + RadNum, '', 'dialogWidth:200px;DialogHeight=50px;status:no;help:no;resizable:yes;');           
                                    
                           }
                      
                       
                           //初始化数据
                           $("#PayMoney").val('0.00');
                           Canelchange();
                           var tb = document.getElementById('newTB');
                           var rowNum=tb.rows.length;
                           for (var z=1;z<rowNum;z++)
                           {
                               tb.deleteRow(z);
                               rowNum=rowNum-1;
                               z=z-1;
                           }
                             $("#CardType").val('');
                             $("#txtLevels").val('');
                             $("#txtname").val('');
                             $("#txtBalance").val('');
                             $("#txtDate").val('');
                             $("#CardId").val('');
                           
                            Scount();
                            SMoney();
                            
                            
                           //初始化数据结束    
                            f_alert2('success', '支付成功!');
                           
                   
                       }
                    }
                });
        }
        
    function checknum(obj)
    {
      obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
      obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
      obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
      obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
      Sumchange();
    }
    
    //获取应付金额
    function paynian(idd)
    {
        var panmoney = $('#PayMoney').val();
        $('#'+idd).val(panmoney);
    }
    
     function keyLogin(){  
        if (event.keyCode==13)
        {   //回车键的键值为13
            if(document.getElementById("txtmnum").value!="")
            {
             addshop();
            }
            
            if(document.getElementById("txtpwd").value!="")
            {
            postDate();
            document.getElementById("txtmnum").focus();
            }
        }
    } 
    
   function clearpww()
   {
          $('#txtpwd').val("");
        document.getElementById("txtpwd").focus();
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
    <input id="HidPwd" type="hidden" />
    <input id="Hidjifen" type="hidden" value="0" />
    <input id="discount" type="hidden" value="1.00" />
    <div class="divall" id="alll">
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="left" title="消费项目类别" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="消费项目列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <div class="search_box" style="float: left">
                            商品编码：<input id="txtmnum" type="text" class="txtInput2" style="width: 120px;" runat="server" />
                            <input id="Button2" type="button" value="添 加" class=" btnInput" onclick="addshop();" />
                            <input id="Button1" type="button" value="清 空" class=" btnInput" onclick="clears();" />
                        </div>
                    </div>
                </div>
                <div style="width: 100%; height: 200px; overflow-y: scroll; border-bottom-style: solid;
                    border-bottom-width: 1px; border-bottom-color: #95b8e7; border-left-style: solid;
                    border-left-width: 1px; border-left-color: #95b8e7; border-right-style: solid;
                    border-right-width: 1px; border-right-color: #95b8e7;">
                    <table id="newTB" style="width: 97%; border-top-style: solid; border-bottom-style: solid;
                        border-left-style: solid; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px;
                        border-top-color: #CCCCCC; border-bottom-color: #CCCCCC; border-left-color: #CCCCCC;">
                        <tr>
                            <th style="width: 150px" class="msttop">
                                消费项目
                            </th>
                            <th style="width: 80px" class="msttop">
                                单价(元)
                            </th>
                            <th style="width: 80px" class="msttop">
                                增加次数
                            </th>
                            <th style="width: 80px" class="msttop">
                                折扣系数
                            </th>
                            <th style="width: 100px" class="msttop">
                                折后金额
                            </th>
                            <th style="width: 60px" class="msttop">
                                积分
                            </th>
                            <th style="width: 100px" class="msttop">
                                有效期
                            </th>
                            <th style="width: 100px" class="msttop">
                                备注
                            </th>
                            <th style="width: 80px" class="msttop">
                                操作
                            </th>
                        </tr>
                    </table>
                </div>
                <div class="divgirdbottom" style="text-align: left;">
                    &nbsp;&nbsp; 合计：[<span style="color: Red;">总次数</span><span id="SCount" style="color: Red;">0</span>][<span
                        style="color: Red;">总金额</span><span id="SMoney" style="color: Red;">0</span>][<span
                            style="color: Red;">总积分</span><span id="SJiFen" style="color: Red;">0</span>]
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px; text-align: right; padding-right: 15px;">
                    <input id="Button3" type="button" value="读 卡" class=" btnInput" onclick="loadcard();" />
                    <input id="Button5" type="button" value="清 空" class=" btnInput" onclick="ClearDate();" />
                    <input id="Button6" type="button" value="充 次" class=" btnInput" onclick="checks();"
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
        <!--选择有效期-->
        <div id="pastdates" style="width: 260px; margin: 3px; display: none; height: 50px;">
            <fieldset align="middle" class="FieldSet" style="width: 240px; height: 100px; margin-left: 10px;
                text-align: center; float: left; padding-top: 10px;">
                <legend><font color="#0000ff">选择有效期</font></legend>
                <div style="margin-top: 15px; color: Black;">
                    <table>
                        <tr>
                            <td>
                                日期:
                                <select id="ddlpast" onchange="datepast();">
                                    <option value="100">永久</option>
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
        <!--结账开始-->
        <div id="checkDiv" style="width: 98%; height: 410px; display: none;">
            <div style="width: 100%; height: 50px; line-height: 50px;">
                <span style="font-size: 14px; font-weight: bold; margin-left: 10px; color: Black;">应付金额:&nbsp;
                </span>
                <input id="PayMoney" readonly="readonly" type="text" class="txtInput2" style="width: 130px;
                    height: 30px; line-height: 30px; font-size: 22px; font-weight: bold; color: Blue"
                    runat="server" value="10.00" />
            </div>
            <div class="divgirdbottom" style="width: 100%; border-top-style: solid; border-top-width: 1px;
                border-top-color: #95b8e7;">
                支付方式
            </div>
            <div style="width: 100%; padding-top: 10px; border-left-style: solid; border-right-style: solid;
                border-right-width: 1px; border-left-width: 1px; border-right-color: #95b8e7;
                border-left-color: #95b8e7;">
                <table style="width: 95%; margin-left: 5px;">
                    <tr style="height: 35px;">
                        <td style="font-size: 12px; font-weight: bold; width: 90px; color: Black;">
                            <input id="ckchuz" type="checkbox" onclick="paynian('txtchuz');checktype('ckchuz','txtchuz','txtpassword','请输入密码...')" />储值支付:
                        </td>
                        <td style="width: 130px; font-size: 12px; font-weight: bold; color: Black; line-height: 35px;">
                            <input id="txtchuz" type="text" class="txtInput2" style="width: 100px; height: 30px;
                                line-height: 30px; font-size: 22px; font-weight: bold; color: red;" disabled="disabled"
                                runat="server" value="0.00" onchange="Sumchange();" onkeyup="checknum(this);" />&nbsp;元
                        </td>
                        <td>
                            <input id="txtpassword" type="password" class="txtInput2" style="width: 130px;" runat="server"
                                disabled="disabled" value="请输入密码..." />
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="font-size: 12px; font-weight: bold; width: 90px; color: Black;">
                            <input id="ckCash" type="checkbox" onclick="paynian('txtCash');checktype('ckCash','txtCash','')" />现金支付:
                        </td>
                        <td style="width: 130px; font-size: 12px; font-weight: bold; color: Black; line-height: 35px;">
                            <input id="txtCash" type="text" class="txtInput2" style="width: 100px; height: 30px;
                                line-height: 30px; font-size: 22px; font-weight: bold; color: red;" disabled="disabled"
                                runat="server" value="0.00" onchange="Sumchange();" onkeyup="checknum(this);" />&nbsp;元
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="font-size: 12px; font-weight: bold; width: 90px; color: Black;">
                            <input id="ckbank" type="checkbox" onclick="paynian('txtyhk');checktype('ckbank','txtyhk','txtaccount','请输入银行卡号...')" />银行卡支付:
                        </td>
                        <td style="width: 130px; font-size: 12px; font-weight: bold; color: Black; line-height: 35px;">
                            <input id="txtyhk" type="text" class="txtInput2" style="width: 100px; height: 30px;
                                line-height: 30px; font-size: 22px; font-weight: bold; color: red;" disabled="disabled"
                                runat="server" value="0.00" onchange="Sumchange();" onkeyup="checknum(this);" />&nbsp;元
                        </td>
                        <td>
                            <input id="txtaccount" type="text" class="txtInput2" style="width: 130px;" runat="server"
                                disabled="disabled" value="请输入银行卡号..." />
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="font-size: 12px; font-weight: bold; width: 90px; color: Black;">
                            <input id="ckjifen" type="checkbox" onclick="checktype('ckjifen','txtjf','')" />积分抵现:
                        </td>
                        <td style="width: 130px; font-size: 12px; font-weight: bold; color: Black; line-height: 35px;">
                            <input id="txtjf" type="text" class="txtInput2" style="width: 100px; height: 30px;
                                line-height: 30px; font-size: 22px; font-weight: bold; color: red;" disabled="disabled"
                                runat="server" value="0.00" onchange="Sumchange();" onkeyup="checknum(this);" />&nbsp;元
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr style="height: 35px;">
                        <td style="font-size: 12px; font-weight: bold; width: 90px; color: Black;">
                            <input id="ckother" type="checkbox" onclick="checktype('ckother','txtother','txtothermark','请输入备注...')" />其他:
                        </td>
                        <td style="width: 130px; font-size: 12px; font-weight: bold; color: Black; line-height: 35px;">
                            <input id="txtother" type="text" class="txtInput2" style="width: 100px; height: 30px;
                                line-height: 30px; font-size: 22px; font-weight: bold; color: red;" disabled="disabled"
                                runat="server" value="0.00" onchange="Sumchange();" onkeyup="checknum(this);" />&nbsp;元
                        </td>
                        <td>
                            <input id="txtothermark" type="text" class="txtInput2" style="width: 130px;" runat="server"
                                disabled="disabled" value="请输入备注..." />
                        </td>
                    </tr>
                </table>
                <div style="width: 100%; margin-top: 10px;">
                    <span style="font-weight: bold; font-size: 24px; color: Black;">&nbsp;&nbsp;&nbsp; 找零：&nbsp;&nbsp;
                    </span>&nbsp;<span id="changes" style="font-weight: bold; font-size: 24px; color: Red;">0.00</span><span
                        style="font-weight: bold; font-size: 24px; color: Red;"> 元</span>
                </div>
                <div style="width: 100%; background-color: #E7EEFF; height: 95px; margin-top: 10px;
                    border-top-style: solid; border-bottom-style: solid; border-top-width: 1px; border-bottom-width: 1px;
                    border-top-color: #95b8e7; border-bottom-color: #95b8e7;">
                    <table style="width: 95%; margin-top: 10px; margin-left: 10px;">
                        <tr>
                            <td>
                                备注:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="txtremark" type="text" class="txtInput2" style="width: 250px;" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="zddyxp" type="checkbox" />自动打印小票
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; padding-top: 10px;">
                                <input id="Button7" type="button" value="确 认" class="btnSearch" onclick="postChange();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="Button8" type="button" value="取 消" class="btnSearch" onclick="Canelchange();" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <!--结账结束-->
    </div>
    </form>
</body>
</html>
