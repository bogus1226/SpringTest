<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resource/booking.css" type="text/css">
<title>통나무 팬션</title>
</head>

<body>

   <div id="wrap">
       <header class="logo d-flex justify-content-center align-items-center">
           <div>통나무 팬션</div>
       </header>
       <!-- 메인메뉴 팬션소개,객실보기 등등 -->
       <nav class="main-menu bg-color">
           <ul class="nav nav-fill font-weight-bold">
               <li class="nav-item"><a href="#" class="nav-link text-color mt-1">팬션소개</a></li>
               <li class="nav-item"><a href="#" class="nav-link text-color mt-1">객실보기</a></li>
               <li class="nav-item"><a href="#" class="nav-link text-color mt-1">에약안내</a></li>
               <li class="nav-item"><a href="#" class="nav-link text-color mt-1">커뮤니티</a></li>
           </ul>
       </nav>
       <!-- 사진 들어가는공간 -->
       <div class="image">
           <img id="img" src="/img/test06_banner1.jpg">
       </div>
       <!--메인 컨텐츠의 공간 -->
       <section class="main-contents d-flex">
           <!-- "실시간 예약하기" 글씨 들어가는 공간 -->
           <aside class="test1 text-color d-flex justify-content-center align-items-center bg-color">
               <div>
                   <h1>실시간</h1>
                   <h1>예약 하기</h1>
               </div>         
           </aside>
           <!-- 회원 비회원이 예약확인을 조회할수있는 공간 -->
           <article class="contents bg-color2">
               <!-- 예약확인 글씨와 회원 비회원 radio 체크가 가능한 공간 -->
               <div class="h-25 d-flex align-items-center text-color">
                   <h5 class="font-weight-bold ml-4 mt-1">예약 확인</h5> 
                   <label class="small ml-4 mt-2">회원<input type="radio" name="member" value="member" checked></label>
                   <label class="small ml-3 mt-2">비회원<input type="radio" name="member" value="non-member"></label>
               </div>
               <!-- 회원, 비회원 중 서로 양식에 맞춰 조회 할수있는 공간 -->
               <div class="d-flex justify-content-center">
                   <!-- 회원일 경우 눈에 나타나는 양식 -->
                   <div id="member-contents">
                       <div class="d-flex justify-content-end">
                           <label class="text-color small mt-2">아이디 : </label>
                           <input class="form-control ml-3" id="id" style="width: 250px;height:35px" type="text">
                       </div>
                       <div class="d-flex justify-content-end mt-3 ">
                           <label class="text-color small mt-2">비밀번호 : </label>
                           <input class="form-control ml-3" id="password" style="width: 250px;height:35px" type="password">
                       </div>
                       <div class="mt-2 d-flex justify-content-end">
                           <button id="lookupBtn1" type="button" class="btn bg-success text-white" style="width: 80px;height:37px"><span class="small">조회 하기</span></button>
                       </div>  
                   </div>        
                   <!-- 비회원일 경우 눈에 나타나는 양식 -->
                   <div id="non-member-contents" class="d-none">
                       <div class="d-flex justify-content-end">
                           <label class="text-color small mt-2">이름</label>
                           <input class="form-control ml-3" id="name" style="width: 250px;height:35px" type="text">
                       </div>
                       <div class="d-flex justify-content-end mt-3 ">
                           <label class="text-color small mt-2">전화번호</label>
                           <input class="form-control ml-3" id="phonenumber" style="width: 250px;height:35px" type="text" placeholder="예) 010-1234-5678" maxlength="13">
                       </div>
                       <div class="d-flex justify-content-end mt-3 ">
                           <label class="text-color small mt-2">날짜</label>
                           <input class="form-control ml-3" id="date" autocomplete="off" style="width: 250px;height:35px" type="text">
                       </div>
                       <div class="mt-2 d-flex justify-content-end">
                           <button id="lookupBtn2" type="button" class="btn bg-success text-white" style="width: 80px;height:37px"><span class="small">조회 하기</span></button>
                       </div>  
                   </div>   
               </div>                       
           </article>
           <!-- "예약문의 등" 글씨가 들어가는 공간 -->
           <aside class="text2 text-color d-flex justify-content-center align-items-center bg-color">
               <div>
                   <h2>예약문의 :</h2>
                   <h2>010-</h2>
                   <h2>000-1111</h2>
               </div>
           </aside>
       </section>
       <!-- copyright -->
       <footer class="copyright small text-secondary mt-3 ml-4">
           <div>제주특별자치도 제주시 애월읍</div>
           <div>사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김동욱</div>
           <div>Copyright 2025 tongnamu All right reserved</div>
       </footer>

   </div>
   

   <script>
       $(document).ready(function(){
   
           // 3초마다 화면의 이미지가 변경되는 코드
           // count는 0부터 시작해서 4가 된후 다시 0으로되도록 무한루프로 만들었습니다.
           var imageList = [
           "/img/test06_banner1.jpg",
           "/img/test06_banner2.jpg",
           "/img/test06_banner3.jpg",
           "/img/test06_banner4.jpg",
           ];

           var imageIndex = 0;
           setInterval(function () {
               imageIndex++;
               if(imageIndex == imageList.length) {
                   imageIndex = 0;
               }
               $("#img").attr("src", imageList[imageIndex]);
           }, 3000)


           // 회원일경우 유효성 검사
           $("#lookupBtn1").on("click", function(){
               if($("#id").val() == "") {
                   alert("아이디를 입력하세요.");
                   return;
               }
               if($("#password").val() == "") {
                   alert("비밀번호를 입력하세요.");
                   return;
               }
               alert("아이디 : " + $("#id").val() + "\n" + "비밀번호 : " + $("#password").val() +"\n" + "조회중....")
           });


           // 비회원일 경우 유효성 검사
           $("#lookupBtn2").on("click", function(){
               if($("#name").val() == "") {
                   alert("이름을 입력하세요.");
                   return;
               }
               if($("#phonenumber").val() == "") {
                   alert("전화번호를 입력하세요.");
                   return;
               } else if($("#phonenumber").val() != "") {
                   // 인터넷에서 전화번호랑 핸드폰번호랑 둘다 가능한 정규식있어서 퍼왔습니다!
                   var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
                   if(!regExp.test($("#phonenumber").val())){
                       alert("전화번호를 정확히 입력하여 주십시오.");
                       return;
                   }
               }
               if($("#date").val() == "") {
                   alert("날짜를 선택하세요.");
                   return;
               }
               alert("이름 : " + $("#name").val() + "\n" + "전화번호 : " + $("#phonenumber").val() + "\n" + "날짜 : " + $("#date").val() + "\n" + "조회중....")
           });


           // 달력 한글화 하였습니다!
           // dateFormat 으로 결과 값이 눈에 보기 좋게 나오게하였습니다.
           // 오늘 이전 날짜는 선택 불가능하도록 하였습니다.
           $("#date").datepicker({
               dateFormat:"yy년 MM dd일 DD",
               monthNames: [ "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월" ],
               dayNames: [ "일요일","월요일","화요일","수요일","목요일","금요일","토요일" ],
               dayNamesMin: [ "일","월","화","수","목","금","토" ],
               yearSuffix: "년" ,
               showMonthAfterYear: true,
               minDate: 0,
           });


           // 회원이라면 비회원양식을 숨기고
           // 비회원이라면 회원양식을 숨기게 하였습니다! 
           $("input[name='member']").on("change", function(){
              if($(this).val() == "member") {
                   $("#member-contents").removeClass("d-none")
                   $("#non-member-contents").addClass("d-none")
              }

              if($(this).val() == "non-member") {
                   $("#member-contents").addClass("d-none")
                   $("#non-member-contents").removeClass("d-none")
              }
          });              
       });
   </script>
</body>
</html>