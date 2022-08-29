# 0825 BM (bmLogin)
로그인, 회원가입 버튼을 임시로 사용하기 위해서 "loginMain" 페이지를 이용했습니다  
차후엔 실제 메인 페이지의 버튼에 연결하고 삭제 예정입니다  
프로젝트에 기존 폴더는 삭제하고 제 작업 부분만 올립니다  
## 로그인  
	- /member/login  
	- 로그인 성공시 loginMain 페이지로 이동됨  
## 회원가입  
	- /member/join  
	- 회원가입 성공시 login 페이지로 이동됨  
	- 가입 시 한글 깨짐 현상 있음  
	- 이메일 중복 버튼은 미완이여서 막아둠  
## 카카오 로그인
	- KaKaoController  
	- /member/kakaoLogin  
## 관리자 메인
	- AdminController
	- /adminMain : 임시 디자인의 관리자 메인 페이지
	- 로그인 시 회원 등급으로 구분하여 접근가능  
## 에러페이지
	- /errorPage
	- 에러시 alert 창을 띄우고 페이지를 되돌려보낸다
## 수정사항
	- pom.xml: 디펜던시 추가함
	-- javax.validation : 유효성 검사위함(불필요시 삭제)
	-- com.google.code.gson : 카카오 로그인을 위한 설정  
	- pom.xml: 버전 수정
	-- mybatis : 3.4.6 에서  3.5.2 로  업그레이드 함   
	- interceptors 설정 추가
	-- servlet-context.xml에 추가
	-- 관리자(메인)페이지에 일반회원, 비로그인 회원 접근 금지 설정 추가  
