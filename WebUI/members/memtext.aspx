<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memtext.aspx.cs" Inherits="memtext" %>

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
    function selectt(xx) {
        $("#txtid").val(xx);
        document.getElementById("btnsearch").click()
    }
    function ll() {
        $("#txtid").val("");
        document.getElementById("btnsearch").click()
    }
    $(function() {
        $("#layout1").ligerLayout({
            leftWidth: 120,
            heightDiff: 0
        })
    });
    
   
    </script>

    <script type="text/javascript">
    var checkObj;
    function Check(onClickObj) {
        if (checkObj != null) {
            checkObj.checked = false
        }
        if (checkObj == onClickObj) {
            onClickObj.checked = false
        } else onClickObj.checked = true;
        checkObj = onClickObj
    }
    function selects(bnumm) {
        $("#txtbnum").val(bnumm)
    }
    function deletemem() {
        var num = $("#txtbnum").val();
        if (num != "") {
            $.ligerDialog.confirm('你确定要删除会员信息吗？',
            function(type) {
                if (type) del()
            })
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    function del() {
        var nums = $("#txtbnum").val();
        $.ajax({
            url: "Ajaxdeletemen.aspx?mnum=" + nums + "",
            type: "get",
            cache: false,
            success: function(date) {
                if (date == "true") {
                    $("#txtbnum").val("");
                    f_alert2('warn', '删除成功！');
                       load();
                } else {
                    f_alert2('warn', '删除失败！')
                }
            }
        })
    }
    function viewmen(){
      var RadNum = Math.random();
         var num = $("#txtbnum").val();
        if (num != "") {
           f_opens('440','700','memberview.aspx?str='+RadNum+'&mnum='+num+'','查看会员');
        } else {
            f_alert2('warn', '请选择一条记录！')
        }
    }
    
      function viewmens(nums){
         var RadNum = Math.random();
           f_opens('440','700','memberview.aspx?str='+RadNum+'&mnum='+nums+'','查看会员');
       
    }
    </script>

    <script type="text/javascript">
    function f_opens(height, width, url, title) {
        $.ligerDialog.open({
            height: height,
            url: '' + url + '',
            width: width,
            isResize: true,
            slide: false,
            isHidden: false,
            name: 'winadd',
            title: title,
            buttons: [{
                text: '保存',
                onclick: function(item, dialog) {
                    document.getElementById('winadd').contentWindow.addmem();
                       load();
                }
            },
            {
                text: '关闭',
                onclick: function(item, dialog) {
                    document.getElementById('winadd').contentWindow.closeflash();
                    dialog.close()
                }
            }]
        })
    }
    
    function reflesh() {
        $("#btnsearch").click()
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

    <script type="text/javascript">   
       $(function() {  
   load();

});

function load()
{


    var grid = null;
   
    $("#maingrid4").ligerGrid({
        checkbox: true,
        columns: [{
            display: '卡号',
            name: 'mNum',
            align: 'left',
            width: 100,
            isAllowHide: false
        },
        
         {
            display: '姓名',
            name: 'mName',
            width: 70,
            align: 'left'
        },
       
        {
            display: '手机号码',
            name: 'mMobile',
            width: 80
           
        },
       
        {
            display: '级别',
            name: 'lName',
            width: 70,
            align: 'right'
        },
        {
            display: '可用金额',
            name: 'mBalance',
             width: 70,
             align: 'right'
           
        },
        {
            display: '可用积分',
            name: 'mIntegral',
             width: 70,
             align: 'right'
           
        },
        {
            display: '会员状态',
            name: 'mStates',
             width: 80,
             render:function (row){return (row.mStates =="0")?'正常':'挂失';}
            
        },
         {
            display: '有效期',
            name: 'mPastdate',
             width: 100,
            type: 'date'
        },
         {
            display: '办卡时间',
            name: 'mMakedate',
             width: 100,
            type: 'date'
        },
         {
            display: '办卡店铺',
            name: 'sName',
             width: 120
            
        }
        ],
        url: "Ajaxmemberlist.aspx",
        dataAction: 'server',
        pageSize: 10,
        pageSizeOptions: [5,10, 15, 20, 30],
        width: '100%',
        height: '100%',
        onDblClickRow: function (rowdata, rowindex, rowDomElement)  //表格双击带回  
                { 
                 viewmens(rowdata.mNum);
                } ,
           onSelectRow:function (rowdata, rowindex, rowDomElement)
           {
            $("#txtbnum").val(rowdata.mNum);
           }
    });
    $("#pageloading").hide();
    grid = $("#maingrid").ligerGetGridManager();
    $('#maingrid4').ligerGrid().set('dataAction','server'); 
}
                    
                                                                    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="divall">
        <div id="layout1">
            <input id="txtlevel" type="text" runat="server" style="display: none;" />
            <div position="left" title="会员类别" id="levellist">
            </div>
            <div position="center" title="会员信息列表" style="padding: 2px;">
                <div class="tools_box">
                    <div class="tools_bar">
                        <a onclick="f_opens('405','660','membersAdd.aspx','添加会员');" class="tools_btn"><span>
                            <b class="adds">添加</b></span></a> <a onclick="viewmen();" class="tools_btn"><span><b
                                class="all">查看</b></span></a> <a onclick="deletemem();" class="tools_btn"><span><b
                                    class="recycle">删除</b></span></a>
                        <div class="search_box">
                            <div class="l-panel-search">
                                <div class="l-panel-search-item">
                                    单位:</div>
                                <div class="l-panel-search-item">
                                    <asp:DropDownList ID="cmbUnitid" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="l-panel-search-item">
                                    帐号:</div>
                                <div class="l-panel-search-item">
                                    <input id="txtuserid" type="text" /></div>
                                <div class="l-panel-search-item">
                                    <div id="searchbtn" style="width: 40px;">
                                        查询</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="divgirdtop">
                    <img src="../images/ico-show-txt.png" />会员列表<input id="txtbnum" type="text" style="display: none;" />
                </div>
                <div style="margin: 0; padding: 0; width: 99.8%">
                    <div id="maingrid4" style="margin: 0; padding: 0;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
