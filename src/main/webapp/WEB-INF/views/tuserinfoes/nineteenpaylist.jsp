<%@page import="java.util.Map"%>
<%@page import="com.ruyicai.mgr.consts.TransactionState"%>
<%@page import="com.ruyicai.mgr.domain.Nineteenpay"%>
<%@page import="com.ruyicai.mgr.util.StringUtil"%>
<%@page import="com.ruyicai.mgr.util.Page"%>
<%@page import="java.math.BigDecimal"%>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/Dialog.js"></script>	
</head>
<script type="text/javascript">	
<% 
String errormsg = (String)request.getAttribute("errormsg");
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
</script>
<body>
	<div style="margin-top: 10px;"></div>
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
		<tbody>
			<tr>
				<td style="padding: 2px 10px;">
					<form action="<%=request.getContextPath()%>/tuserinfoes/nineteenpaylist"
						method="post">
						<input type="hidden" name="userno1" value="${userno}">
						<div style="float: left;">
							<table width="100%" cellspacing="2" cellpadding="2" border="0">
								<tr>
									<td align="right">交易号:</td>
									<td><input name="transactionid" type="text" style="width: 180px" value="${param.transactionid}"
										id="transactionid" class="inputText" onfocus="this.select();" /></td>
									<td align="right">用户编号:</td>
									<td><input name="userno" type="text" style="width: 110px" value="${userno}"
										id="userno" class="inputText" onfocus="this.select();" /></td>
									<td align="right">卡类别:</td>
									<td><select name="cardtype" style="width:60px">
											<option value="">全部</option>
										    <option value="0203">19pay移动</option>
										    <option value="0206">19pay联通</option>
										    <option value="0221">19pay电信</option>
										    <option value="0803">神州付移动</option>
										    <option value="0806">神州付联通</option>
										    <option value="0821">神州付电信</option>
									</select></td>
									<td align="right">卡号:</td>
									<td><input name="cardno" type="text" style="width: 180px" value="${param.cardno}"
										id="cardno" class="inputText" onfocus="this.select();" /></td>
									<td align="right">卡密码:</td>
									<td><input name="cardpwd" type="text" style="width: 180px" value="${param.cardpwd}"
										id="cardpwd" class="inputText" onfocus="this.select();" /></td>
							        </tr>
							        <tr>			
									<td align="right">充值时间:</td>
									<td><input id="starttime" name="starttime" value="${starttime}"
										class="inputText" type="text" style="width: 80px;"
										 onclick="DateTime.onImageMouseDown(event,'Calendar','starttime');">
										<img vspace="1" align="absmiddle" onmousedown="DateTime.onImageMouseDown(event,'Calendar','starttime');"
										style="position: relative; left: -25px; margin-right: -20px; cursor: pointer;"
										src="<%=request.getContextPath()%>/images/Calendar.gif">
										-&nbsp;<input id="endtime" name="endtime" value="${endtime}"
										class="inputText" type="text" ztype="date"
										style="width: 80px;"
										onclick="DateTime.onImageMouseDown(event,'Calendar','endtime');">
										<img vspace="1" align="absmiddle" onmousedown="DateTime.onImageMouseDown(event,'Calendar','endtime');"
										style="position: relative; left: -25px; margin-right: -20px; cursor: pointer;"
										src="<%=request.getContextPath()%>/images/Calendar.gif">
									</td>
									<td align="right">状态:</td>
									<td><select name="state" style="width:80px">
											<option value=" ">全部</option>
											<option value="0">未处理</option>
											<option value="2">失败</option>
											<option value="1">成功</option>
											<option value="3">处理中</option>
									</select></td>
									<td align="right">显示行数:</td>
									<td><select id="maxResult" name="maxResult" style="width:60px">
											<option value="15">15</option>
											<option value="30">30</option>
											<option value="50">50</option>
									</select></td>
									<td></td>
									<td align="center"><input type="submit" value="查询" class="inputButton">
									</td>
									<td align="center"><a onclick="javascript:history.go(-1)">返回</a></td>
								</tr>
							</table>
						</div>
					</form>
				</td>
			</tr>
			<tr>
				<td
					style="padding-top: 2px; padding-left: 6px; padding-right: 6px; padding-bottom: 2px;">
					<table width="100%" cellspacing="0" cellpadding="2"
						class="dataTable">
						<tbody>
							<tr class="dataTableHead">
								<td width="2%" height="30" class="thOver"></td>
								<td width="20%" class="thOver"><strong>交易ID</strong></td>
								<td width="6%" class="thOver"><strong>用户编号</strong></td>
								<td width="6%" class="thOver"><strong>卡类别</strong></td>
								<td width="12%" class="thOver"><strong>卡号</strong></td>
								<td width="12%" class="thOver"><strong>卡密码</strong></td>
								<td width="4%" class="thOver"><strong>面值</strong></td>
								<td width="4%" class="thOver"><strong>余额(元)</strong></td>
								<td width="9%" class="thOver"><strong>充值时间</strong></td>
								<td width="5%" class="thOver"><strong>状态</strong></td>
								<td width="4%" class="thOver"><strong>返回码</strong></td>
								<td width="6%" class="thOver"><strong>返回信息</strong></td>
							</tr>
								<c:forEach items="${page.list}" var="nineteenpay" varStatus="num">
									<% 
									Map nineteenpay = (Map)pageContext.getAttribute("nineteenpay");
									String state = TransactionState.getMemo(new BigDecimal(nineteenpay.get("state").toString()));
									
									String cardtype = "移动";
									if ("0203".equals(nineteenpay.get("cardtype"))) {
										cardtype = "19pay移动";
									} else if ("0206".equals(nineteenpay.get("cardtype"))) {
										cardtype = "19pay联通";
									} else if ("0221".equals(nineteenpay.get("cardtype"))) {
										cardtype = "19pay电信";
									} else if ("0803".equals(nineteenpay.get("cardtype"))) {
										cardtype = "神州付移动";
									} else if ("0806".equals(nineteenpay.get("cardtype"))) {
										cardtype = "神州付联通";
									} else if ("0821".equals(nineteenpay.get("cardtype"))) {
										cardtype = "神州付电信";
									} else {
										cardtype = " ";
									}									
								%>
									<tr>
										<td title="${num.count}">${num.count}</td>
										<td title="${nineteenpay.transactionid}">${nineteenpay.transactionid}</td>
										<td title="${nineteenpay.userno}">${nineteenpay.userno}</td>
										<td title="<%=cardtype%>"><%=cardtype%></td>
										<td title="${nineteenpay.cardno}">${nineteenpay.cardno}</td>
										<td title="${nineteenpay.cardpwd}">${nineteenpay.cardpwd}</td>
										<td title="${nineteenpay.amt}">${nineteenpay.amt}</td>
										<td title="${nineteenpay.balance}">${nineteenpay.balance}</td>
										<td title="${nineteenpay.chargetime}"><fmt:formatDate value="${nineteenpay.chargetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td title="<%=state%>"><%=state%></td>
										<td title="${nineteenpay.retcode}">${nineteenpay.retcode}</td>
										<td title="${nineteenpay.retmemo}">${nineteenpay.retmemo}</td>
									</tr>
								</c:forEach>												
							<tr>
								<td align="left" id="dg1_PageBar" colspan="11"><div
										style="float: right; font-family: Tahoma">
										<c:choose>
											<c:when test="${page.pageIndex != 0}">
												<a
													href="<%=request.getContextPath()%>/tuserinfoes/nineteenpaylist?transactionid=${transactionid}&userno=${userno}&cardtype=${cardtype}&cardno=${cardno}&cardpwd=${cardpwd}&starttime=${param.starttime}&endtime=${param.endtime}&state=${param.state}&maxResult=${page.maxResult}&pageIndex=0">第一页</a>
											</c:when>
											<c:otherwise>
										第一页
									</c:otherwise>
										</c:choose>
										|&nbsp;
										<c:choose>
											<c:when test="${page.pageIndex > 0}">
												<a
													href="<%=request.getContextPath()%>/tuserinfoes/nineteenpaylist?transactionid=${transactionid}&userno=${userno}&cardtype=${cardtype}&cardno=${cardno}&cardpwd=${cardpwd}&starttime=${param.starttime}&endtime=${param.endtime}&state=${param.state}&maxResult=${page.maxResult}&pageIndex=${page.pageIndex - 1}">上一页</a>
											</c:when>
											<c:otherwise>
										上一页
									</c:otherwise>
										</c:choose>
										&nbsp;|&nbsp;
										<c:choose>
											<c:when test="${page.pageIndex + 1 < page.totalPage}">
												<a
													href="<%=request.getContextPath()%>/tuserinfoes/nineteenpaylist?transactionid=${transactionid}&userno=${userno}&cardtype=${cardtype}&cardno=${cardno}&cardpwd=${cardpwd}&starttime=${param.starttime}&endtime=${param.endtime}&state=${param.state}&maxResult=${page.maxResult}&pageIndex=${page.pageIndex + 1}">下一页</a>
											</c:when>
											<c:otherwise>
										下一页
									</c:otherwise>
										</c:choose>
										&nbsp;|&nbsp;
										<c:choose>
											<c:when test="${page.pageIndex + 1 != page.totalPage}">
												<a
													href="<%=request.getContextPath()%>/tuserinfoes/nineteenpaylist?transactionid=${transactionid}&userno=${userno}&cardtype=${cardtype}&cardno=${cardno}&cardpwd=${cardpwd}&starttime=${param.starttime}&endtime=${param.endtime}&state=${param.state}&maxResult=${page.maxResult}&pageIndex=${page.totalPage - 1}">最末页</a>
											</c:when>
											<c:otherwise>
										最末页
									</c:otherwise>
										</c:choose>
										&nbsp;|&nbsp; &nbsp;&nbsp;转到第&nbsp;<input type="text"
											onkeyup="value=value.replace(/\D/g,'')" style="width: 40px"
											class="inputText" id="_PageBar_Index">&nbsp;页&nbsp;&nbsp;<input
											type="button" value="跳转" class="inputButton" onclick="go()">
										<script type="text/javascript">
											function go() {
												var pageindex = parseInt($("#_PageBar_Index").val()) - 1;
												window.location.href="<%=request.getContextPath()%>/tuserinfoes/nineteenpaylist?transactionid=${transactionid}&userno=${userno}&cardtype=${cardtype}&cardno=${cardno}&cardpwd=${cardpwd}&starttime=${param.starttime}&endtime=${param.endtime}&state=${param.state}&maxResult=${page.maxResult}&pageIndex=" + pageindex;
											}
											function goback() {
												window.location.href="<%=request.getContextPath()%>/tuserinfoes/nineteenpaylist?userno=${userno}";
											}
										</script>
									</div>
									<div style="float: left; font-family: Tahoma">共
										${page.totalResult} 条记录，每页 ${page.maxResult} 条，当前第
										${page.pageIndex + 1} / ${page.totalPage} 页</div></td>
							</tr>
							<tr>
							<td colspan="16"><input type="button" value=" 返 回 " class="inputButton" onclick="goback();"></td>
							</tr>
						</tbody>						
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>