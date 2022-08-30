
function getGraph(){
	var tradeCntList = [];
	var cntDate = $('#chkDay').val();
	console.log(cntDate);
	
	$.ajax({
		url:'/tradeWeekCnt',
		type:'get',
//		data:{cntDate:cntDate},
//		dataType:"json",
		success:function(data){
				console.log("확인용!!!"+data);
			//그래프에 나타낼 데이터 담기
			for (let i=0; i<data.length; i++){
				console.log(data[i]);
				tradeCntList.push(data[i]);
			}
			
			// Graphs
			  // eslint-disable-next-line no-unused-vars
			 new Chart(document.getElementById('myChart'), {
			    type: 'line',
			    data: {
			      labels: [
			        'Sunday',
			        'Monday',
			        'Tuesday',
			        'Wednesday',
			        'Thursday',
			        'Friday',
			        'Saturday'
			      ],
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
			alert("그래프 실패 그만!!!!!!!");
		}
		
	})// ajax
	
	
	
	
}//getGraph