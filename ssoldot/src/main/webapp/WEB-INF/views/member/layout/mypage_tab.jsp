<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <div class="aside_profile">
    
    
						<h3 class="screen_out">프로필</h3>
						<div class="wrap_thumb">
							<a href="${pageContext.request.contextPath}/member/mypage/info" >
							<img src="${pageContext.request.contextPath}/resources/member/profile_pic/${vo.st_picname}" width="100" height="100" class="thumb_img" alt="">
							</a>
						</div>
						<div class="wrap_cont">
							<a><br></a>
							<strong class="tit_profile">${vo.member_id}</strong>
							<span class="txt_ellip">${vo.nickname}</span>
						</div>
					</div>
					<div id="kakaoLnb" class="aside_menu" role="navigation">
						<h3 class="screen_out">계정관리 메뉴</h3>
							<strong class="tit_menu on">
							<span class="ico_member ico_account">
							</span>내 계정</strong>
							<ul class="list_menu">
								<li><a class="link_menu on active" href="${pageContext.request.contextPath}/member/mypage/mypage">기본 정보</a></li>
								<li><a class="link_menu" href="/member/account/profileLayer">내가 쓴 글</a></li>
							</ul>
						
						<div>
							<strong class="tit_menu">
							<span class="ico_member ico_security">
								</span>보안</strong>
							<ul class="list_menu">
								<li><a class="link_menu" href="/member/security/accessLog">로그인
										기록</a></li>
								<li><a class="link_menu" href="${pageContext.request.contextPath}/member/mypage/modify">비밀번호
										재설정</a></li>
								<li><a class="link_menu" href="${pageContext.request.contextPath}/member/mypage/delete">회원탈퇴
									</a></li>
							</ul>
							</ul>
						</div>
						</div>
					