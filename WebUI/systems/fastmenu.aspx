<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fastmenu.aspx.cs" Inherits="fastmenu" %>

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

    <!--------------加载页面------------>

    <script type="text/javascript">
    $(function() {
        $("#tree1").ligerTree({
            checkbox: true
        });
        $("#tree2").ligerTree({
            checkbox: false
        });
        $("#tree3").ligerTree({
            checkbox: false,
            parentIcon: null,
            childIcon: null
        })
         
    });
   
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        })
    });
    
   
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

    <script type="text/javascript">
     //二级菜单
        function tworoles()
        {
             var ax ="";
            var xxx = document.getElementsByName("two");
            for(i=0;i<xxx.length;i++)
            {
                if(xxx[i].checked== true)
                {
                    ax += xxx[i].value+"|";
                   
                }
            }
             return ax ;
            
        }
        
        function okll()
        {
           var str= tworoles();
          
                    var url="fast=" + str + ""; 
                         url=encodeURI(encodeURI(url)); 
                         $.ajax({
                            url: "Ajaxfast.aspx?"+url,
                            type: "get",
                            cache: false,
                            success: function(date) {
                                if (date == "false") {
                                       f_alert2('warn', '保存失败，请联系管理员！'); 
                                } else {
                                    
                                    f_alert2('warn', '保存成功！');
                                         
                                }
                            }
                   })

        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="divall">
        <div class="tools_box">
            <div class="tools_bar">
                <a class="tools_btn" onclick="okll();"><span><b class="import">保存</b></span></a>
            </div>
        </div>
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="center" title="用户桌面快捷方式" style="padding: 2px;">
                <%=menuhtml %>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
