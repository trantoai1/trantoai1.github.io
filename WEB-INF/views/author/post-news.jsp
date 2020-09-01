<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Post page</title>
	
	<!-- Main Quill library -->
	<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
	<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- Theme included stylesheets -->
	<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
	
	<%-- <link rel="stylesheet" href="<c:url value="/lib/author/css/quill.css" />"> --%>
	<link rel="stylesheet"
		href="<c:url value="/lib/author/css/style.css" />">
	
	<link rel="stylesheet"
		href="<c:url value="/lib/bootstrap/css/bootstrap.min.css" />">
	<script src="<c:url value="/lib/bootstrap/js/bootstrap.min.js" />"></script>
	
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
		integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
		crossorigin="anonymous">
	<style>
      .error{
         color: red;
      }
   </style>
</head>

<body>
	<base href="${ pageContext.servletContext.contextPath }/" />
	<form:form action="author/demoPost" modelAttribute="newPost" method="POST" enctype="multipart/form-data">

		<div class="row">
			<div class="post col-md-9">
				<p class="title">Add New Post</p>
				<div class="post-title">
					<form:input path="title" cssClass="title-content" type="text" placeholder="Enter title here" />
					<form:errors path="title" cssClass="error" />
				</div>
				<!-- <p class="title">Add Description</p> -->
	         <div class="post-description">
	            <form:input path="description" cssClass="description-content" type="text" placeholder="Enter description here" />
	            <form:errors path="description" cssClass="error" />
	         </div>
				<p class="title">Content</p>
				<div class="post-content">
					<div id="toolbar"></div>
					<div id="editor"></div>
					<!-- class="editorC" -->
					<button id="save">Save</button>
					<form:input id="content" type="hidden" path="content" value="" />
					<form:errors path="content" cssClass="error" />
				</div>
			</div>
			<div class="prop-post col-md-3">
				<div class="topic-container">
					<p class="title">Select topic for your post</p>
					<div class="topic-select">
						<form:select cssClass="form-control" path="topicId" items="${ listTopic }" itemLabel="name" itemValue="topicId" />
							<%-- <c:if test="${ not empty listTopic }">
								<c:forEach var="topic" items="${ listTopic }">
									<option class="topic-name" value="${ topic.topicId }">${ topic.name }</option>
								</c:forEach>
							</c:if> --%>
						<%-- </form:select> --%>
					</div>
				</div>
				<div class="image-header">
	            <p class="title">Pick a image</p>
	            <input name="imageHeader" type="file" />
	         </div>
				<div class="tag-container">
					<p class="title">Add tag</p>
					<div class="new-tag">
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="Name your tag here" aria-label="Name your tag here"
								aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" id="button-addon2">Add</button>
							</div>
						</div>
					</div>
					<%-- <div class="tag-select">
                 <c:if test="${ not empty listTag }">
                 	<c:forEach var="tag" items="${ listTag }">
                 		<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
							  <label class="form-check-label" for="defaultCheck1">
							    <c:out value="${ tag.name }" />
							  </label>
							</div>
                 	</c:forEach>
                 </c:if>
            </div> --%>
					<section class="section-preview">
						<div class="chips chips-placeholder" tabindex="0">
							<!-- <div class="chip">
								00001
								<i class="close fas fa-times"></i>
							</div> -->
						</div>
						<input type="hidden" name="tags" id="tags" />
					</section>
				</div>
			</div>
		</div>

	</form:form>

	<!-- <div id="justHtml"></div> -->

	<script src="<c:url value="/lib/author/js/quill.js" /> "></script>
	<script src="<c:url value="/lib/author/js/script.js" /> "></script>
</body>

</html>