<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会员系统</title>
    <link href="../lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />

    <script src="../lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/core/base.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

    <script src="../lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>

    <link href="../css/forms.css" rel="stylesheet" type="text/css" />
    <style>
        html
        {
            overflow: hidden;
        }
    </style>
    <!--------下拉菜单--------->

    <script type="text/javascript">
        function initMenu() {
          $('#sidemenu ul').hide();
          $('#sidemenu ul:first').hide();
          $('#sidemenu li a').click(
            function() {
              var checkElement = $(this).next();
              if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                return false;
                }
              if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('#sidemenu ul:visible').slideUp('normal');
                checkElement.slideDown('normal');
                return false;
                }
              }
            );
          }
        $(document).ready(function() {initMenu();});
    </script>

    <script>
    window.setInterval("s()", 3000);
       function s()
        {
            $.ajax({
                    url: "Ajaxcheck.aspx",
                    type: "get",
                    cache: false,
                    success: function(date) {
                     if(date=="false")
                     {
                        var manager = $.ligerDialog.waitting('登录信息失效，请重新登录...');
                        setTimeout(function (){ ll(); }, 1000);
                     }  
                  }
            })
        }
        
     function ll()
     {
        window.location.href="../index.aspx";
     }
    
    function chongzhi(xx)
    {
        f_opensadd('370','620','../membusiness/recharge.aspx?mnum='+xx+'','会员充值','addss');
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
            title: title,
            buttons: [
            {
                text: '关闭',
                onclick: function(item, dialog) {     
                    dialog.close();
                }
            }]
        })
        i++;
    }
    </script>

</head>
<body style="overflow: hidden; background: url(images/desk.jpg) repeat  center center;">
    <form runat="server" id="form">
    <div id="winlinks">
        <ul>
        </ul>
    </div>
    <div style="color: White; float: right; margin-right: 20px; margin-top: 20px;">
        <span>您好,<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;。&nbsp;<asp:LinkButton
            ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click">退出系统!</asp:LinkButton></span>
    </div>
    <div style="color: White; position: absolute; top: 50px; right: 10px;">
        <div class="leftbar">
            <ul id="sidemenu">
                <%-- <li><a style="cursor: pointer;">+ 网页菜单类素材一</a>
                    <ul>
                        <li><a href="#">下滑菜单</a></li>
                        <li><a href="#">折叠菜单</a></li>
                        <li><a href="#">垂直菜单</a></li>
                    </ul>
                </li>--%>
                <%=menuhtml%>
            </ul>
        </div>
    </div>
    </form>
</body>

<script type="text/javascript">
    var LINKWIDTH = 90, LINKHEIGHT = 90, TASKBARHEIGHT = 43;
    var winlinksul =  $("#winlinks ul");
    function f_open(url, title, icon,w,h) {

        var win = $.ligerDialog.open(
        { height: h, url: url, width: w, showMax: false, showToggle: true, showMin: true, isResize: true, modal: false, title: title, slide: false
        });
        var task = jQuery.ligerui.win.tasks[win.id];
        if (task) {
            $(".l-taskbar-task-icon:first", task).html('<img src="' + icon + '" />');
        }
        return win;
       
    }
    var links = [
           <%=htm %>
        ];
        
      
    function onResize() {
        var linksHeight = $(window).height() - TASKBARHEIGHT;
        var winlinks = $("#winlinks");
        winlinks.height(linksHeight);
        var colMaxNumber = parseInt(linksHeight / LINKHEIGHT);//一列最多显示几个快捷方式
        for (var i = 0, l = links.length; i < l; i++) {
            var link = links[i];
            var jlink = $("li[linkindex=" + i + "]", winlinks);
            var top = (i % colMaxNumber) * LINKHEIGHT, left = parseInt(i / colMaxNumber) * LINKWIDTH;
            if (isNaN(top) || isNaN(left)) continue;
            jlink.css({ top: top, left: left });
        }
    }
    function linksInit() {
        for (var i = 0, l = links.length; i < l; i++) {
            var link = links[i];
            var jlink;
            var jlink = $("<li></li>");
            jlink.attr("linkindex", i);
            jlink.append("<img src='" + link.icon + "' />");
            jlink.append("<span>" + link.title + "</span>");
            jlink.append("<div class='bg'></div>");
            jlink.hover(function () {
                $(this).addClass("l-over");
            }, function () {
                $(this).removeClass("l-over");
            }).click(function () {
                var linkindex = $(this).attr("linkindex");
                var link = links[linkindex];
                var RadNum = Math.random();
                f_open(link.url+'?Str='+RadNum, link.title, link.icon,link.w,link.h);
            });
            jlink.appendTo(winlinksul);
        }
    }

    $(window).resize(onResize);
    $.ligerui.win.removeTaskbar = function () { }; //不允许移除
    $.ligerui.win.createTaskbar(); //页面加载时创建任务栏
    linksInit();
    onResize();

</script>

</html>
