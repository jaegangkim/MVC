<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<html lang="en">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minmum-scale=1.0, user-scalable=1.0">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <title>Document</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
  <link rel="stylesheet" href="CSS/mychallenge.css">
  <link rel="stylesheet" href="CSS/header.css">
  <style type="text/css">
    /* Chart.js */
    @keyframes chartjs-render-animation {
      from {
        opacity: .99
      }

      to {
        opacity: 1
      }
    }

    .chartjs-render-monitor {
      animation: chartjs-render-animation 1ms
    }

    .chartjs-size-monitor,
    .chartjs-size-monitor-expand,
    .chartjs-size-monitor-shrink {
      position: absolute;
      direction: ltr;
      left: 0;
      top: 0;
      right: 0;
      bottom: 0;
      overflow: hidden;
      pointer-events: none;
      visibility: hidden;
      z-index: -1
    }
  </style>
</head>

<body>
  <!-- Header -->
  <nav>
        <ul>
			<c:if test="${empty mvo}">
			<li><a href="${cpath}/mainForm.do">Home</a></li>
			<li><a href="${cpath}/savePointList.do">Save Point</a></li>
			<li><a href="" onclick="checkLogin()">Level</a></li>
			<li><a href="${cpath}/boardList.do">Board</a></li>
			<li><a href="" onclick="checkLogin()">My Challenge</a></li>
			<li><a href="" onclick="checkLogin()">My Page</a></li>
		    	<li><a class="login_btn" id="login">Login</a></li>
		    </c:if>
		    <c:if test="${!empty mvo}">
		    <li><a href="${cpath}/mainForm.do">Home</a></li>
			<li><a href="${cpath}/savePointList.do">Save Point</a></li>
			<li><a href="">Level</a></li>
			<li><a href="${cpath}/boardList.do">Board</a></li>
			<li><a href="${cpath}/challengeForm.do?mb_id=${mvo.mb_id}">My Challenge</a></li>
		   		<li><a href="${cpath}/myPage.do?mb_id=${mvo.mb_id}">My Page</a></li>
			    <li><a href="${cpath}/logout.do" class="login_btn">Logout</a></li>
		    </c:if>
			
		</ul>
      </nav>
  <div class="container1">
    <div class="container2">
      <div id="today_box" class="box_shadow"><br>
        <span class="" id="">${mvo.mb_name}님의 챌린지</span><br>
        <span>D-${dday}</span>
        <div class="calendar"></div>
        <div class="sec_cal" style="max-width: 233px; margin: 0px auto;">
          <div class="cal_nav">
            <a href="javascript:;" class="nav-btn go-prev">prev</a>
            <div class="year-month"></div>
            <a href="javascript:;" class="nav-btn go-next">next</a>
          </div>

          <div class="cal_wrap div_challender">
            <div class="days">
              <div class="day">MON</div>
              <div class="day">TUE</div>
              <div class="day">WED</div>
              <div class="day">THU</div>
              <div class="day">FRI</div>
              <div class="day">SAT</div>
              <div class="day">SUN</div>
            </div>
            <div class="dates" style="max-height: 250px;"></div>
          </div>
        </div>
		<SPAN></br></SPAN>
        
      </div>



      <div id="target_box" class="box_shadow">


        <div class="target_money_text">
          <span>목표 금액</span><br>

        </div>
        <input type="text" class="input_target_money target_margin" id="" value="${mvo.challenge_total}" disabled="">
        <input type="text" class="input_now_money target_margin" id="" value="${sum}" disabled="">
        <div class="col-12">
        <form action="${cpath}/challenge.do" class="sun">
                <input type="hidden" name="mb_id" value="${mvo.mb_id}"/>
                <input type="hidden" name="aaa" value="aaa"/>
          <select name="priority" class="target_margin" id="category">
            <option value="">- 선택 -</option>
            <option value="1">1.쇼핑</option>
            <option value="2">2.식비</option>
            <option value="3">3.여가</option>
            <option value="4">4.교통</option>
            <option value="5">5.기타</option>
          </select>
        </div>
        <div>
          <input type="text" class="target_margin" name="pay_money" placeholder="소비금액 입력" />
        </div>
        <ul class="actions fit">

          <li><button type="submit" onclick="over()" id="relking">저장</button></li>

        </ul>
        </form>
		<script>
		function over(event){
			if(${mvo.challenge_total < sum}){
				alert("으이구~~돈 좀 아껴써라~🤦‍🤦‍♂️🤦💸💸💸💸💸")
				event.preventDefault();
			}
			event.preventDefault();
		}

		
		</script>



      </div>

    </div>
    <div id="main_box" class="box_shadow" style="color: rgb(0, 0, 0)">
      <div class="main_top_div">
        <div class="card mb-4">
          <div class="card-header">
            <!-- <svg class="svg-inline--fa fa-chart-area me-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-area" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M64 400C64 408.8 71.16 416 80 416H480C497.7 416 512 430.3 512 448C512 465.7 497.7 480 480 480H80C35.82 480 0 444.2 0 400V64C0 46.33 14.33 32 32 32C49.67 32 64 46.33 64 64V400zM128 320V236C128 228.3 130.8 220.8 135.9 214.1L215.3 124.2C228.3 109.4 251.4 109.7 263.1 124.8L303.2 171.8C312.2 182.7 328.6 183.4 338.6 173.4L359.6 152.4C372.7 139.3 394.4 140.1 406.5 154.2L472.3 231C477.3 236.8 480 244.2 480 251.8V320C480 337.7 465.7 352 448 352H159.1C142.3 352 127.1 337.7 127.1 320L128 320z"></path></svg> -->
            <i class="fas fa-chart-area me-1"></i>
            챌린지 현황
          </div>

          <div class="area_chart_div card-body">
           
            <canvas class="chartjs-render-monitor" id="myAreaChart" width="641" height="220" style="display: block; height: 189px; width: 641px;"></canvas>
          </div>

        </div>
      </div>

      <div class="main_mid_div" style="height: 1px;">
        <hr style="color: black; border-color: black;">
      </div>

      <div class="main_bottom_div">



        <div class="div_ex card mb-4">
          <div class="card-header">
            <i class="fas fa-chart-pie me-1"></i>
            3주 소비 차트
          </div>
          <div class="ex1 card-body">
            <canvas id="myPieChart" width="455" height="227" style="display: block; height: 182px; width: 364px;"
              class="ex1 chartjs-render-monitor"></canvas>
            <div class="chartjs-size-monitor">
              <div class=" chartjs-size-monitor-expand">
                
              </div>
              <div class="chartjs-size-monitor-shrink">
                <div class=""></div>
              </div>
            </div>
          </div>
        </div>


        <div class="div_ex card mb-4">
          <div class="card-header">
            <i class="fas fa-chart-pie me-1"></i>
            1년 소비 차트
          </div>
          <div class="ex1 card-body">
            <canvas id="myPieChart2" width="455" height="227" style="display: block; height: 182px; width: 364px;"
              class="ex1 chartjs-render-monitor"></canvas>
            <div class="chartjs-size-monitor">
              <div class=" chartjs-size-monitor-expand">
                <div class=""></div>
              </div>
              <div class="chartjs-size-monitor-shrink">
                <div class=""></div>
              </div>
            </div>
          </div>
        </div> 
        
      </div>
      
        
      
      
    </div>
    



  </div>

  </div>
  <div class="imguriking">
		<img src="img/배경.png"
			style="position: absolute; width: 93%; top: 167%; left: 3%; height: 76%; border-radius: 28px;" />
		<img src="img/카드추천.png"
			style="position: absolute; width: 25%; top: 175%; left: 36%;">
		<img src="img/영역.png"
			style="position: absolute; width: 40%; top: 172%; left: 4%;" /> <img
			src="img/영역.png"
			style="position: absolute; width: 40%; top: 172%; left: 56.8%;" /> <img
			src="img/ezgif.com-gif-maker.gif"
			style="position: absolute; width: 3%; top: 188%; left: 9%;" /> <img
			src="img/ezgif.com-gif-maker.gif"
			style="position: absolute; width: 3%; top: 188%; left: 62%;" /> <img
			src="img/카드추천_그림.png"
			style="position: absolute; width: 14%; top: 195%; left: 42%;" /> <img
			src="img/오하쳌(오늘하루체크)(우리카드) (2).jpg"
			style="border-radius: 7px; position: absolute; width: 17%; top: 178%; left: 19%; box-shadow: 5px 5px 10px; color: gray;" />
		<img src="img/haebom.jpg"
			style="border-radius: 7px; position: absolute; width: 17%; top: 178%; left: 72%; box-shadow: 5px 5px 10px; color: gray;" />
		<h4 style="position: absolute; left: 10%; top: 202%"><strong>😀오늘하루 체크카드</strong></h4>

		<p style="position: absolute; left: 14%; top: 209%">
			- [EAT] 커피 5% 캐시백<br>- [EAT] 배달/주문 5% 캐시백
		</p>
		<a href="https://www.card-gorilla.com/card/detail/762"
			style="position: absolute; left: 30%; top: 222%">자세히보기</a>

		<h4 style="position: absolute; left: 63%; top: 202%"><strong>😍해봄 체크카드</strong></h4>
		<p style="position: absolute; left: 68%; top: 209%">
			- 커피 20% 할인<br>- 배달앱 5% 할인<br>- 온라인 쇼핑 5% 할인
		</p>
	</div><a href="https://www.card-gorilla.com/card/detail/762" style="position: absolute;left: 83%; top:222%">자세히보기</a>
  </br> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br></br></br></br></br>
  <footer id="footer">
    <ul class="copyright">
      <li>&copy; non-Spending Challenge.</li>
      <li>Design: <a>무지출챌린지</a></li>
    </ul>
  </footer>
  <script type="text/javascript">
  $(document).ready(function () {
      calendarInit();
    });
    /*
        달력 렌더링 할 때 필요한 정보 목록 
    
        현재 월(초기값 : 현재 시간)
        금월 마지막일 날짜와 요일
        전월 마지막일 날짜와 요일
    */

    function calendarInit() {

      // 날짜 정보 가져오기
      var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
      var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
      var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
      var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

      var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
      // 달력에서 표기하는 날짜 객체


      var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
      var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
      var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

      // kst 기준 현재시간
      // console.log(thisMonth);

      // 캘린더 렌더링
      renderCalender(thisMonth);

      function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);

        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates')
        calendar.innerHTML = '';

        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day current"' + ' id="day' + i + '">' + i + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
          todayDate = today.getDate();
          var currentMonthDate = document.querySelectorAll('.dates .current');
          currentMonthDate[todayDate - 1].classList.add('today');
        }
      }

      // 이전달로 이동
      $('.go-prev').on('click', function () {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
      });

      // 다음달로 이동
      $('.go-next').on('click', function () {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth);
      });
      // let date = today.getDate();
    }
    
    
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script>
    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"], 
        
        datasets: [{
          label: "Sessions",
          lineTension: 0.3,
          backgroundColor: "rgba(2,117,216,0.2)",
          borderColor: "rgba(2,117,216,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(2,117,216,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(2,117,216,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: [${sumPay[0]}, ${sumPay[1]}, ${sumPay[2]}, ${sumPay[3]}, ${sumPay[4]}, ${sumPay[5]}, ${sumPay[6]}],
        }],
      },
      options: {
        scales: {
          xAxes: [{
            time: {
              unit: 'date'
            },
            gridLines: {
              display: false
            },
            ticks: {
              maxTicksLimit: 5
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: 40000,
              maxTicksLimit: 9
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            }
          }],
        },
        legend: {
          display: false
        }
      }
    });
    //-------------
    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"],
        datasets: [{
          label: "Sessions",
          lineTension: 0.3,
          backgroundColor: "rgba(2,117,216,0.2)",
          borderColor: "rgba(2,117,216,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(2,117,216,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(2,117,216,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: [${sumPay[0]}, ${sumPay[1]}, ${sumPay[2]}, ${sumPay[3]}, ${sumPay[4]}, ${sumPay[5]}, ${sumPay[6]}],
        }],
      },
      options: {
        scales: {
          xAxes: [{
            time: {
              unit: 'date'
            },
            gridLines: {
              display: false
            },
            ticks: {
              maxTicksLimit: 5
            }
          }],
          yAxes: [{
            ticks: {
              min: 0,
              max: 40000,
              maxTicksLimit: 9
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            }
          }],
        },
        legend: {
          display: false
        }
      }
    });

    </script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script>
	    var ctx = document.getElementById("myPieChart");
	    var myPieChart = new Chart(ctx, {
	      type: 'pie',
	      data: {
	        labels: ["쇼핑", "식비", "여가", "교통", "기타"],
	        datasets: [{
	          data: [${sumItemPay[0]}, ${sumItemPay[1]}, ${sumItemPay[2]}, ${sumItemPay[3]},${sumItemPay[4]}],
	          backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)'],
	        }],
	      },
	      options: {
	    	    title: {
	    	      display: true,
	    	      
	    	    },
	    	    legend: {
	    	      usePointStyle: true,
	    	      position: 'bottom',
	    	      align: 'center',
	    	      labels: {
	    	        fontSize: 12,
	    	        boxWidth: 20,
	    	        usePointStyle: true

	    	      }

	    	    }
	    	  },
	    });
		console.log(${sumItemPay[1]});
    </script>
    <script> //도넛 1월~9월 하면 되죠?네
    var ctx = document.getElementById("myPieChart2");
    var myPieChart2 = new Chart(ctx, {
      type: 'doughnut',
      data: {
        datasets: [
          {
            data: [${yearPay[0]},${yearPay[1]},${yearPay[2]},${yearPay[3]},${yearPay[4]}],
            backgroundColor: [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', ],
          },
        ],
        labels: ["쇼핑", "식비", "여가", "교통", "기타"],
      },
      options: {
    	    title: {
    	      display: true,
    	      
    	    },
    	    legend: {
    	      usePointStyle: true,
    	      position: 'bottom',
    	      align: 'center',
    	      labels: {
    	        fontSize: 12,
    	        boxWidth: 20,
    	        usePointStyle: true
    	      }

    	    }
    	  },
    });

    </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

  <style>

	.form{
		margin: 0 0 0 0 !important;
	}
    .target_money_text {
      position: relative;
      margin: 0 0 15 0;

    }

    .member_ui {
      position: relative;
      top: -100px;
    }

    .input_target_money {
      position: relative;
	  margin: 0 0 0 0 !important;

    }

    .item {
      flex-basis: 50%;
    }

    .area_chart_div {
      width: 600px;
      height: 230px;
    }

    .main_bottom_div {
      margin-top: 50px;
      height: 340px;
      width: 600px;
      
      display: flex;
      justify-content: space-between;
    }

    .div_ex {
      width: 282px;
      height: 275px;
      
    }

    .ex1 {
      position: absolute;
        width: 480px !important;
        height: 240px !important;
        left: -49px;
        bottom: 6px;
    }

    hr {
      border: 0;
      border-bottom: solid 2px #e5e5e5;
      margin: 1em 0;
    }
  .card_div{
    position: absolute;
    border: 2px solid rgb(214, 102, 255);
    border-radius: 20px;
    width: 141%;
    height: 50%;
    left: -267px;
    bottom: -328px;
}
.target_box .target_margin{
  margin-top: 10px !important;
}
.day1{
      background-color: #ed2a61;
    }
    .sec_cal {
      width: 360px;
      margin: 0 auto;
      
    }
  
    .sec_cal .cal_nav {
      display: flex;
      justify-content: center;
      align-items: center;
      font-weight: 700;
      font-size: 48px;
      line-height: 78px;
    }
  
    .sec_cal .cal_nav .year-month {
      width: 125px;
      font-size: xx-large;
      text-align: center;
      line-height: 1;
    }
  
    .sec_cal .cal_nav .nav {
      display: flex;
      border: 1px solid #333333;
      border-radius: 5px;
    }
  
    .sec_cal .cal_nav .go-prev,
    .sec_cal .cal_nav .go-next {
      display: block;
      width: 23px;
      height: 49px;
      font-size: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  
    .sec_cal .cal_nav .go-prev::before,
    .sec_cal .cal_nav .go-next::before {
      content: "";
      display: block;
      width: 20px;
      height: 20px;
      border: 3px solid #000;
      border-width: 3px 3px 0 0;
      transition: border 0.1s;
    }
  
    .sec_cal .cal_nav .go-prev:hover::before,
    .sec_cal .cal_nav .go-next:hover::before {
      border-color: #ed2a61;
    }
  
    .sec_cal .cal_nav .go-prev::before {
      transform: rotate(-135deg);
    }
  
    .sec_cal .cal_nav .go-next::before {
      transform: rotate(45deg);
    }
  
    .sec_cal .cal_wrap {
      padding-top: 5px;
      position: relative;
      margin: 0px auto;
    }
  
    .sec_cal .cal_wrap .days {
      display: flex;
      margin-bottom: 13px;
      padding-bottom: 4px;
      border-bottom: 1px solid #ddd;
    }
  
    .sec_cal .cal_wrap::after {
      top: 368px;
    }
  
    .sec_cal .cal_wrap .day {
      display: flex;
      align-items: center;
      justify-content: center;
      width: calc(100% / 7);
      text-align: left;
      color: #999;
      font-size: 12px;
      text-align: center;
      border-radius: 5px
    }
  
    .current.today {
      background: rgb(242 242 242);
    }
  
    .sec_cal .cal_wrap .dates {
      display: flex;
      flex-flow: wrap;
      height: 167px;
    }
  
    .sec_cal .cal_wrap .day:nth-child(7n -1) {
      color: #3c6ffa;
    }
  
    .sec_cal .cal_wrap .day:nth-child(7n) {
      color: #ed2a61;
    }
  
    .sec_cal .cal_wrap .day.disable {
      color: #ddd;
    }
	.sun{
		margin: 0 0 0 0;
	}
	#day1{
		background-color: yellow;
		text-color:black;
	}
	#day2{
		background-color: yellow;
		text-color:black;
	}
	.
  
  </style>

</body>

</html>