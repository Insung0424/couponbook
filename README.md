# 0831 BM (bmAdmin)
로그인, 회원가입 버튼을 임시로 사용하기 위해서 "loginMain" 페이지를 이용했습니다  
차후엔 실제 메인 페이지의 버튼에 연결하고 삭제 예정입니다  
프로젝트에 기존 폴더는 삭제하고 제 작업 부분만 올립니다  
## 로그인  
 - 구현 화면   <img src="https://github.com/harteh/SpringMVC/blob/main/image/pj_login.gif?raw=true" width="60%"	/>      

	 - /member/login  
	 - 로그인 성공시 loginMain 페이지로 이동됨  	
 
## 회원가입  
 - 구현 화면   <img src="https://github.com/harteh/SpringMVC/blob/main/image/pj_join1.gif?raw=true" width="60%"	/>  

	- /member/join  
	- 회원가입 성공시 login 페이지로 이동됨  
	- ajax를 이용해서 이메일 중복 체크 시 데이터 검증
	- 카카오 우편번호 api로 주소 검색 후 입력 처리  

## 카카오 로그인
 - 구현 화면   <img src="https://github.com/harteh/SpringMVC/blob/main/image/pj_kakaoLogin.gif?raw=true" width="60%"	/>  

	- KaKaoController  
	- /member/kakaoLogin  

## 관리자 메인
 - 구현 화면   <img src="https://github.com/harteh/SpringMVC/blob/main/image/admin1.PNG?raw=true" width="65%"	/>
   
     
	- AdminController
	- AdminChkIntercepter
		- HandlerInterceptor를 상속받아 관리자가 아닌 이용자의 접근을 차단한다
	- /adminMain : 임시 디자인의 관리자 메인 페이지
	- 로그인 시 회원 등급으로 구분하여 접근가능  
	- 메뉴1: 1주일간의 거래내역 목록 출력, 상단에 요일별 거래건수를 그래프로 구현
	- 메뉴 2: 거래내역 전체 출력(페이징, 검색 기능 구현 예정)
	- 메뉴 3: 회원 목록 출력(검색, 수정 기능) 
	
## 에러페이지
 - 구현 화면   <img src="https://github.com/harteh/SpringMVC/blob/main/image/pj_adminIntercepter.gif?raw=true" width="60%"	/>  

	- /errorPage
	- 컨트롤러에서 에러 메시지를 받아와서 경고창에 띄움
	- 페이지는 history.back()으로 뒤로가기 처리
	- 인터셉터를 이용하여 관리자 페이지에 비정상적인 접근을 차단함  
  
##  
## 설정
	- root-context.xml 
		- sqlSession 빈 등록 설정
	- pom.xml: 디펜던시 추가함
		- javax.validation : 유효성 검사위함(불필요시 삭제)
		- com.google.code.gson : 카카오 로그인을 위한 설정  
	- pom.xml: 버전 수정
		- mybatis : 3.4.6 에서  3.5.2 로  업그레이드 함   
	- interceptors 설정 추가
		- servlet-context.xml에 추가
		- 관리자(메인)페이지에 일반회원, 비로그인 회원 접근 금지 설정 추가  
