<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
<!doctype html>
<html lang="utf-8">
<head>

<style>
	#modi{
		float:right;
		
	}
	#del{
		float:right;
		margin-right:10px;
	}
	#cmtmemo{
		float:left;
	}
	
</style>

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
    					
    <script>
    	function commentchk(){
    		alert("댓글을 등록하시려면 로그인해주세요!");
    	}
    </script>
    
    <script type="text/javascript">
    	function dele(dno){
    		if(confirm("정말 삭제하시겠습니까?")){
    			document.location="bbs_del?dno="+dno;
    		}
    	}
    </script>
    
    <script>
    	function cmtchk(){
    		$.ajax({
    			url:'${pageContext.request.contextPath}/cmt_del',
    			type:"post",
    			dataType:"json",
    			data:{'cmtno':$('#cmtno').val()},
    			success:function(data){
    				$("#cmtmemo"+data).remove();
    				$("#cmt1"+data).remove();
    				$("#jelly"+data).remove();
    			}
    		});
    	}
    </script>
    
    
</head>
<body>
	<!-- 게시판 자세히보기 -->
	<section>
	<form action="real_write" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-12" style="padding-top:100px">
					<h2>자유게시판</h2>
					<hr style="border:solid 2px black;">
				</div>
				<div class="col-md-3">
					<img src="resources/img/ㅈㄹㅃ.jpeg" style="width:65%">
				</div>
				<div class="col-md-9">
					<h3>글제목 : ${Dbbsvo.title }</h3>
					<div class="col-md-9" style="padding-top:5px">
						<h5>아이디 : ${Dbbsvo.id }</h5>
						<h5>날짜 : ${Dbbsvo.day }</h5>
						<h5>조회수 : ${Dbbsvo.cnt }</h5>
					</div>
					<div class="col-md-9">
						<h5> 글번호 : ${Dbbsvo.no }</h5>
					</div>
				</div>
				<div class="col-md-12" style=padding-top:100px>
					${Dbbsvo.memo}
				</div>
				
				<div class="col-md-12" style=padding-top:100px>
					<hr style="border:solid 2px black;">
				</div>
				
				<div class="col-md-4">
					<a href="bbs_free"><button type="button" class="btn btn-primary">목록보기</button></a>
				</div>
				
				<c:set var="id1" value="${Dbbsvo.id }" />
				<c:set var="id2" value="${sessionScope.userid }" />
				
				<c:choose>
					<c:when test="${id1==id2}">	   <!-- 게시판의 아이디와 세션의 아이디가 일치할경우 수정/삭제 활성화 -->
						<div class="col-md-8">		
							<a href="bbs_mod?mno=${Dbbsvo.no }"><button type="button" class="btn btn-primary" id="modi">수정</button></a>
							<button type="button" onclick="dele(${Dbbsvo.no})" class="btn btn-primary" id="del">삭제</button>
						</div>						
					</c:when>
				</c:choose>
				
			</div>
		</div>
	</form>
	</section>
	
	<!-- 댓글 등록 -->
	<section>
		<form action="comment_input" method="post">
			<div class="container">
				<div class="row">
				
					<div class="col-md-10" style=padding-top:60px>
    					<textarea class="form-control" id="exampleFormControlTextarea1" rows="5" name="memo"></textarea>
					</div>
					<input type="hidden" name="no" value="${Dbbsvo.no}">
					<input type="hidden" name="id" value="${sessionScope.userid}">
					<c:choose>
						<c:when test="${sessionScope.userid == null }">
							<div class="col-md-2" style=padding-top:60px>	<!-- 로그인하지않았을경우 -->
								<button type="button" onclick="commentchk()" style="width:130pt; height:100pt;" class="btn btn-secondary btn-lg btn-block">댓글등록</button>
							</div>
						</c:when>
						
						<c:when test="${sessionScope.userid != null }">
							<div class="col-md-2" style=padding-top:60px>	<!-- 로그인했을경우 -->
								<button type="submit" style="width:130pt; height:100pt;" class="btn btn-secondary btn-lg btn-block">댓글등록</button>
							</div>
						</c:when>
					</c:choose>
					
					
					<!-- 댓글목록 -->
				<c:forEach items="${cmtvo }" var="cmt">
				
					<input type="hidden" id="cmtno" value="${cmt.bbscommno}">
					<div class="col-md-1" style="padding-top:30px" id="jelly<c:out value="${cmt.bbscommno}"/>">
						<img src="resources/img/jelly.jpg" style="width:100%">
					</div>
					<div class="col-md-3" style="padding-top:30px" id="cmt1<c:out value="${cmt.bbscommno}"/>">
						ID : ${cmt.id }
						<div class="col-md-4">
							${cmt.day }
						</div>
					</div>
					
					<div class="col-md-8" style="padding-top:30px" id="cmtmemo<c:out value="${cmt.bbscommno}"/>">
							${cmt.memo }
					<c:choose>
						<c:when test="${cmt.id==id2 }">		<!-- 댓글아이디와 세션아이디가 일치할경우 -->
							<a href="#" onclick="cmtchk()"><img src="resources/img/trash.png" style="width:2%"></a>
						</c:when>
					</c:choose>
					</div>
				</c:forEach>
				</div>
			</div>
		</form>
	</section>
	
</body>
</html>