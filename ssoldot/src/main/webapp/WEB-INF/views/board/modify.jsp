<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<jsp:include page="../layout/header.jsp" />

<div class="container">
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
								<label for="exampleInputFile">첨부파일</label>
								<input type="text" id="profileImg" value="${ notice.filesrc }" name="oFileSrc" class="form-control" style="width:60%"/>
								<input type="file" id="file_input" name="file" style="width:40%"/> 
							</div>
	                        <div class="form-group">
	                            <label for="exampleInputPassword1">Contents</label>
	                            <textarea name="b_content" class="form-control" rows="3">${boardVO.b_content}</textarea>
	                        </div>
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
</div>
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
        
        $("#profileImg").click(function(){
    		$("#input_img").click() ;
    		})			
    	})
    	
    	 $("#input_img").on("change", fileChange);
    });
</script>

<script>
var sel_file;

function fileChange(e) {
	e.preventDefault();

	var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#profileImg").attr("src", e.target.result);
        	$("#profileImg").css("height", "100px")
        }
        reader.readAsDataURL(f);
    });

    var file = files[0]
    console.log(file)
    var formData = new FormData();

    formData.append("file", file);

		$.ajax({
    	url: '/b_uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){

			alert("프로필 이미지가 변경 되었습니다.")

		  }
		})


 		function checkImageType(fileName){
 			var pattern = /jpg$|gif$|png$|jpeg$/i;
 			return fileName.match(pattern);
 		}


 		function getOriginalName(fileName){
 			if(checkImageType(fileName)){
 				return;
 			}

 			var idx = fileName.indexOf("_") + 1 ;
 			return fileName.substr(idx);

 		}


 		function getImageLink(fileName){

 			if(!checkImageType(fileName)){
 				return;
 			}
 			var front = fileName.substr(0,12);
 			var end = fileName.substr(14);

 			return front + end;

 		}

}
</script>

<jsp:include page="../layout/footer.jsp" />