<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <h2>MVC05</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body">Panel Content</div>
    <button id="btn">계산</button>
    <input id="n1" type="text"/>+<input id="n2" type="text"/>
    <div id="result">결과</div>

    <script>
    $(document).ready(()=>{
    	$("#btn").click(()=>{
	    	var n1 =$("#n1").val(); 
	    	var n2 =$("#n2").val();
	    	// 서버와 통신(/calc.do) 새로운 mapping -> Hendler Mapping에 걸어야됨
	    	$.ajax({
	    		url:"${cpath}/calc.do}", // 서버 통신할 때 누구와 통신할건지
	    		type:"get", // 요청을 get방식 or post방식
	    		data:{'n1':n1,'n2':n2}, // Servlet으로 넘어가는 파라메터 데이터
	    		success: resultHtml, // 파라메터가 넘어가는 데이터 이름 (아무렇게나 지어도됨)
	    		error:function(){alert("error");}
	    	});
	    	
	    });
    });
    
    function resultHtml(data){
    	$('#result').html("<font color ='red'>"+data+"<font>")
    }
	    
    </script>
	    
    <div class="panel-footer">Spring특화과정A_박혜민</div>
    
  </div>
</div>

</body>
</html>


</body>
</html>