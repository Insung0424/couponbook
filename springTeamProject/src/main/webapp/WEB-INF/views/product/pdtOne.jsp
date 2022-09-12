<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세페이지</title>
	<!-- 부트스트랩 4.6.2 CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
</head>
<body class = "px-5 py-5">

	<h3>상세페이지 확인</h3><hr>
	
	<!-- 받아온 쿠폰 정보를 출력 -->
	<p>상품 ID	:	<c:out value="${onePdt.product_id }" /></p>
	<p>카테고리	:	<c:out value="${onePdt.category_id }" /></p>
	<p>회사이름	:	<c:out value="${onePdt.company_name }" /></p>
	<p>쿠폰이름	:	<c:out value="${onePdt.pd_name }" /></p>
	<p>쿠폰가격	:	<c:out value="${onePdt.pd_price }" /></p>
	<p>거래상태	:	<c:out value="${onePdt.pd_status }" /></p>
		<c:set var="img" value="${fn:split(onePdt.pd_img, ',')[0]}"></c:set>
		<c:set var="simg1" value="${fn:replace(img, '%5C', '/')}"></c:set>
		<c:set var="simg2" value="${fn:replace(simg1, '%3A', ':')}"></c:set>
	<p>쿠폰이미지	: 	<img src="/getImg?fileNameNPath=${simg2}" class="card-img-top" alt="Not Found Image"> </p>
	<p>사용처	: 	 ${onePdt.pd_desc } </p>
	<!-- ckeditor 로 db로 값을 삽입하면 html 태그 전체가 삽입되므로 값자체를 화면에 띄우거나 다른 방법을 사용해야한다 -->
	<p>쿠폰할인율	:	<c:out value="${onePdt.pd_discount }" /></p>
	<p>등록일	:	<c:out value="${onePdt.pd_date }" /></p>
	
	<!-- 지도 출력 -->
	<div id="map" style="width:600px;height:350px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fda0bdd386436f995da2c1fca117179&libraries=services"></script>
	<script>
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	
	// 키워드로 장소를 검색합니다
	var key_desc = "${onePdt.pd_desc }";
	console.log(key_desc);
	ps.keywordSearch(key_desc, placesSearchCB); 
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	</script>	
	

	<button class="btn btn-outline-secondary mb-3" onclick="history.back();">뒤로가기</button>

</body>
</html>