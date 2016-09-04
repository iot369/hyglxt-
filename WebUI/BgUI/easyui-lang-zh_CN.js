if ($.fn.pagination){
    $.fn.pagination.defaults.beforePageText = '第';
    $.fn.pagination.defaults.afterPageText = '共{pages}页';
	$.fn.pagination.defaults.displayMsg = '当前第{from}页,每页{to}条,共{total}条记录';
}
if ($.fn.datagrid){
    $.fn.datagrid.defaults.loadMsg = '正在处理，请稍待。。。';
}
if ($.messager){
	$.messager.defaults.ok = '确 定';
	$.messager.defaults.cancel = '取 消';
}