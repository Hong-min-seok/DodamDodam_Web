<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

    
<c:set value="${user}" var="user"/>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,initial-scale=1" />
   <title>Find Id</title>
   <link rel="stylesheet" href="resources/css/bootstrap.css">
   <script src="resources/js/jquery.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/common.js"></script>
   <link rel="stylesheet" type = "text/css" href="resources/css/common.css">
   <link rel="stylesheet" type = "text/css" href="resources/css/findpw.css">
   <link rel="stylesheet" type = "text/css" href="resources/css/findpw.css">
<script type="text/javascript">
$( document ).ready(function() {
   
   $("#idBtn").click(function() {
      var id = $("#id").val();
      
      if(id == ""){
         alert("아이디를 입력해주세요.");
         location.href="./findpw";
      }else{
         
         var trans_object =
            {
               "id": id
            }
         
         var trans_json = JSON.stringify(trans_object)
         
         $.ajax({
            url: "./sendEmail",
            type: 'POST',
            dataType: 'json',
            data: trans_json,
            contentType: 'application/json',
            mimeType: 'application/json',
            success: function(retVal){
               
               if(retVal.id != "-"){
                  
                  alert("인증번호가 전송되었습니다. 확인해주세요.");
                  document.getElementById("dice").value=retVal.dice;
                  document.getElementById("inputId").value=retVal.id;
                  
               }else{
                  
                  alert("입력하신 아이디는 없는 아이디입니다. \n아이디를 다시 입력해주세요.");
                  
                  $('#id').val('');
                  $('#id').focus();   
               }
               
            },
            error: function(retVal, status, er){
               alert("error발생");
               
            }
         });
      }
      
   });
});
</script>
   
</head>

<header>
	
	<div class="pcview">
	
	
		<div class = "header navbar-fixed-top">
			<div class="logo">
				<a href="Dodam">
					<img alt="dodamlogo" src="resources/img/logo/logo.png">
				</a>
			</div>
			
			<div class="nav">
				<div class="navmenue"><a href="Dodam">HOME</a></div>
				<div class="navmenue"><a href="story">STORY</a></div>
				<div class="navmenue"><a href="dictionarylist?page=1">식물도감</a></div>
				<div class="navmenue"><a href="diary_list?page=1">관찰일지</a></div>
				<div class="navmenue"><a href="boardlist?page=1">갤러리</a></div>
				<div class="navmenue"><a href="movie">관리법</a></div>
			</div>
			
			<div class="login">
				<c:if test="${user != null}">
					
					<div class="sidelogo">
						${user.nick}님 안녕하세요!&nbsp;&nbsp;
						<img src="resources/img/icon/hamburger.png" class="sideopen">
					</div>
					<div onclick="history.back();" class="page_cover"></div>
	
					<div id="sidemenu">
						<div onclick="history.back();" class="close"></div>
						
						<div class="sidelogo">
							<img src="resources/img/icon/back.png" class="sideclose">
						</div>
						<img class="sideicon" src="resources/img/icon/flower_icon5.png">
						<div>- ${user.nick} -</div>
						<div style="font-size:11pt; margin-bottom: 3em">${user.userid}</div>
						<div class="navmenue"><a href="mypage">마이페이지</a></div>
						<div class="navmenue"><a href="mygarden">나의 화단</a></div>
						<button class="btn1" style="margin-top: 2em" onclick="location.href='logout'">로그아웃</button>
					</div>
					
				</c:if>
				
				<c:if test="${user == null}">
					<a href="login">
						<img class="loginicon" alt="login" src="resources/img/icon/key1.png" href="login">
					</a>
				</c:if>
				
			</div>
		</div>
		
		
	</div>
	
	<div class="mobileview">
	
	
		<div class = "header navbar-fixed-top">
			<div class="logo">
				<a href="Dodam">
					<img alt="dodamlogo" src="resources/img/logo/logo.png">
				</a>
			</div>
			
			<div class="login">
				
					<div class="sidelogo">
						<img src="resources/img/icon/hamburger.png" class="sideopen">
					</div>
					<div onclick="history.back();" class="page_cover"></div>
	
					<div id="sidemenu">
						<div onclick="history.back();" class="close"></div>
						
						<div class="sidelogo">
							<img src="resources/img/icon/back.png" class="sideclose">
						</div>
						
						<img class="sideicon" src="resources/img/icon/flower_icon5.png"><br>
						
						<c:if test="${user == null }">
							<button class="btn1" style="margin-top: 2em; margin-bottom: 2em" onclick="location.href='login'">로그인</button>
						</c:if>
						
						<c:if test="${user != null}">
							<div>- ${user.nick} -</div>
							<div style="font-size:11pt; margin-bottom: 3em">${user.userid}</div>
							<div class="navmenue"><a href="mypage">마이페이지</a></div>
							<div class="navmenue"><a href="mygarden">나의 화단</a></div>
						</c:if>
							<div class="navmenue"><a href="Dodam">HOME</a></div>
							<div class="navmenue"><a href="story">STORY</a></div>
							<div class="navmenue"><a href="dictionarylist?page=1">식물도감</a></div>
							<div class="navmenue"><a href="diary_list?page=1">관찰일지</a></div>
							<div class="navmenue"><a href="boardlist?page=1">갤러리</a></div>
							<div class="navmenue"><a href="movie">관리법</a></div>
						
						<c:if test="${user != null }">
							<button class="btn1" style="margin-top: 2em" onclick="location.href='logout'">로그아웃</button>
						</c:if>
					</div>
			</div>
		</div>
		
		
	</div>
</header>


<body>
   
   <h1 class="title">비밀번호 찾기</h1>
   <h4 class="subtitle">아이디를 입력하면 등록된 이메일로 인증번호를 전송해드립니다.</h4>
   
   <div class="container1">
   
      
         <label>아이디</label>
         <div class="subcontainer">
            <input type="text" id="id" name="id" placeholder="아이디를 입력하세요">
            <button class="btn1" id="idBtn">인증번호 전송</button>
         </div>

      <form name="findpw" action="./check_dice" method="post" onsubmit="return diceCheck();">
         <label>인증번호</label>
         <input type="hidden" id="dice" name="dice" value="">
         <input type="hidden" id="inputId"name="inputId" value="">
         <input type="text" id="inputDice" name="inputDice" placeholder="인증번호를 입력하세요">

      <input type="submit" class="btn1" id="btn-findPw" value="비밀번호 찾기">

      </form>
   </div>

   
   
</body>

   
   
   
<footer class="footer">
   <hr class="mx-0 px-0">
      <div class="container">
         <div class="f_item">
            <h5><span><img src="resources/img/main/flower.png"></span>
               <b class="text-dark"> Dodam <span class="text-muted">Dodam</span></b>
            </h5><br><small class="copy-rights cursor-pointer">Ⓒ 2020 EasyRaise Digital Technologies</small><br><small>Copyright.All Rights Resered.</small>
         </div>
         <div class="f_item">
            <ul class="list-unstyled">
               <h3 class="text-muted">Introduce</h3><br>
               <li class="text-muted">You can grow plants easily through the
                  website!</li>
               <li class="text-muted">Both websites and applications are
                  available!</li>
               <li class="text-muted">You can find various kinds of flowers
                  on the website.</li>

            </ul>
         </div>
         <div class="f_item">
            <ul class="list-unstyled">
               <h3 class="text-muted">Offer</h3><br>
               <li class="text-muted">A botanical illustrated book</li>
               <li class="text-muted">Observation Diary</li>
               <li class="text-muted">Notify me when water is low</li>

            </ul>
         </div>
         <div class="f_item">
         <ul class="list-unstyled">
            <h3 class="text-muted">Maker</h3><br>
            <li class="text-muted">BoYoung Park</li>
            <li class="text-muted">JuSeong Seog</li>
            <li class="text-muted">HyoGyeong An</li>
            <li class="text-muted">HeeKyung Yu</li>
            <li class="text-muted">MinSeok Hong</li>

         </ul>
      </div>
   </div>
</footer>

</html>