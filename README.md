# H_project
MVC2 JSP &amp; Servlet Project

* 취미와 관심사를 공유하는 웹페이지 구상, 커뮤니티 페이지인 만큼 UX 에 집중(Ajax, JavaScript, Jquery, BootStarp, Chart.js, Parallax.js, Slick.js..) 
 
* Model 2 방식을 따르며, Mvc 패턴

<hr>

**언어**
 * Java, Jsp & Servlet, JavaScript

**웹표준**
 * HTML, CSS
 
**프레임워크 및 플러그인**
 * BootStrap, Jquery, Mybatis, Ajax, Chart.js, Slick.js, Parallax.js
 
**의존**
 * commons-dbcp2
 * commons-logging
 * commmons-pool2
 * gson
 * lombok, mysql-connector-java

**데이터 베이스**
 * MySQL

<hr>

**Presiontation-Tier**

 * JSP 를 기반으로한 View, JavaScript 함수 모듈화, Jquery 함수 사용과 에니메이션으로 UX 증진을 꾀함,  Ajax 통신구현
 * 배경전환에 Navar 색상 변경, JavaScript 함수로 회원 가입란의 input이 모두 채워졌을시 애니메이션 동작
 * Chart.js 를 이용한 조회수 통계로 UX 및 데이터 시각화 꾀함.
 * 회원 탈퇴 후 안내문으로 사용자 UX 증진 꾀함
 
**Service-Tier**

 * properties 파일을 이용해서 경로에따른 클래스의 객체를 찾아옴.
 * 스프링의 Dispatcher 역할을 하는 FrontServlet 에서 뷰코드에 따른 Redirect, Forward, Json 파싱 등의 분기점을 나눔
 
 **Persistence-Tier**
 
  * commons-dbcp2 를 이용한 데이터베이스 커넥트
  * MySQL 의 limit 함수를 이용한 페이지네이션

<hr>

**Main View**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EB%A9%94%EC%9D%B8.PNG)

<hr>

**Login**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EB%A1%9C%EA%B7%B8%EC%9D%B8.PNG)

<hr>

**Empty Post List**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B8%80%20%EC%97%86%EC%9D%8C.PNG)

<hr>

**Post List**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EB%AA%A9%EB%A1%9D.PNG)

<hr>

**Write Post**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EA%B8%80%EC%93%B0%EB%81%BC.PNG)

<hr>

**Post Detail**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B8%80%20%ED%99%94%EB%A9%B4.PNG)

<hr>

<hr>

**Delete Post**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/H%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B8%80%EC%82%AD%EC%A0%9C.PNG)

<hr>

**WithDrawal**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/H%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%ED%9A%8C%EC%9B%90%ED%83%88%ED%87%B4.PNG)

<hr>

**WithDrawal Complete**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%ED%9A%8C%EC%9B%90%ED%83%88%ED%87%B4%EC%99%84%EB%A3%8C.PNG)

<hr>

**Parallax.js**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%ED%8C%A8%EB%9F%B4%EB%A0%89%EC%8A%A4.PNG)

<hr>

**Chart.js**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EC%B0%A8%ED%8A%B8.PNG)

<hr>

**Properties**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%ED%94%84%EB%A1%9C%ED%8D%BC%ED%8B%B0.PNG)

<hr>

**Properties Loading And Make Instance**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%ED%94%84%EB%A1%9C%ED%8D%BC%ED%8B%B0%20%EB%A1%9C%EB%94%A9.PNG)

<hr>


**컨트롤러에 뷰코드에 따른 분기**

![](https://github.com/ywsjsm/H_project/blob/master/WebContent/imageUpload/h%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EB%A6%AC%ED%84%B4%20%EB%B7%B0%EC%BD%94%EB%93%9C%20%EB%8B%B9%20%EB%B6%84%EA%B8%B0%20%EC%A0%90.PNG)
