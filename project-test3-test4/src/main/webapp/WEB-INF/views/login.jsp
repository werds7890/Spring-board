<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="utf-8">
<head>


<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>테일즈위버</title>
<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      
    <c:if test="${newregi eq 1}">
	    <script>
	    	alert("가입되었습니다");
	    </script>
	</c:if>
	
	
	
	
	<!-- 아이디 중복체크 -->
	<script>
		function idchk(){
			
			$.ajax({
				url:'${pageContext.request.contextPath}/bbs_idchk',
				type:"post",
				dataType:"json",
				data:{'id':$('#reid').val()},
				success:function(data){
					if(data==0){
						alert("사용 가능한 아이디입니다.")
					}else if(data==1){
						alert("이미 사용중인 아이디입니다.");
						reid.value="";
					}				
				}
			});
		}
		
	</script>
		
		<!-- 유효성검사 -->
		<script>
		function chk(){
			var frm=document.getElementById('regichk');
			var idd=document.getElementById('reid').value;
			var pw1=document.getElementById('pw1').value;
			var pw2=document.getElementById('pw2').value;
			if(idd==""){
				alert("아이디를 입력해주세요");
			}else if(pw1=="" || pw2==""){
				alert("비밀번호를 입력해주세요");
			}else if(pw1!=pw2){
				alert("비밀번호를 동일하게 입력해주세요");
			}else {
				frm.submit();
			}
		}
		</script>
	
	
</head>
	
		
<body>

	<section>
		<div class="container">
			<div class="row">
				<img src="resources/img/loginlogo.jpg" class="col-md-12" style=padding-top:50px>
			</div>
			
			<div class="row" style=padding-top:10px>
				<div class="col-md-3">
				<h2 class="modal-title" id="exampleModalLabel">Login</h2>
				<form action="loginuser" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">ID</label> 
						<input type="text" class="form-control"
								id="sendid" placeholder="ID" name="id">
						<small id="emailHelp" class="form-text text-muted">아이디를 입력해주세요</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> 
					<input type="password" class="form-control"
								id="sendpw" placeholder="Password" name="pass">
					</div>
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">Check
							me out</label>
					</div>
					<button type="submit" class="btn btn-primary">로그인</button>
					<a href="home"><button type="button" class="btn btn-primary">돌아가기</button></a>
				</form>
				</div>
			</div>		
		</div>
	</section>

</body>
</html>