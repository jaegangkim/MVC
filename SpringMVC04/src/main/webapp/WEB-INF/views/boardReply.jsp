<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">
  <h2>Spring MVC</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body">
    	<form action="${cpath}/boardReply.do" method="post">
    		<input type="hidden" name="idx" value="${vo.idx}"/>
    		<input type="hidden" name="memId" value="${mvo.memId}"/>
    		<table class="table table-bordered">
    			<tr>
    				<td>제목</td>
    				<td><input type="text" name="title" class="form-control" value="${vo.title}"/></td>
    			</tr>
    			<tr>
    				<td>내용</td>
    				<td><textarea rows="10" name="contents" class="form-control"></textarea></td>
    			</tr>
    			<tr>
    				<td>작성자</td>
    				<td><input type="text" name="writer" class="form-control" value="${mvo.memName}" readonly="readonly"></td>
    			</tr>
    			<tr>
    			  <td colspan="2">
    			  	<button type="submit" class="btn btn-success btn-sm">등록</button>
    			  	<button type="reset" class="btn btn-warning btn-sm">취소</button>
    			  </td>
    			</tr>
    		</table>
    	</form>
    </div>
    <div class="panel-footer">Spring특화과정A_김재강</div>
  </div>
</div>

</body>
</html>
