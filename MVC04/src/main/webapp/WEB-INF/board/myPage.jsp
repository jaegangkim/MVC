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
<style>
    body{
        width: 1440px;
        height: 1024px;
        background-color: deepskyblue;
    }
    #fside {

        position: absolute;
        width: 364px;
        height: 553px;
        left: 41px;
        top: 47px;

        background: #D9D9D9;
    }


    #vector1 {
        position: absolute;
        width: 283px;
        height: 0px;
        left: 40.5px;
        top: 375px;

        border: 4px solid #000000;
    }


    #sside {

        position: absolute;
        width: 364px;
        height: 344px;
        left: 41px;
        top: 642px;

        background: #D9D9D9;
    }


    #main {

        position: absolute;
        width: 938px;
        height: 939px;
        left: 449px;
        top: 47px;

        background: #D9D9D9;
    }





    #date {
        
        position: absolute;
        width: 272px;
        height: 74px;
        left: 46px;
        top: 100px;

        background: #859EF4;
    }




    #cons {

        position: absolute;
        width: 247px;
        height: 69px;
        left: 101px;
        top: 453px;

        background: #859EF4;
    }



    #img {

        position: absolute;
        width: 117px;
        height: 104px;
        left: 30px;
        top: 32px;

        background: #859EF4;
    }


    #nickname {

        position: absolute;
        width: 164px;
        height: 53px;
        left: 172.5px;
        top: 25px;

        background: #859EF4;
    }


    #day {

        position: absolute;
        width: 164px;
        height: 51px;
        left: 172.5px;
        top: 98px;

        background: #859EF4;
    }


    #goal {

        position: absolute;
        width: 297px;
        height: 104px;
        left: 33.5px;
        top: 186px;

        background: #859EF4;
    }


    #vector2 {

        position: absolute;
        width: 868.5px;
        height: 0px;
        left: 28px;
        top: 492px;

        border: 5px solid #000000;
    }






    #myGraph {

        position: absolute;
        width: 413px;
        height: 369px;
        left: 28px;
        top: 80px;

        background: #859EF4;
    }


    #mySch {

        position: absolute;
        width: 413px;
        height: 369px;
        right: 28px;
        top: 80px;

        background: #859EF4;
    }


    #myPattern {

        position: absolute;
        width: 413px;
        height: 369px;
        left: 28px;
        top: 544px;

        background: #859EF4;
    }


    #myCons {

        position: absolute;
        width: 413px;
        height: 369px;
        right: 28px;
        top: 544px;

        background: #859EF4;
    }
</style>
<body>
 <jsp:include page="../header/header.jsp"/>
    <div id="whole">
        <div id="fside">
            <p style="text-align: center;">오늘 지출</p>
            <div id="date">2022-08-01</div>
            <div id="vector1"></div>
        </div>

        <div id="sside">
            <img id="img" src="" alt="프로필" />
            <div id="nickname">닉네임</div>
            <div id="day">d-day</div>
            <div id="goal">목표금액</div>
        </div>

        <div id="main">
            <p style="text-align: center;">나의 챌린지</p>
            <div id="myGraph"></div>
            <div id="mySch"></div>
            <div id="vector2"></div>
            <div id="myPattern"></div>
            <div id="myCons"></div>
        </div>
    </div>
</body>
</html>
