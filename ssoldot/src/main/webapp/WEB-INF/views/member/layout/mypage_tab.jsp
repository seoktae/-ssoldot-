<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
					<div id="kakaoLnb" class="aside_menu" role="navigation">
						<h3 class="screen_out">계정관리 메뉴</h3>
							<strong class="tit_menu on">
							<span class="ico_member ico_account">
							</span>내 계정</strong>
							<ul class="list_menu">
								<li><a class="link_menu on active" href="${pageContext.request.contextPath}/member/mypage">기본 정보</a></li>
								<li><a class="link_menu" href="/member/account/profileLayer">내가 쓴 글</a></li>
							</ul>
						
						<div>
							<strong class="tit_menu">
							<span class="ico_member ico_security">
								</span>보안</strong>
							<ul class="list_menu">
								<li><a class="link_menu" href="/member/security/accessLog">로그인
										기록</a></li>
								<li><a class="link_menu" href="${pageContext.request.contextPath}/member/modify">비밀번호
										재설정</a></li>
								<li><a class="link_menu" href="${pageContext.request.contextPath}/member/delete">회원탈퇴
									</a></li>
							</ul>
							</ul>
						</div>
						</div>
					