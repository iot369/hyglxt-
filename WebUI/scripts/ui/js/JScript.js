   $(function() {
         });
         function f_alert(type)
         {
             $.ligerDialog.alert('提示内容', '提示', type);
         }
         function f_alert3(type,url)
         {
             $.ligerDialog.waitting(type);
                     setTimeout(function ()
                     {
                         $.ligerDialog.closeWaitting();
                         window.location=url;
                     }, 1000);
         }
         function f_alert2(type,txt)
         {
             switch (type)
             {
                 case "success":
                     $.ligerDialog.success(txt);
                     break;
                 case "warn":
                     $.ligerDialog.warn(txt);
                     break;
                 case "question":
                     $.ligerDialog.question(txt);
                     break;
                 case "error":
                     $.ligerDialog.error(txt);
                     break;
                 case "confirm":
                     $.ligerDialog.confirm('提示内容', function (yes)
                     {
                        return yes;
                     });
                     break;
                 case "warning":
                     $.ligerDialog.warning('提示内容', function (type)
                     {
                         alert(type);
                     });
                     break;
                 case "prompt":
                     $.ligerDialog.prompt('提示内容', function (yes, value)
                     {
                         if (yes) alert(value);
                     }); 
                     break;
                 case "prompt2":
                     $.ligerDialog.prompt('提示内容','初始化值', function (yes, value)
                     {
                         if (yes) alert(value);
                     });
                     break;
                 case "prompt3":
                     $.ligerDialog.prompt('提示内容', true, function (yes, value)
                     {
                         if (yes) alert(value);
                     });
                     break;
                 case "prompt4":
                     $.ligerDialog.prompt('提示内容', '初始化多选框值', true, function (yes, value)
                     {
                         if (yes) alert(value);
                     });
                     break;
                 case "waitting":
                     $.ligerDialog.waitting(txt);
                     setTimeout(function ()
                     {
                         $.ligerDialog.closeWaitting();
                     }, 1000);
                     break;
                 case "waitting2":
                     var manager = $.ligerDialog.waitting(txt);
                     setTimeout(function ()
                     {
                         manager.close();
                     }, 1000);
                     break;
             }
         }