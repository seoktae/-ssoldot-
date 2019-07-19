<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<jsp:include page="../layout/header.jsp" />

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
	                    <div class="box-body">
	                    	<div class="form-group">
	                    		<label for="exampleInputEmail1">BNO</label>
	                    		<input type="text" name='b_id' class="form-control" value="${boardVO.b_id}" readonly="readonly">
	                    	</div>
	                        <div class="form-group">
	                            <label for="exampleInputEmail1">Title</label>
	                            <input type="text" name="b_title" class="form-control" value="${boardVO.b_title}" />
	                        </div>
	                        <div class="form-group">
	                            <label for="exampleInputPassword1">Contents</label>
	                            <textarea name="b_content" class="form-control" rows="3">${boardVO.b_content}</textarea>
	                        </div>
	                        <%-- <div class="form-group">
	                            <label for="exampleInputEmail1">Writer</label>
	                            <input type="text" name="writer" class="form-control" value="${boardVO.member_id}" readonly="readonly" />
	                        </div> --%>
	                    </div>
	                </form>
	                <div class="box-footer">
	                    <button type="submit" class="btn btn-primary">SAVE</button>
	                    <button type="submit" class="btn btn-warning">CANCEL</button>
	                </div>
	            </div>
	            <!-- /.box -->
	        </div>
	        <!--/.col (left) -->
	
	    </div>
	    <!-- /.row -->
	</section>
	<!-- /.contents -->

<!-- /.contents-wrapper -->

<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        $(".btn-warning").on("click", function () {
           self.location = "/ssoldot/board/listAll"
        });
        $(".btn-primary").on("click", function () {
            formObj.submit();
        });
    });
</script>

<jsp:include page="../layout/footer.jsp" />