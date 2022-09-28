<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>

<html>
	<head>
		<title>levelView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${cpath}/CSS/main.css" />
		<link rel="stylesheet" href="${cpath}/CSS/header.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">


	 <!-- Header -->
    <nav>
      <ul>
        <li>
          <a href="${cpath}/mainForm.do">Home</a>
        </li>
        <li>
          <a href="${cpath}/savePointList.do">Save Point</a>
        </li>
        <li>
          <a href="${cpath}/levelList.do">Level</a>
        </li>
        <li>
          <a href="${cpath}/boardList.do">Board</a>
        </li>
        <li>
          <a href="${cpath}/challengeForm.do?mb_id=${mvo.mb_id}">My Challenge</a>
        </li>
        <li>
          <a href="${cpath}/myPage.do">my page</a>
        </li>
        <li>
          <a href="${cpath}/logout.do" class="login_btn" id="login">Logout</a>
        </li>
      </ul>
     
    </nav>

		
			<br>
		<br>
		
			<!-- Main -->
			<section id="main" class="container">
					<header style="text-align: center;">
						<h2 id="title">${vo.lv_title}</h2>
						<p id="write">${vo.mb_name}</p>
						<p id="date">${vo.lv_date}</p>
					</header>
					<div class="box">
							<div class="row-6 row-12-mobilep">
								<p style="text-align: center;">${vo.lv_content}</p>
							</div>
			<!--코멘트창-->
			<form class="comm_comment" action="${cpath}/levelComment.do"method="get">
					<h3 style="margin-top: 8%;margin-bottom: -2%;">comment</h3>
					<div class="table-wrapper">
						
						<table>
						
							<tbody>
								<c:forEach var="vo" items="${list}" varStatus="status">
										<tr>
											<td>${status.index + 1}</td>
											<td>${vo.lv_cmt_content}</td>
											<td>${vo.mb_name}</td>
										</tr>
									</c:forEach>
							</br>
							</tbody>
							
						</table>
						<input type="hidden" name="num" value="${vo.lv_seq}"> 
						<div class="col-9 col-12-mobilep" style="text-align: center;">
							<input type="text" name="content" id="query" placeholder="댓글을 입력하세요" style="width: 88%;"/>
							<input type="submit" value="작성" style="background-color:#141A35;" id= "lv_comment"/>
						</div>
					
					</form>

						</div>
						
					</div>
				</section>


				<div class="col-12">
					<ul class="actions special">
						<li><input type="submit" value="목록으로" id= "goList"/></li>
						<li><input type="submit" value="수정하기" id= "update" /></li>
						<li><input type="submit" value="삭제하기" id= "delete"/></li>
					</ul>
				</div>
			</br></br>
		
				
		
		</div>

		<footer id="footer">
			<ul class="copyright">
				<li>&copy; non-Spending Challenge.</li><li>Design: <a>무지출챌린지</a></li>
			</ul>
		</footer>
		<script>
			document.getElementById("goList").onclick=function(){
				location.href=("${cpath}/levelList.do")
			}
			document.getElementById("update").onclick=function(){
				location.href=("${cpath}/levelUpdateForm.do?num=${vo.lv_seq}")
			}
			document.getElementById("delete").onclick=function(){
				location.href=("${cpath}/levelDelete.do?num=${vo.lv_seq}")
			}
			document.getElementById("lv_comment").onclick=function(){
				location.href=("${cpath}/levelDelete.do?num=${vo.lv_seq}")
			}
		</script>
	</body>
</html>>