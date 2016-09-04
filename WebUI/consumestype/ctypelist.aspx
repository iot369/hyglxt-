<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ctypelist.aspx.cs" Inherits="ctypelist" %>

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
            leftWidth: 140,
            heightDiff: 0
        })
    });
    
     $(function() {

    
           $('#divinfo').attr("disabled","disabled");
           $('#shopxian').attr("disabled","disabled");
       
    });
    
     $(function () {
               $("#txtzhe").ligerSpinner({ height: 20,Width: 107,type: 'float',maxValue:1, readonly: false});
                $("#txtjifen").ligerSpinner({ height: 20,Width: 107, type: 'int',minValue:1, readonly: false });
                
             
           });
    
   
    </script>

    <script type="text/javascript">
    
      function bcc() {
            if ($("#addup").val() == "add") {
            var shopstr="";
            if($('#checkshops').attr("checked")==true)
            {
                shopstr=shopstrs(); 
            }
            else{shopstr="所有店铺";}
                if ($("#txtname").val() != "" && $("#txtremark").val() != "") {
                    var url="tname=" + $('#txtname').val() + "&remark=" + $('#txtremark').val() + "&shopstr=" + shopstr + ""; 
                         url=encodeURI(encodeURI(url)); 
                         $.ajax({
                            url: "Ajaxctypeadd.aspx?"+url,
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
                 var shopstr="";
                if($('#checkshops').attr("checked")==true)
                {
                    shopstr=shopstrs(); 
                }
                else{shopstr="所有店铺";}
                if ($("#txtname").val() != "" && $("#txtremark").val() != "" ) {
                var url="tnum="+$("#txttnum").val()+"&tname=" + $('#txtname').val() + "&remark=" + $('#txtremark').val() + "&shopstr=" + shopstr + ""; 
                         url=encodeURI(encodeURI(url)); 
                         $.ajax({
                            url: "Ajaxctypeedit.aspx?"+url,
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
        
        //限定店铺
        function shopstrs()
        {
             var ax ="";
            var xxx = document.getElementsByName("checkshop");
            for(i=0;i<xxx.length;i++)
            {
                if(xxx[i].checked== true)
                {
                    ax += xxx[i].value+"|";
                   
                }
            }
             return ax;
            
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
            url: "Ajaxctypeselect.aspx?tnum="+nums+"",
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
                   if(str[2]!="所有店铺") 
                   {
                        $(".checkall").attr("checked","");
                        $('#checkshops').attr("checked","checked");
                        $('#shopxian').attr("disabled","");
                          var strs = new Array();
                              strs = str[2].substring(0, str[2].length - 1).split("|");
                              for (var i = 0; i < strs.length; i++)
                              {
                                      $('#'+strs[i]).attr("checked","checked");
                              }
                        
                   }
                   else{
                        $('#checkshops').attr("checked","");
                        $('#shopxian').attr("disabled","disabled");
                         $(".checkall").attr("checked","");
                        
                   }                          
                }

            }
        })
        
    }

      //所有
    function alll() {
   
        $('#divinfo').attr("disabled","disabled");
        $('#shopxian').attr("disabled","disabled");
       $('#txtname').val("");
       $('#txtremark').val("");
       $('#dels').attr("disabled","disabled");
       $('#bc').attr("disabled","disabled");
       $('#adds').attr("disabled","");
        $('#checkshops').attr("checked","");
       $(".checkall").attr("checked","");
                   
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
    }
    //限定店铺
    function shopif()
    {
            if($('#checkshops').attr("checked")==false)
            {
                $('#shopxian').attr("disabled","disabled");
                 $(".checkall").attr("checked","");
            }
            else
            {
                $('#shopxian').attr("disabled","");
            }
    }
    
    //删除
    function deletemem() {
        var num = $("#txttnum").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除该会员等级吗？',
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
            url: "Ajaxctypedel.aspx?tnum=" + tnum + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "true") {
                    f_alert2('warn', '删除成功！');
                      alll(); 
                      delone(tnum);
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
            <input id="txttnum" type="text" runat="server" style="display: none;" />
            <div position="left" title="消费项目类别" id="levellist">
                <%=strc %>
            </div>
            <div position="center" title="项目类别信息" style="padding: 2px; background-color: White;">
                <table class="addedit" id="divinfo">
                    <tr>
                        <th>
                            类别名称：
                        </th>
                        <td>
                            <input id="txtname" type="text" class="txtInput2" style="width: 100px;" onchange="checkmemnum();"
                                runat="server" /><span class="spanxing">*</span>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            描述：
                        </th>
                        <td>
                            <input id="txtremark" type="text" class="txtInput2" style="width: 250px;" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input id="checkshops" type="checkbox" onclick="shopif();" />限定使用店铺
                        </td>
                    </tr>
                </table>
                <div id="shopxian">
                    <div style="position: absolute; top: 80px; width: 99%">
                        <table class="GridBar">
                            <tr>
                                <th style="width: 40px;">
                                    选择
                                </th>
                                <th>
                                    店面
                                </th>
                            </tr>
                        </table>
                    </div>
                    <div style="width: 100%; height: 250px; margin-top: 2px; overflow-x: hidden; overflow-y: auto;">
                        <table class="GridBar" style="width: 100%">
                            <tr>
                                <th style="width: 40px;">
                                    选择
                                </th>
                                <th>
                                    店面
                                </th>
                            </tr>
                            <%=shophtml %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
