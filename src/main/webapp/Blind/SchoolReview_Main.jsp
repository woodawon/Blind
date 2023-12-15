<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="SchoolReview_Main.css">
<link rel="stylesheet" href="global.css">
<meta charset="UTF-8">
<title>학교 리뷰 메인</title>

</head>
<body>
	<div id="all" class="div_all">
		<div id="main_header">
			<h2 id="main_comment">현재 학생들의 학교 리뷰</h2>
			<p id="main_content">학생들이 직접 평가하는 학교는 어떤지 확인해보세요</p>
			<form action="SchoolReviewProcess.jsp">
				<input type="text" placeholder="학교 검색" id="search" size="30"
					name="q">
			</form>
		</div>

		<div id="section_all" class="div_all">
			<form id="review" action="흠_알아서_해_back들아.jsp">
				<h2>내 학교 리뷰하기</h2>
				<p id="review_write">
					회원님의 리뷰는 다른 회원님들이 학교를<br>선택하는 데에 도움이 됩니다
				</p>
				<button>리뷰 쓰기</button>
			</form>
			<img id="exImg" src="./images/review_image.jpg" alt="리뷰 이미지">
		</div>

		<div id="populer_school" class="div_all">
			<h2 id="populer">인기 학교</h2>

			<div id="sangil_review" class="review_preview">
				<a href="sangil_review.jsp"><img src="./images/sangil.png"
					alt="상일미디어고등학교 로고" class="reviewIMG"></a>
				<div class="name_ul">
					<a href="sangil_review.jsp" class="school_name">상일미디어고등학교 (5.0)</a>
					<ul>
						<!-- 실제 블라인드의 별점은 구현불가(폰트X, 이미지로 넣을경우 메모리 초과) -->
						<li><a href="sangil_post.jsp" class="review_ul">게시물</a></li>
						<li><a href="https://sangilmedia.sen.hs.kr/71714/subMenu.do"
							class="review_ul">급식</a></li>
						<li><a
							href="https://www.google.com/search?q=%EC%83%81%EC%9D%BC%EB%AF%B8%EB%94%94%EC%96%B4%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90+%EA%B5%90%EB%B3%B5&sca_esv=591053097&rlz=1C1CHBD_koKR1050KR1050&tbm=isch&source=lnms&sa=X&ved=2ahUKEwiiga7PwJCDAxUSs1YBHW91APcQ_AUoAXoECAEQAw&biw=1536&bih=695&dpr=1.25"
							class="review_ul">교복</a></li>
					</ul>
				</div>
			</div>

			<div id="semyeong_review" class="review_preview div_all">
				<a href="semyeong_review.jsp"><img src="./images/semyeong.png"
					alt="세명컴퓨터고등학교 로고" class="reviewIMG"></a>
				<div class="name_ul">
					<a href="sangil_review.jsp" class="school_name">세명컴퓨터고등학교 (4.8)</a>
					<ul>
						<!-- 실제 블라인드의 별점은 구현불가(폰트X, 이미지로 넣을경우 메모리 초과) -->
						<li><a href="semyeong_post.jsp" class="review_ul">게시물</a></li>
						<li><a href="https://smc.sen.hs.kr/199000/subMenu.do"
							class="review_ul">급식</a></li>
						<li><a
							href="https://www.google.com/search?q=%EC%84%B8%EB%AA%85%EC%BB%B4%ED%93%A8%ED%84%B0%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90+%EA%B5%90%EB%B3%B5&sca_esv=591053097&rlz=1C1CHBD_koKR1050KR1050&tbm=isch&source=lnms&sa=X&ved=2ahUKEwjG5cfuwJCDAxX9pVYBHTFdACEQ_AUoAXoECAIQAw&biw=1536&bih=695&dpr=1.25"
							class="review_ul">교복</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>