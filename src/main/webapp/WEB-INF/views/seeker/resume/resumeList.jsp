<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/list.css" type="text/css"/>
    <title>Job Start Up/이력서 목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<header>
    <%@ include file="../../layout/layoutNav.jsp" %>
    <div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
        </div>
    </div>
</header>
<main>
    <div class="resume_wrap">
        <h3 class="resume_title">이력서 관리</h3>
        <div class="writeDiv">
            <a href="${cPath }/seeker/resumeWrite"><button class="writeBtn" type="button">이력서 작성하기</button></a>
        </div>
        <c:if test="${empty resumeList }">
            <div class="resume_list_wrap">
                <ul class="resume_list">
                    <li class="resume_item">
                        지금 이력서를 작성해보세요 !
                    </li>
                </ul>
            </div>
        </c:if>

        <c:if test="${not empty resumeList }">
            <c:forEach items="${resumeList}" var="resume">
                <div class="resume_list_wrap">
                    <ul class="resume_list">
                        <li class="resume_item">
                            <span><a href="${cPath}/seeker/resumeDetail/${resume.resume_no}">${resume.resume_title}</a></span>
                            <span><a href="${cPath }/seeker/resumeModify/${resume.resume_no}"><button class="modifyBtn" type="button">수정</button></a></span>
                        </li>
                    </ul>
                </div>
            </c:forEach>
        </c:if>
    </div>
</main>
    <%@ include file="../../layout/layoutFooter.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
