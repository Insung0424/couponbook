<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@include file="/WEB-INF/views/includes/admin_header.jsp"%>

<!-- 관리자 메인 : 메뉴1: Dashboard 부분  -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Chart  <span class="fs-5"> 일자별 거래건수 차트 (1주 단위)</span></h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          
        	<!-- 기준날짜 검색  
        	<form id="chkDateForm" action="/admin/adminMain"  method='get'>
        	<div class="bd-search  d-flex justify-content-end" id="dateSearch" >
	        	<div class="input-group mb-3">
	         
			  		<input type="text" class="datepicker_input form-control" placeholder="기준일" id="trade_time" name="trade_time" value='2022-08-20' required aria-label="Date input 3 (using aria-label)">
	         
		        	
					<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				</div>
	        </div>
        	
        	</form>
        	-->
        	<!-- 검색 조건 설정  pageMaker.cri.type 은 input hidden 으로 넘겨줌 : 날짜만 검색  
			<input type='hidden' name='type' value='<c:out value="T"/>' />  -->
        	
        </div>
      </div>

<!-- 차트 : 데이터 dashboard.js -->
      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>


      <h2>일주일 거래 목록</h2>
      <div class="table-responsive" style="height: 400px; margin-bottom: 100px;">
		<table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">상품 ID</th>
              <th scope="col">판매자 ID</th>
              <th scope="col">구매자 ID</th>
              <th scope="col">거래상태</th>
              <th scope="col">거래 일시</th>
            </tr>
          </thead>
          <tbody>
          
          <c:forEach items="${tradeList }" var="tList">
            <tr>
              <td> <c:out value="${tList.product_id }" /> </td>
              <td> <c:out value="${tList.sell_user_id }" /></td>
              <td> <c:out value="${tList.buyer_user_id }" /></td>
              <td> <c:out value="${tList.pd_status }" /></td>
              <td> <c:out value="${fn:substring(tList.trade_time,0,10) }" /></td>
            </tr>
           </c:forEach>



          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>



<script type="text/javascript">
$(document).ready( function() {
	
	var chkDateForm = $("#chkDateForm");
	var trade_time = $("#trade_time");
	
	$('.datepicker_input').datepicker({
	    format: 'yyyy-mm-dd',
	    autoclose: true,
	    language: 'ko'
	})
	.on('changeDate', function (e) {
	   console.log(e.date +" / "+ trade_time.val() );
	});

});


function getGraph(){
	var tradeCntList = [];
	var labelList = [];
	var trade_time = $("#trade_time").val();
	
	var chkTime = new Date(trade_time);
	
	//레이블
	/* var chkY = chkTime.getFullYear();
	var chkM = chkTime.getMonth()+1;
	var chkD = chkTime.getDate()-7;
	var dateName = [chkY, chkM, chkD];
	for (let i=0; i<data.length; i++){
		console.log("문장으로 합침===  "+[chkY, chkM, chkD]);
		labelList.push([chkY, chkM, chkD]);
		chkD++;
	}
		console.log("날짜---  "+labelList); */
	
	$.ajax({
		url:'/tradeWeekCnt',
		type:'get',
		data:{"trade_time":trade_time},
		dataType:"json",
		success:function(data){
			//그래프에 나타낼 데이터 담기
			for (let i=0; i<data.length; i++){
				console.log(data[i]);
				tradeCntList.push(data[i]);
			}
			
			// Graphs
			  // eslint-disable-next-line no-unused-vars
			      //labels: [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
			 new Chart(document.getElementById('myChart'), {
			    type: 'line',
			    data: {
			      labels: ['5일 전','4일 전','3일 전','2일 전','1일 전','오늘'],
			      datasets: [{
			        data: tradeCntList,
			        label: "거래내역",
			        
			        lineTension: 0,
			        backgroundColor: 'transparent',
			        borderColor: '#007bff',
			        borderWidth: 4,
			        pointBackgroundColor: '#007bff'
			      }]
			    },
			    options: {
			      scales: {
			        yAxes: [{
			          ticks: {
			            beginAtZero: false
			          }
			        }]
			      },
			      legend: {
			        display: false
			      }
			    }
			  }); //그래프 끝
		},
		error:function(){
			alert("그래프 오류!");
		}
		
	})// ajax
	
}//getGraph




</script>




<%@include file="/WEB-INF/views/includes/admin_footer.jsp"%>