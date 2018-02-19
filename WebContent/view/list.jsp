<%@page import="guestbook.service.GetMessageListService"%>
<%@page import="guestbook.service.MessageListView"%>
<%@page import="guestbook.model.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% String pageNumberStr=request.getParameter("page");
    
    int pageNumber=1;
    if(pageNumberStr!=null){
    	pageNumber=Integer.parseInt(pageNumberStr);}
    GetMessageListService messageListService=GetMessageListService.getInstance();
    MessageListView viewData=messageListService.getMessageList(pageNumber);
    %>
    
    <c:set var="viewData" value="<%=viewData %>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 메시지 목록</title>
</head>
<body>
<div class="w3-container w3-padding-64">
<form action="writeMessage.jsp" method="post">
<table class="w3-table w3-border" style="max-width: 500px;"><tr ><td>
이름 </td><td><input type="text" name="guestName"><br></td></tr>
<tr><td>암호</td><td><input type="password" name="password"><br></td></tr>
<tr><td>메시지</td><td><textarea name="message" cols="35" rows="3"></textarea><br></td></tr>
<tr ><td></td><td><button type="submit" class="w3-button w3-black" >메시지 남기기</button></td></tr>
</table>

</form>
<hr>
<c:if test="${!viewData.isEmpty() }">
<div>
<table class="w3-table-all w3-hoverable" style="width: 500px">
<c:forEach var="message" items="${viewData.messageList }">
<tr>
<td>
메시지 번호 : ${message.id }<br/>
손님 이름 : ${message.guestName }<br/>
메시지 : ${message.message }<br/>
<a href="confirmDeletion.jsp?messageId=${message.id }">[삭제하기]</a>
</td>
</tr>
</c:forEach>

</table>
</div>
<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount }">
<a href="list.jsp?page=${pageNum }">[${pageNum}]</a>
</c:forEach>
</c:if>
</div>
</body>
</html>