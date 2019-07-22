<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/resources/css/style.comment.css"></script> --%>

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
						<input type="hidden" name="b_id" value="${boardVO.b_id}" />
					</form>
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name="b_title" class="form-control" value="${boardVO.b_title}"
								readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> <input type="text"
								name="member_id" class="form-control"
								value="${boardVO.member_id}" readonly="readonly" />
						</div>
						<div class="form-group">
								<label for="exampleInputFile">첨부파일</label>
								<textarea name="b_content" class="form-control" rows="3"
								readonly="readonly">파일이름</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Contents</label>
							<textarea name="b_content" class="form-control" rows="3"
								readonly="readonly">${boardVO.b_content}</textarea>
						</div>
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-warning">Modify</button>
						<button type="submit" class="btn btn-danger">Remove</button>
						<button type="submit" class="btn btn-primary">LIST ALL</button>
					</div>
					<form role="form" action="modifyPage" method="post">
						<input type="hidden" name="b_id" value="${boardVO.b_id}" /> <input
							type="hidden" name="page" value="${cri.page}" /> <input
							type="hidden" name="perPageNum" value="${cri.perPageNum}" />
					</form>
					<form id="commentForm" name="commentForm" method="post">
						<br>
						<br>
						<div>
							<div>
								<span><strong>Comments</strong></span> <span id="cCnt"></span>
							</div>
							<div>
								<table class="table">
									<tr>
										<td style="width: 90%"><textarea style="width: 100%" rows="3" cols="30"
												id="br_content" name="br_content" placeholder="댓글을 입력하세요"></textarea></td>
											<td style="width: 10%"><a href='#' onClick="fn_comment('${boardVO.b_id }')"
													class="btn pull-right btn-success" style="width:100%;  height: 100%; margin-top: 10px">등록</a>
											</td>
									</tr>
								</table>
							</div>
						</div>
						<input type="hidden" id="b_id" name="b_id" value="${boardVO.b_id }" />
					</form>
				</div>
					<form id="commentListForm" name="commentListForm" method="post">
						<div id="commentList"></div>
					</form>
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
    
    getCommentList();
    
});


function fn_comment(code) {
	
	$.ajax({
		 type:'POST',
	        url : "<c:url value='/board/addComment'/>",
	        data:$("#commentForm").serialize(),
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#br_content").val("");
	            }
	        },
	        error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	});
} 

function fn_replyBox(code){
// 	event.preventdefault();
	if($("#clickreplydiv"+code).css("display") == "none")
    $("#clickreplydiv"+code).css("display","block");
	else{
		$("#clickreplydiv"+code).css("display","none");
	}
}

function fn_comments(code,br_ref,br_step,br_depth) {
	/* var form = $("#editForm")[0];
	var formData = new FormData(form); */
	
	var content = $("#br_content2").val();
	alert(content);
	$.ajax({
		 type:'POST',
	        url : "<c:url value='/board/addComments'/>",
	        data: {b_id:code , br_ref:br_ref,br_step:br_step, br_depth:br_depth, br_content:content},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            if(data=="success")
	            {
	                getCommentList();
	                $("#br_content2").val("");
	            }
	        },
	        error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	});
}

function getCommentList() {
	
	$.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            if(data.length > 0){
                for(i=0; i<data.length; i++){
                   
                    html += "<div style='border-bottom:1px solid #EAC3C3'>";	
//                 	html += "<td width='100%' valign='top'>";
                    html += "<table width='100%' height='28' cellpadding='0' cellspacing='0'><tbody><tr><td style='width:5px'>";
                    if (data[i].br_depth > 0) {
                     	for (var j = 0; j <= data[i].br_depth; j++) {
                      		html += "<span>&nbsp&nbsp&nbsp&nbsp</span>";
                      		if(j==data[i].br_depth)
                      		html += "<img src='${pageContext.request.contextPath}/resources/images/reply_icon.png' border='0' align='absmiddle' title='코멘트리플'></td>";
      					}
      				}
                    html += "<td style='border-bottom:0.5px dotted #EAC3C3'>";
                    html += "<span class='mw_basic_comment_name'>&nbsp&nbsp<font color='777777'>"+data[i].writer+"</span>&nbsp&nbsp</a></font></span>";
                    html += "<span class='mw_basic_comment_datetime'>"+data[i].regdate+"</span></td></tr></tbody></table>";
                    html += "<table width='100%' cellpadding='0' cellspacing='0' class='mw_basic_comment_content'>";
                    html += "<tbody><tr><td valign='top'><div id='view_1806950'>&nbsp&nbsp"+data[i].comment+"</div></td></tr></tbody></table>";
                    html += "<div style='text-align:right; padding-right:10px;'><span class='mw_basic_comment_reply'><a href='#' onClick='fn_replyBox("+data[i].c_code+"); return false;' style='color:black;' >답글달기</a></span></div>";

                    html += "<table><tr style='display:none' id='clickreplydiv"+data[i].c_code+"'>";
                    html += "<div><td style='width: 90%'>";
                    html += "<textarea style='width: 100%' rows='3' cols='30' id='br_content2' name='br_content2' placeholder='댓글을 입력하세요'></textarea></td>";
				 	html += "<td style='width: 10%'><a href='#' onClick='fn_comments("+${boardVO.b_id}+','+data[i].br_ref+','+data[i].br_step+','+data[i].br_depth+ ")';' class='btn pull-right btn-success' style='width:100%;  height: 100%; margin-top: 10px'>등록</a></td>";
					html += "</div></tr>";
                    html += "</table>";
                }
                
            } else {
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
	
}


</script>

<jsp:include page="../layout/footer.jsp" />