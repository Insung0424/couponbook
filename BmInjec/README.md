# Java Configuration으로 변경  
- XML Configuration을 Java Configuration으로 변경하기  
  
  
## [Bconfig.java](https://github.com/harteh/MavenClass/blob/f6e0c183ba13b71dec2bc95193d6ce176f8a85c2/BmInjec/src/main/java/ems/memberems/main/BConfig.java) 
+ @Configuration    
    - 일반 클래스가 아닌 빈설정 클래스임을 명시한다
    
+ [@ComponentScan](https://github.com/harteh/MavenClass/blob/f6e0c183ba13b71dec2bc95193d6ce176f8a85c2/BmInjec/src/main/java/ems/memberems/main/BConfig.java#L11)  
    - Component를 읽어올 패키지 경로를 명시한다
    - 두개 이상일때는 배열로 담는다  
  
+ [@Bean](https://github.com/harteh/MavenClass/blob/f6e0c183ba13b71dec2bc95193d6ce176f8a85c2/BmInjec/src/main/java/ems/memberems/main/BConfig.java#L14)  
    - 읽어온 컴포넌트들에 주입할 Student 객체를 빈으로 등록한다  

## 각각의 클래스들
+ @Component
	- 각 클래스들에 @Component를 붙여주어 객체를 생성한다 
	
## [Main 클래스](https://github.com/harteh/MavenClass/blob/f6e0c183ba13b71dec2bc95193d6ce176f8a85c2/BmInjec/src/main/java/ems/memberems/main/MainClass.java#L43)
+ AnnotationConfigApplicationContext로 bean 설정 클래스를 지정한다
	- AnnotationConfigApplicationContext ctx2 = new AnnotationConfigApplicationContext(BConfig.class);  
+ ctx2.getBean(클래스타입) 으로 필요한 객체를 생성한다
	