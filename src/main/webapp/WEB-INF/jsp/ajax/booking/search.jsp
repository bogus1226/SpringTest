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
	<%@ include file="header.jsp" %>  
	<!-- 메인메뉴 팬션소개,객실보기 등등 -->
	<%@ include file="nav.jsp" %>  
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
      	
       	<article class="contents bg-color2">
      		<div class="h-25 d-flex align-items-center text-color">
        		<h5 class="font-weight-bold ml-4 mt-1">예약 확인</h5> 
       		</div>
          	<div class="d-flex justify-content-center">
         		<div id="non-member-contents">
              		<div class="d-flex justify-content-end">
			            <label class="text-color small mt-2">이름</label>
			            <input class="form-control ml-3" id="name" style="width: 250px;height:35px" type="text">
                   	</div>
                    <div class="d-flex justify-content-end mt-3 ">
                        <label class="text-color small mt-2">전화번호</label>
                        <input class="form-control ml-3" id="phonenumber" style="width: 250px;height:35px" type="text" placeholder="숫자만 입력 - 자동입력" maxlength="13">
                    </div>
                    <div class="mt-2 d-flex justify-content-end">
                        <button id="lookupBtn" type="button" class="btn bg-success text-white" style="width: 80px;height:37px"><span class="small">조회 하기</span></button>
                    </div>  
               	</div>   
        	</div>                       
     	</article>
           
     	<aside class="text2 text-color d-flex justify-content-center align-items-center bg-color">
       		<div>
	            <h2>예약문의 :</h2>
	            <h2>010-</h2>
	            <h2>000-1111</h2>
         	</div>
   		</aside>
	</section>
       
 	<!-- copyright -->
	<%@ include file="footer.jsp" %>

</div>

<script>
    $(document).ready(function(){
		
  	// 전화번호 ( - ) 하이픈 자동입력 
 		$("#phonenumber").on("input", function() { 
 			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
 		});
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

        $("#lookupBtn").on("click", function(){
	     	let name = $("#name").val();
	     	let phoneNumber = $("#phonenumber").val();
     	   
           	if($("#name").val() == "") {
                alert("이름을 입력하세요.");
                return;
            }
            if($("#phonenumber").val() == "") {
                alert("전화번호를 입력하세요.");
                return;
            } else if($("#phonenumber").val() != "") {
                let regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
                if(!regExp.test($("#phonenumber").val())){
                    alert("전화번호를 정확히 입력하여 주십시오.");
                    return;
                }
            }
            if($("#date").val() == "") {
                alert("날짜를 선택하세요.");
                return;
            }
            
            $.ajax({
				type:"get"
				, url:"/booking/searchList"
				, data:{"name":name, "phoneNumber":phoneNumber}
				, success:function(data){
					
				if(data.result == "success") {

					let name = data.booking.name;
					let date = data.booking.date.substring(0,10);
					let day = data.booking.day;
					let headcount = data.booking.headcount;
					let state = data.booking.state;
					
					alert("이름 : " + name + "\n" + 
							"날짜 : " + date + "\n" +
							"일수 : " + day + "\n" +
							"인원 : " + headcount + "\n" +
							"상태 : " + state);
					}else {
						alert("조회 결과가 없습니다");
					}
				}
				, error:function(){
					alert("조회 에러");
				}
			});
						
					
			
			
		});
                    
    });
</script>
</body>
</html>