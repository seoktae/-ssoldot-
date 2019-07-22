<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<style>
.active{
	background-color: blue;
}
</style>

<jsp:include page="../layout/header.jsp" />

	<!-- Main contents -->
<div class="container">
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
	
				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title" style="text-align: center">자유게시판</h3>
					</div>
					<div class="box-body">
						<!-- 208 page -->
	                    <table class="table table-bordered">
	                        <tr>
	                            <th style="width: 10px">BNO</th>
	                            <th>TITLE</th>
	                            <th>WRITER</th>
	                            <th>REGDATE</th>
	                            <th style="width: 40px">VIEWCNT</th>
	                        </tr>
	                        <!-- 214 page -->
	                        <c:forEach items="${list}" var="boardVO">
		                        <tr>
		                            <td>${boardVO.b_id}</td>
		                            <td><a href='${pageContext.request.contextPath}/board/read?b_id=${boardVO.b_id}&member_id=${boardVO.member_id}' style='color:black;'>${boardVO.b_title}</a></td>
		                            <td>${boardVO.member_id}</td>
		                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.b_regdate}" /></td>
		                            <td><span class="badge bg-red">${boardVO.b_cnt }</span></td>
		                        </tr>
		                    </c:forEach>
	                    </table>
	                    <button type="submit" class="btn btn-primary" style="margin-left: 87%" >글쓰기</button>
					</div>
					<!-- /.box-body -->
					<div  class="box-footer" >
	                     <ul class="pagination" style="justify-content:center;">
	                            <c:if test="${pageMaker.prev}">
	                                <li class="page-item"><a class="page-link" href="listAll${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a> </li>
	                            </c:if>
	                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	                                <li class="page-item" <c:out value="${pageMaker.cri.page == idx? 'class = active':''}"/>>
	                                    <a class="page-link" href="listAll${pageMaker.makeQuery(idx)}">${idx}</a>
	                                </li>
	                            </c:forEach>
		                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		                            <li class="page-item"><a class="page-link" href="listAll${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a> </li>
		                        </c:if>
	                        </ul>
	                </div>
					<!-- /.box-footer-->
					</div>
				</div>
			<!--/.col (left) -->
			</div>
		<!-- /.row -->
	</section>
	<!-- /.contents -->
</div>
	
<form id="jobForm">
    <input type='hidden' name="page" value="${pageMaker.cri.page}">
    <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}">
</form>

<!-- /.contents-wrapper -->
<script>
	var result = '${msg}';
	if(result === 'success'){
		alert("처리가 완료되었습니다.");
	}
	var page = ${pageMaker.cri.page};
	$('ui').find('li').each(function (i,e) {
		console.log($(this).text());
	})
</script>
<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        console.log(formObj);
        $(".btn-primary").on("click", function () {
           self.location = "/ssoldot/board/register"
        });
    });
</script>
<jsp:include page="../layout/footer.jsp" />