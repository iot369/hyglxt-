<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebForm1.aspx.cs" Inherits="WebForm1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>弹出层</title>

    <script language="javascript" type="text/javascript"> 
    //登陆弹出对话框，并使背景元素不可用
    var div_width = 400;
    var div_height = 300;
    function showWindow(width,height)
    { 
    location.href="#";
    width = div_width;
    height = div_heightvar;
    windowstr= document.getElementById("popLayer").innerHTML;
    document.getElementById("infoDiv").innerHTML=windowstr;
     document.getElementById("infoDiv").style.left=((document.body.clientWidth-width)>0?(document.body.clientWidth-width):0)/2+"px";
      document.getElementById("infoDiv").style.top=200+"px"; 
      document.getElementById("infoDiv").style.zIndex=1;
      document.getElementById("infoDiv").style.width=width;
       document.getElementById("infoDiv").style.height=height;
        document.getElementById("infoDiv").style.border="3px solid #0099ff";
        document.getElementById("tranDiv").style.height=document.body.clientHeight+ "px";
         document.getElementById("tranDiv").style.width=document.body.clientWidth+ "px"; 
         document.getElementById("tranDiv").style.display=""; 
         document.getElementById("tranDivBack").style.display="";
          document.getElementById("tranDivBack").style.zIndex=0;
          document.getElementById("infoDiv").style.display=""; 
          } 
          function closeWindow(){ document.getElementById("tranDiv").style.display="none"; }
           </script>

</head>
<!--层遮罩部分-->
<body>
    <div style="position: absolute; display: none; left: 0px; top: 0px;" id="tranDiv">
        <div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 4300%;
            background-color: #000000; filter: alpha(Opacity=30)" id="tranDivBack">
        </div>
        <div align='center' style="position: absolute; left: 0px; top: 0px; width: 100%;
            height: 200%; background-color: #e5edf5;" id='infoDiv'>
        </div>
    </div>
    <!--层遮罩部分结束-->
    <!--弹出层登录-->
    <div id="popLayer" style="display: none;">
        <a href="javascript:closeWindow();">点此关闭</a></div>
    <a href="javascript:showWindow();">点击此处看看</a>
</body>
</html>
