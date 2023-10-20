<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/jobposting/JPwriteForm.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/ckeditor5-2/sample/styles.css">--%>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout/layout.css">--%>
    <script src="${contextPath}/ckeditor5-2/build/ckeditor.js"></script>
    <%--<script src="https://cdn.ckeditor.com/ckeditor5/39.0.2/classic/ckeditor.js"></script>--%>

    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">
    <title>Title</title>
</head>
<body>
<header>
    <nav class="layout_nav">
        <%@ include file="../../layout/layoutNav.jsp" %>
    </nav>
</header>
<main>
    <article class="all-content">
        <form action="${pageContext.request.contextPath}/recruiter/JPmodify" method="post" enctype="multipart/form-data">
            <input type="hidden" id="posting_no" name="posting_no" value="${jobPostingDTO.posting_no}"/>
            <section>
                <div>
                    <h3>모집분야</h3>
                </div>
                <div>
                    <label for="posting_title" class="">공고 제목</label>
                    <input type="text" name="posting_title" id="posting_title" class=""
                           value="${jobPostingDTO.posting_title}">
                </div>
                <div>
                    <label for="c1" class="">직무·직업</label>
                    <input type="checkbox" name="posting_career" id="c1"
                           value="신입" ${jobPostingDTO.posting_career == '신입' ? 'checked' : ''}/><label
                        for="c1">신입</label>
                    <input type="checkbox" name="posting_career" id="c2"
                           value="경력" ${jobPostingDTO.posting_career == '경력' ? 'checked' : ''}/><label
                        for="c2">경력</label>
                    <input type="checkbox" name="posting_career" id="c3"
                           value="경력무관" ${jobPostingDTO.posting_career == '경력무관' ? 'checked' : ''}/><label
                        for="c3">경력무관</label>
                    <input type="checkbox" name="posting_career" id="c4"
                           value="신입 지원 가능" ${jobPostingDTO.posting_career == '신입 지원 가능' ? 'checked' : ''}/><label
                        for="c4">신입 지원
                    가능</label>
                </div>
                <div>
                    <h3>지원자격</h3>
                </div>
                <div>
                    <span>지원학력</span>
                    <select name="posting_academy" id="posting_academy">
                        <option value="" selected disabled>--학력선택--</option>
                        <option value="학력무관">학력무관</option>
                        <option value="고등학교졸업 이상">고등학교졸업 이상</option>
                        <option value="대학졸업(2,3년) 이상">대학졸업(2,3년) 이상</option>
                        <option value="대학교졸업(4년) 이상">대학교졸업(4년) 이상</option>
                        <option value="석사졸업 이상">석사졸업 이상</option>
                        <option value="박사졸업 이상">박사졸업 이상</option>
                        <option value="기타">기타</option>
                    </select>
                </div>

                <div>
                    <label for="w1" class="">근무형태</label>
                    <input type="checkbox" name="posting_labor" id="w1"
                           value="정규직" ${jobPostingDTO.posting_career == '정규직' ? 'checked' : ''}/><label
                        for="w1">정규직</label>
                    <input type="checkbox" name="posting_labor" id="w2"
                           value="계약직" ${jobPostingDTO.posting_career == '계약직' ? 'checked' : ''}/><label
                        for="w2">계약직</label>
                    <input type="checkbox" name="posting_labor" id="w3"
                           value="인턴직" ${jobPostingDTO.posting_career == '인턴직' ? 'checked' : ''}/><label
                        for="w3">인턴직</label>
                    <input type="checkbox" name="posting_labor" id="w4"
                           value="아르바이트" ${jobPostingDTO.posting_career == '아르바이트' ? 'checked' : ''}/><label for="w4">아르바이트</label>
                    <input type="checkbox" name="posting_labor" id="w5"
                           value="파견직" ${jobPostingDTO.posting_career == '파견직' ? 'checked' : ''}/><label
                        for="w5">파견직</label>
                    <input type="checkbox" name="posting_labor" id="w6"
                           value="해외취업" ${jobPostingDTO.posting_career == '해외취업' ? 'checked' : ''}/><label
                        for="w6">해외취업</label>
                    <input type="checkbox" name="posting_labor" id="w7"
                           value="계약직 (정규직 전환가능)" ${jobPostingDTO.posting_career == '계약직 (정규직 전환가능)' ? 'checked' : ''}/><label
                        for="w7">계약직 (정규직
                    전환가능)</label>
                    <input type="checkbox" name="posting_labor" id="w8"
                           value="인턴직 (정규직 전환가능)" ${jobPostingDTO.posting_career == '인턴직 (정규직 전환가능)' ? 'checked' : ''}/><label
                        for="w8"> 인턴직
                    (정규직 전환가능)</label>
                    <input type="checkbox" name="posting_labor" id="w9"
                           value="교육생" ${jobPostingDTO.posting_career == '교육생' ? 'checked' : ''}/><label
                        for="w9">교육생</label>
                    <input type="checkbox" name="posting_labor" id="w10"
                           value="기간제" ${jobPostingDTO.posting_career == '기간제' ? 'checked' : ''}/><label
                        for="w10">기간제</label>
                </div>
            </section>
            <section>
                <div>
                    <span>급여</span>
                    <select name="posting_salary" id="posting_salary">
                        <option value="" selected disabled>--급여선택--</option>
                        <option value="회사내규에 따름">회사내규에 따름</option>
                        <option value="면접후 결정">면접후 결정</option>
                        <option value="2,000만원 이상">2,000만원 이상</option>
                        <option value="2,200만원 이상">2,200만원 이상</option>
                        <option value="2,400만원 이상">2,400만원 이상</option>
                        <option value="2,600만원 이상">2,600만원 이상</option>
                        <option value="2,800만원 이상">2,800만원 이상</option>
                        <option value="3,000만원 이상">3,000만원 이상</option>
                        <option value="3,200만원 이상">3,200만원 이상</option>
                        <option value="3,400만원 이상">3,400만원 이상</option>
                        <option value="3,600만원 이상">3,600만원 이상</option>
                        <option value="3,800만원 이상">3,800만원 이상</option>
                        <option value="4,000만원 이상">4,000만원 이상</option>
                        <option value="5,000만원 이상">5,000만원 이상</option>
                        <option value="6,000만원 이상">6,000만원 이상</option>
                        <option value="7,000만원 이상">7,000만원 이상</option>
                        <option value="8,000~9,000만원">8,000~9,000만원</option>
                        <option value="9,000~1억원">9,000~1억원</option>
                        <option value="1억원 이상">1억원 이상</option>
                    </select>
                </div>
                <div>
                    <span>근무일시</span>
                    <input type="radio" name="posting_working_day" value="주 5일(월~금)">주 5일(월~금)
                    <input type="radio" name="posting_working_day" value="주 6일(월~토)">주 6일(월~토)
                    <input type="radio" name="posting_working_day" value="주 3일(격일제)">주 3일(격일제)
                    <input type="radio" name="posting_working_day" value="유연근무제">유연근무제
                    <input type="radio" name="posting_working_day" value="면접 후 결정">면접 후 결정
                </div>
                <div>
                    <span>출근시간</span>
                    <select id="posting_swork" name="posting_swork">
                        <option value="" selected disabled>--선택--</option>
                        <option value="08:00">08:00</option>
                        <option value="08:30">08:30</option>
                        <option value="09:00">09:00</option>
                        <option value="09:30">09:30</option>
                        <option value="10:00">10:00</option>
                    </select>
                </div>
                <div>
                    <span>퇴근시간</span>
                    <select id="posting_ework" name="posting_ework">
                        <option value="" selected disabled>--선택--</option>
                        <option value="17:00">17:00</option>
                        <option value="17:30">17:30</option>
                        <option value="18:00">18:00</option>
                        <option value="18:30">18:30</option>
                        <option value="19:00">19:00</option>
                    </select>

                </div>
                <div>
                    <span>근무지역</span>
                    <select id="upperLoc" name="upperLoc" onchange="loadLowerLoc()">
                        <option value="">선택</option>
                        <c:forEach items="${upperLoc}" var="upLoc">
                            <option value="${upLoc.detail_code_num}">${upLoc.detail_name}</option>
                        </c:forEach>
                    </select>
                    <select id="lowerLoc" name="lowerLoc">
                        <option value="">선택</option>
                        <c:forEach items="${lowerLoc}" var="loLoc">
                            <option value="${loLoc.detail_code_num}">${loLoc.detail_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <span>시작일</span>
                    <input type="datetime-local" name="posting_sdate" id="posting_sdate"/>
                </div>
                <div>
                    <span>마감일</span>
                    <input type="datetime-local" name="posting_edate" id="posting_edate"/>
                </div>
            </section>
            <section>
                <textarea class="editor" name="posting_content" id="editor"></textarea>
            </section>
            <section>
<%--                <div>
                    <label for="imageFileName" class="form-label">이미지</label>
                    <input type="file" name="imageFileName" id="imageFileName" class="form-control-file"
                           onchange="readURL(this);"/>
                    <img src="#" id="preview" style="width:150px;"/>
                </div>--%>
            </section>

            <div>
                <button type="submit" id="subBtn">입력</button>
            </div>
        </form>
    </article>
</main>
<footer>
    footer
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>

<script>
    const watchdog = new CKSource.EditorWatchdog();

    window.watchdog = watchdog;

    watchdog.setCreator((element, config) => {
        return CKSource.Editor
            .create(element, config)
            .then(editor => {
                return editor;
            });
    });

    watchdog.setDestructor(editor => {
        return editor.destroy();
    });

    watchdog.on('error', handleSampleError);

    watchdog
        .create(document.querySelector('.editor'), {
            // Editor configuration.
        })
        .catch(handleSampleError);

    function handleSampleError(error) {
        const issueUrl = 'https://github.com/ckeditor/ckeditor5/issues';

        const message = [
            'Oops, something went wrong!',
            `Please, report the following error on ${ issueUrl } with the build id "jdvxf7v1zcxg-ysu3jnu712sw" and the error stack trace:`
        ].join('\n');

        console.error(message);
        console.error(error);
    }


    document.addEventListener("DOMContentLoaded", function () {
        const sdateElem = document.getElementById('posting_sdate');
        const edateElem = document.getElementById('posting_edate');

        const today = new Date();
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const dd = String(today.getDate()).padStart(2, '0');

        const formattedDate = yyyy + '-' + mm + '-' + dd + 'T' + '00:00:00';

        sdateElem.setAttribute('min', formattedDate);
        sdateElem.setAttribute('value', formattedDate);

        edateElem.setAttribute('min', formattedDate);
        edateElem.setAttribute('value', formattedDate);

        sdateElem.addEventListener("change", function () {
            const sdate = this.value;
            edateElem.setAttribute('min', sdate);
            edateElem.setAttribute('value', sdate);
        });
    });
</script>
<script>
    <%-- 상위 지역에 따른 하위 지역 목록 불러오기 --%>

    function loadLowerLoc() {
        var upperLocValue = document.getElementById("upperLoc").value;

        fetch('/recruiter/getJPLowerLoc?upperLoc=' + upperLocValue)
            .then(response => response.json())
            .then(data => {
                var lowerLocSelect = document.getElementById("lowerLoc");
                lowerLocSelect.innerHTML = "";

                data.forEach(loLoc => {
                    var option = document.createElement("option");
                    option.value = loLoc.detail_code_num;
                    option.text = loLoc.detail_name;
                    lowerLocSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error:', error));
    }
</script>
<script>
     $(document).ready(function() {
        var posting_academy = ${posting_academy}; // 데이터베이스에서 가져온 posting_academy 값
        var posting_salary = ${posting_salary}; // 데이터베이스에서 가져온 posting_salary 값
        var posting_swork = ${posting_swork}; // 데이터베이스에서 가져온 posting_swork 값
        var posting_ework = ${posting_ework}; // 데이터베이스에서 가져온 posting_ework 값
        var posting_career = ${posting_career}; // 데이터베이스에서 가져온 posting_career 값
        var posting_labor = ${posting_labor}; // 데이터베이스에서 가져온 posting_labor 값
        var posting_working_day = ${posting_working_day}; // 데이터베이스에서 가져온 posting_working_day 값

        // 이후, 해당 값을 사용하여 폼 필드를 채우는 함수를 호출할 수 있습니다.
        selectOptionByValue('posting_academy', posting_academy);
        selectOptionByValue('posting_salary', posting_salary);
        selectOptionByValue('posting_swork', posting_swork);
        selectOptionByValue('posting_ework', posting_ework);
        selectRadioByValue('posting_career', posting_career);
        selectRadioByValue('posting_labor', posting_labor);
        selectRadioByValue('posting_working_day', posting_working_day);
    });

    function selectRadioByValue(fieldName, checkedValue) {
        var radioElements = document.getElementsByName(fieldName);

        for (var i = 0; i < radioElements.length; i++) {
            if (radioElements[i].value === checkedValue) {
                radioElements[i].checked = true;
                break;
            }
        }
    }

    function selectOptionByValue(selectId, selectedValue) {
        var selectElement = document.getElementById(selectId);

        for (var i = 0; i < selectElement.options.length; i++) {
            if (selectElement.options[i].value === selectedValue) {
                selectElement.selectedIndex = i;
                break;
            }
        }
    }

   /* $(document).ready(function() {
        // 서버에서 데이터 가져오기
        $.ajax({
            url: "/recruiter/modify/{posting_no}",
            type: "GET",
            dataType: "json",
            success: function(data) {
                // 데이터를 받았을 때, 폼 필드를 채우는 함수 호출
                fillFormFields(data);
            },
            error: function() {
                // 에러 처리 로직
            }
        });
    });

    function fillFormFields(data) {
        // 데이터를 이용하여 폼 필드를 채우는 로직을 구현
        $("#posting_swork").val(data.posting_swork);
        $("#posting_ework").val(data.posting_ework);
        $("#posting_academy").val(data.posting_academy);
        $("#posting_salary").val(data.posting_salary);
        $("#posting_career").val(data.posting_career);
        $("#posting_labor").val(data.posting_labor);
        $("#posting_working_day").val(data.posting_working_day);
        // 다른 필드에 대해서도 값 설정
    }*/


</script>

</body>
</html>
