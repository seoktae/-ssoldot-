<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="../layout/header.jsp" />
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        console.log(formObj);
        $(".btn-warning").on("click", function () {
           formObj.attr("action", "/ssoldot/board/modify");
           formObj.attr("method", "get");
           formObj.submit();
        });
        $(".btn-danger").on("click", function () {
           formObj.attr("action", "/ssoldot/board/remove");
           formObj.submit();
        });
        $(".btn-primary").on("click", function () {
            self.location = "/ssoldot/board/listAll";
        });
        $(".goListBtn").on("click", function () {
        	formObj.attr("method", "get");
        	formObj.attr("action", "/board/listPage");
        	formObj.submit();
        });
        $(".removeBtn").on("click", function () {
        	formObj.attr("action", "/board/removePage");
        	formObj.submit();
        });
        $(".modifyBtn").on("click", function () {
        	formObj.attr("action", "/board/modifyPage");
        	formObj.attr("method", "get");
        	formObj.submit();
        });
    });
</script>

	<!-- Main contents -->
	<section class="contents">
	    <div class="row">	
	        <!-- left column -->
	        <div class="col-md-12">
	            <!-- general form elements -->
	            <div class="box box-primary">
	                <div class="box-header">
	                    <h3 class="box-title">REGISTER BOARD</h3>
	                </div>
	                <!-- /.box-header -->
	
	                <form role="form" method="post">
	                    <input type="hidden" name="b_id" value="${boardVO.b_id}" />
	                </form>
	                <div class="box-body">
	                    <div class="form-group">
	                        <label for="exampleInputEmail1">Title</label>
	                        <input type="text" name="b_title" class="form-control" value="${boardVO.b_title}" readonly="readonly" />
	                    </div>
	                    <div class="form-group">
	                        <label for="exampleInputPassword1">Contents</label>
	                        <textarea name="b_content" class="form-control" rows="3" readonly="readonly">${boardVO.b_content}</textarea>
	                    </div>
	                    <div class="form-group">
	                        <label for="exampleInputEmail1">Writer</label>
	                        <input type="text" name="member_id" class="form-control" value="${boardVO.member_id}" readonly="readonly" />
	                    </div>
	                </div>
	                <div class="box-footer">
	                    <button type="submit" class="btn btn-warning">Modify</button>
	                    <button type="submit" class="btn btn-danger">Remove</button>
	                    <button type="submit" class="btn btn-primary">LIST ALL</button>
	                </div>
	                <form role="form" action="modifyPage" method="post">
	                    <input type="hidden" name="b_id" 		value="${boardVO.b_id}" />
	                    <input type="hidden" name="page" 		value="${cri.page}" />
	                    <input type="hidden" name="perPageNum" 	value="${cri.perPageNum}" />
                	</form>
	            </div>
	            <!-- /.box -->
	        </div>
	        <!--/.col (left) -->
	    </div>
	    <!-- /.row -->
	</section>
	<!-- /.contents -->
	
<!-- /.contents-wrapper -->

<jsp:include page="../layout/footer.jsp" />