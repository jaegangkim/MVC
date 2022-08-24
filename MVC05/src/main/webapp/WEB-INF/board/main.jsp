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
  <script type="text/javascript">
  	$(document).ready(()=>{
  		loadList();
  	});
  	function loadList(){
  		$.ajax({
  			url:"${cpath}/boardList.do",
  			type:"get",
  			success:resultHtml,
  			error:function(){alert("error")}
  		});
  	}
  	function resultHtml(data){
  		var html="<table class='table table-bordered'>";
  		html+="<tr>";
  		html+="<td>번호</td>";
  		html+="<td>제목</td>";
  		html+="<td>작성자</td>";
  		html+="<td>작성일</td>";
  		html+="<td>조회수</td>";
  		html+="</tr>";
  		
  		$.each(data, function(index,obj){ 
  			html+="<tr>";
  	  		html+="<td>"+obj.num+"</td>";
  	  		html+="<td>"+obj.title+"</td>";
  	  		html+="<td>"+obj.writer+"</td>";
  	  		html+="<td>"+obj.indate+"</td>";
  	  		html+="<td>"+obj.count+"</td>";
  	  		html+="</tr>";
  		});  // 제이쿼리 반복문
  		html+="</table>";
  		$("#list").html(html);
  	}
  	
  </script>
  
</head>
<body>
 <jsp:include page="../header/header.jsp"/>
<div class="container">
  <h2>MVC05</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body">
    	
    </div>
    <div class="panel-footer">Spring특화과정A_김재강</div>
  </div>
</div>

</body>
</html>
