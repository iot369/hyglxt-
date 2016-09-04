<%@ Page Language="C#" AutoEventWireup="true" CodeFile="smslist.aspx.cs" Inherits="smslist" %>

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
         $("#tree1").ligerTree({ checkbox: false });
            $("#tree2").ligerTree({ checkbox: false });
            $("#tree3").ligerTree({ checkbox: false, parentIcon: null, childIcon: null });
    
    });
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 140,
            heightDiff: 0
        })
    });
    
     $(function() {

           $('#divinfo').attr("disabled","disabled");
       
    });
   
   
    </script>

    <script type="text/javascript">
    
      function bcc() {
            if ($("#addup").val() == "add") {
            var twostr=tworoles();
            var threestr =threerole();
           var onestr= oneroles();
                if ($("#txtname").val() != "") {
                    var url="tname=" + $('#txtname').val() + "&remark=" + $('#txtremark').val() + "&twostr=" + twostr + "&threestr=" + threestr + "&onestr=" + onestr + ""; 
                         url=encodeURI(encodeURI(url)); 
                         $.ajax({
                            url: "rolesadd.aspx?"+url,
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

                } 
                else {
                    f_alert2('warn', '请完整填写必要信息！');
                }
            } 
            else {
                var twostr=tworoles();
            var threestr =threerole();
           var onestr= oneroles();
                if ($("#txtname").val() != "" ) {
                var url="tnum="+$("#txttnum").val()+"&tname=" + $('#txtname').val() + "&remark=" + $('#txtremark').val() + "&twostr=" + twostr + "&threestr=" + threestr + "&onestr=" + onestr + ""; 
                         url=encodeURI(encodeURI(url)); 
                         $.ajax({
                            url: "rolesedit.aspx?"+url,
                            type: "get",
                            cache: false,
                            success: function(date) {
                                if (date == "false") {
                                       f_alert2('warn', '修改失败，请联系管理员！'); 
                                } else {
                                    
                                    f_alert2('warn', '修改成功！');
                                    upone($('#txtlevel').val(),$('#txtname').val());
                                     $('#bc').attr("disabled","disabled");       
                                }
                            }
                        })

                } 
                else {
                       f_alert2('warn', '请完整填写必要信息！');
                  }
             }
        }
        
        //二级菜单单击
        function twoclickk(twonum)
        {
            var twoumm = twonum.substring(0,2);
           
                var xxx = document.getElementsByName("tworole");
                for(i=0;i<xxx.length;i++)
                {
                    var xx =  xxx[i].value 
                    if(xx.indexOf(twoumm)==0)
                    {
                        if(xxx[i].checked==true)
                        {
                            $('#'+twoumm).attr("checked","checked");
                            return;
                        }
                       else
                       {
                        $('#'+twoumm).attr("checked","");
                        
                       } 
                    }
                }
        }
         //三级菜单单击
        function threeclickk(threenum)
        {
             var twoumm = threenum.substring(0,4);
           
                var xxx = document.getElementsByName("threerole");
                for(i=0;i<xxx.length;i++)
                {
                    var xx =  xxx[i].value 
                    if(xx.indexOf(twoumm)==0)
                    {
                        if(xxx[i].checked==true)
                        {
                            $('#'+twoumm).attr("checked","checked");
                            return;
                        }
                       else
                       {
                        $('#'+twoumm).attr("checked","");
                        
                       } 
                    }
                }

        }
         //二级菜单
        function oneroles()
        {
             var ax ="";
            var xxx = document.getElementsByName("onerole");
            for(i=0;i<xxx.length;i++)
            {
                if(xxx[i].checked== true)
                {
                    ax += xxx[i].value+"|";
                   
                }
            }
             return ax;
            
        }
        //二级菜单
        function tworoles()
        {
             var ax ="";
            var xxx = document.getElementsByName("tworole");
            for(i=0;i<xxx.length;i++)
            {
                if(xxx[i].checked== true)
                {
                    ax += xxx[i].value+"|";
                   
                }
            }
             return ax;
            
        }
        //三级权限按钮
        function threerole()
        {
              var ax ="";
            var xxx = document.getElementsByName("threerole");
            for(i=0;i<xxx.length;i++)
            {
                if(xxx[i].checked== true)
                {
                    ax += xxx[i].value+"|";
                   
                }
            }
             return ax;
        }
        //二级全部
        function twoall(trole)
        {
            if($('#'+trole).attr("checked")==true)
            {
                 var xxx = document.getElementsByName("tworole");
                for(i=0;i<xxx.length;i++)
                {
                    var xx =  xxx[i].value 
                    if(xx.indexOf(trole)==0)
                    {
                        xxx[i].checked= true;  
                    }
                }
            }
            else
            {
                 var xxx = document.getElementsByName("tworole");
                for(i=0;i<xxx.length;i++)
                {
                    var xx =  xxx[i].value 
                    if(xx.indexOf(trole)==0)
                    {
                        xxx[i].checked= false;  
                      }
                  
                }
                }
        }
          //二级全部
        function threeall(trole)
        {
            if($('#'+trole).attr("checked")==true)
            {
                 var xxx = document.getElementsByName("threerole");
                for(i=0;i<xxx.length;i++)
                {
                    var xx =  xxx[i].value 
                    if(xx.indexOf(trole)==0)
                    {
                        xxx[i].checked = true;  
                    }
                }
            }
            else
            {
                 var xxx = document.getElementsByName("threerole");
                for(i=0;i<xxx.length;i++)
                {
                    var xx =  xxx[i].value 
                    if(xx.indexOf(trole)==0)
                    {
                        xxx[i].checked = false;  
                    }
                }
            }
        }
        
        
      
        function upone(lnum,lname)
        {
            $('#'+lnum).html(lname);
        }
        
        function delone(tnum)
        {
            $('#l'+tnum).css('display','none');
        }


     function selectt(nums) {
       $("#txttnum").val(nums);
          $.ajax({
            url: "Ajaxrolelist.aspx?tnum="+nums+"",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "false") {
                    f_alert2('warn', '消费类目信息出错，请联系管理员！');
                       $("#txtlevel").val("");
                } else {
               var str = new Array();
                   str = date.split("&");
                   $('#txtname').val(str[0]);
                    $('#txtremark').val(str[1]);
                       $('#dels').attr("disabled","");
                          $('#bc').attr("disabled","");
                          $('#divinfo').attr("disabled","");
                          $('#adds').attr("disabled","disabled");
                          $("#addup").val("up"); 
                         $(".one").attr("checked","");
                        $(".two").attr("checked","");
                        $(".three").attr("checked","");
                        
//                        if(nums=="10000")
//                        {
//                            $('#dels').attr("disabled","disabled");
//                          $('#bc').attr("disabled","disabled");
//                                  $('#divinfo').attr("disabled","disabled");
//                            }
                          
                   if(str[2]!="") 
                   {
                          var strs = new Array();
                              strs = str[2].substring(0, str[2].length - 1).split("|");
                              for (var i = 0; i < strs.length; i++)
                              {
                                      $('#'+strs[i]).attr("checked","checked");
                              }
                        
                   }
                   else{     
                   }
                   if(str[3]!="") 
                   {
                  
                          var strs = new Array();
                              strs = str[3].substring(0, str[3].length - 1).split("|");
                              for (var i = 0; i < strs.length; i++)
                              {
                                      $('#'+strs[i]).attr("checked","checked");
                              }
                        
                   }
                   else{      
                   } 
                    if(str[4]!="") 
                   {
                  
                          var strs = new Array();
                              strs = str[4].substring(0, str[4].length - 1).split("|");
                              for (var i = 0; i < strs.length; i++)
                              {
                                      $('#'+strs[i]).attr("checked","checked");
                              }
                        
                   }
                   else{     
                   }                            
                
                
                }

            }
        })
        
    }

      //所有
    function alll() {
   
        $('#divinfo').attr("disabled","disabled");
       $('#txtname').val("");
       $('#txtremark').val("");
       $('#dels').attr("disabled","disabled");
       $('#bc').attr("disabled","disabled");
       $('#adds').attr("disabled","");
        $(".one").attr("checked","");
        $(".two").attr("checked","");
        $(".three").attr("checked","");
                   
    }
   
    //添加按钮 
    function addss()
    {

       $('#adds').attr("disabled","disabled");
       $('#divinfo').attr("disabled","");
       $('#bc').attr("disabled","");
       $("#addup").val("add");
       $('#txtname').val("");
       $('#txtremark').val("");
         $(".one").attr("checked","");
        $(".two").attr("checked","");
        $(".three").attr("checked","");
    }

    
    //删除
    function deletemem() {
        var num = $("#txttnum").val();
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
        var tnum = $("#txttnum").val();
        $.ajax({
            url: "Ajaxdel.aspx?tnum=" + tnum + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "true") {
                    f_alert2('warn', '删除成功！');
                      alll(); 
                      delone(tnum);
                } else if(date == "No") {
                    f_alert2('warn', '该角色下存在用户,不能删除！');
                }else if(date == "NN"){
                    f_alert2('warn', '该角色权限不能删除！');
                }else{
                f_alert2('warn', '删除失败,请联系管理员！');
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
                    <asp:Button ID="Button1" runat="server" Text="刷新类别" Style="display: none;"  />
                </div>
            </div>
        </div>
        <div id="layout1">
            <input id="addup" type="text" runat="server" style="display: none;" />
            <input id="txttnum" type="text" runat="server" style="display: none;" />
            <div position="left" title="短信模板" id="levellist">
                
            </div>
            <div position="center" title="短信模板信息" style="padding: 2px; background-color: White;
                overflow-y: auto; overflow-x: hidden;">
                <div id="divinfo">
                    <table class="addedit" id="divinfo" style="width: 300px;">
                        <tr>
                            <th>
                                模板名称：
                            </th>
                            <td>
                                <input id="txtname" type="text" class="txtInput2" style="width: 100px;" onchange="checkmemnum();"
                                    runat="server" /><span class="spanxing">*</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                是否可用：
                            </th>
                            <td>
                                <input id="Text1" type="text" class="txtInput2" style="width: 100px;" onchange="checkmemnum();"
                                    runat="server" /><span class="spanxing">*</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                短信内容：
                            </th>
                            <td>
                                <input id="txtremark" type="text" class="txtInput2" style="width: 230px;" runat="server" />
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
