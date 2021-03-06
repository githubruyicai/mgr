<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="com.ruyicai.mgr.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/styles/default.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/map.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Dialog.js"></script>
</head>
<script type="text/javascript">
<% 
String errormsg = (String)request.getAttribute("errormsg");
String result = (String)request.getAttribute("result");
if(!StringUtil.isEmpty(errormsg)) {
%>
function showerror() {
	Dialog.alert("<%=errormsg%>");
}
$(document).ready(function() {
	showerror();
});
<%
}
%>

function parseObj(strData){
    return (new Function( "return " + strData ))();
}
$(document).ready(function() {
	var resultMessage = parseObj("<%=result%>");
	var page = resultMessage.value;
	$("#totalResult").text(page.totalResult);
	$("#maxResult").text(page.maxResult);
	$("#currentPageNo").text(page.currentPageNo);
	$("#totalPage").text(page.totalPage);
	if(page.currentPageNo < page.totalPage){
		$("#nextpage").show();
		$("#nextpage2").hide();
	}else{
		$("#nextpage").hide();
		$("#nextpage2").show();
	}
	if(page.currentPageNo < page.totalPage){
		$("#gotoend").show();
		$("#gotoend2").hide();
	}else{
		$("#gotoend").hide();
		$("#gotoend2").show();
	}
	var data = resultMessage.value.list;
	var tbody = $("#data");
	// 将彩种放入map中
	$.each(data,function(i,n){
		var id = data[i].id;
		var url = "<%=request.getContextPath()%>/dmsg/mpage?pid="+id;
		tbody.append('<tr>')
		tbody.append('<td>'+id+'</td>');
		tbody.append('<td title='+data[i].userno+'>'+data[i].userno+'</td>');
		if(data[i].reply == null){
			tbody.append('<td title='+data[i].reply+'>未回复</td>');
		}else{
			tbody.append('<td title='+data[i].reply+'>已回复</td>');
		}
		tbody.append('<td title='+data[i].content+'>'+data[i].content+'</td>');
		tbody.append('<td title='+data[i].detail+'>'+data[i].detail+'</td>');
		var da = new Date(data[i].createtime);
		var daStr = da.format("yyyy-MM-dd hh:mm:ss");
		tbody.append('<td title='+daStr+'>'+daStr+'</td>');
		
		tbody.append('<td title='+data[i].imsi+'>'+data[i].imsi+'</td>');
		if(data[i].flag == 0){
			tbody.append('<td>未删除</td>');
			tbody.append('<td><a href="javascript:process(\''+data[i].id+'\',\'1\')">删除</a></td>');
		}else{
			tbody.append('<td>已删除</td>');
			tbody.append('<td><a href="javascript:process(\''+data[i].id+'\',\'0\')">恢复</a></td>');
		}
		tbody.append('</tr>')
	});
});
function process(id,sortState){
	var tip;
	if(sortState == 0){
		tip = "确认<font color='red'>恢复</font>？";
	}else if(sortState == 1){
		tip = "确认<font color='red'>删除</font>？";
	}else{
		Dialog.alert("操作异常");
		return false;
	}
	Dialog.confirm(tip,function(){
		$.ajax({
			url:"<%=request.getContextPath() %>/dmsg/updateFlag",
			type:"POST",
			data:{"id":id,"flag":sortState},
			success:function(data){
				if(data.errorCode == "0") {
					Dialog.alert(data.value);
					document.submitForm.submit();
				}else{
					Dialog.alert("操作异常");
				}
			}
		});
	},function(){return false;})
}

Date.prototype.format = function(format)
{
    var o =
    {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format))
    format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
    if(new RegExp("("+ k +")").test(format))
    format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}
</script>
<body>
	<div style="margin-top: 10px;"></div>
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tbody>
			<tr>
				<td style="padding: 2px 10px;">
						<div style="float: left;">
							<table width="130%" cellspacing="2" cellpadding="2" border="0">
								<tr>
									<td align="right">用户编号:</td>
									<form name="submitForm" action="<%=request.getContextPath()%>/dmsg/mpage" method="post">
									<td><input name="userno" type="text" style="width: 120px" value="${param.userno}"></td>
									<td align="center"><input type="submit" value="查询" 	class="inputButton"></td>
									<input name="startLine" id="startLine" type="hidden" style="width: 120px" value="${startLine}">
					<input name="endLine" id="endLine" type="hidden" style="width: 120px" value="${endLine}">
									</form>
								</tr>
							</table>
						</div>
					
				</td>
			</tr>
			<tr>
				<td
					style="padding-top: 2px; padding-left: 6px; padding-right: 6px; padding-bottom: 2px;">
					<table width="100%" cellspacing="0" cellpadding="2"
						class="dataTable">
							<tr class="dataTableHead">
								<td width="3%" class="thOver"><strong>ID</strong></td>
								<td width="5%" class="thOver"><strong>用户编号</strong></td>
								<td width="3%" class="thOver"><strong>回复</strong></td>
								<td width="22%" class="thOver"><strong>留言内容</strong></td>
								<td width="15%" class="thOver"><strong>客户详细</strong></td>
								<td width="8%" class="thOver"><strong>留言时间</strong></td>
								<td width="5%" class="thOver"><strong>imsi</strong></td>
								<td width="4%" class="thOver"><strong>删除</strong></td>
								<td width="3%" class="thOver"><strong></strong></td>
							</tr>
							<tbody id="data">
							</tbody>
							<tr>
								<td  align="left" id="dg1_PageBar" colspan="8"><div
										style="float: right; font-family: Tahoma">
										<c:choose>
											<c:when test="${startLine != 0}">
												<a
													href="javascript:go('0')">第一页</a>
											</c:when>
											<c:otherwise>
												第一页
											</c:otherwise>
										</c:choose>
										|&nbsp;
										<c:choose>
											<c:when test="${startLine >= endLine}">
												<a
													href="javascript:gopre()">上一页</a>
											</c:when>
											<c:otherwise>
												上一页
											</c:otherwise>
										</c:choose>
										&nbsp;|&nbsp;
											<span id="nextpage">
												<a
													href="javascript:gonext()">下一页</a>
											</span>
											<span id="nextpage2">
												下一页
											</span>
										&nbsp;|&nbsp;
											<span id="gotoend">
												<a
													href="javascript:goend()">最末页</a>
											</span>
											<span id="gotoend2">
												最末页
											</span>
										&nbsp;|&nbsp; &nbsp;&nbsp;转到第&nbsp;<input type="text"
											onkeyup="value=value.replace(/\D/g,'')" style="width: 40px"
											class="inputText" id="_PageBar_Index">&nbsp;页&nbsp;&nbsp;<input
											type="button" value="跳转" class="inputButton" onclick="go()">
										<script type="text/javascript">
											function gopre(){
												var _index = parseInt($("#startLine").val()) - (parseInt($("#maxResult").text()));
												go(_index);
											}
											function gonext(){
												var _index = parseInt($("#startLine").val()) + (parseInt($("#maxResult").text()));
												go(_index);
											}
											function goend(){
												var _index = parseInt($("#maxResult").text())*(parseInt($("#totalPage").text())-1);
												go(_index);
											}
										
											function go(index) {
												if(index || index == 0){
													if(index < 0){
														index = 0;
													}
													$("#startLine").val(index);
												}else{
													if($("#_PageBar_Index").val().trim() == ''){
														Dialog.alert("请输入正确的页数!");
														return false;
													}
													var pageindex = parseInt($("#_PageBar_Index").val()) - 1;
													var _index = parseInt(pageindex)*parseInt($("#endLine").val());
													var _totalPage = parseInt($("#totalPage").text());
													if(pageindex < 0 || pageindex > _totalPage-1){
														Dialog.alert("请输入正确的页数:)");
														return false;
													}
													$("#startLine").val(_index);
												}
												document.submitForm.submit();
											}
										</script>
									</div>
									<div style="float: left; font-family: Tahoma">共
										<span id="totalResult"></span> 条记录，每页 <span id="maxResult"></span> 条，当前第
										<span id="currentPageNo"></span> / <span id="totalPage"></span> 页</div></td>
							</tr>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>