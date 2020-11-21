<!doctype html>

<html lang="en">
<head>
  <jsp:include page="/WEB-INF/jsp/lib/head.jsp"/>
  <link rel="stylesheet" href="/css/ping_advanced.css">

<!-- Load c3.css -->
<link rel="stylesheet" href="/css/c3/c3.css">

<!-- Load d3.js and c3.js -->
<script src="/js/d3/d3.min.js" charset="utf-8"></script>
<script src="/js/c3/c3.min.js"></script>
</head>

<body>

<jsp:include page="/WEB-INF/jsp/lib/navbar.jsp"/>

<div class="d-flex justify-content-center">
    <h2 style="color: red;">This ping monitor does not work!</h2>
</div>
<div class="d-flex justify-content-center">
    <h4 style="color: red;">don't worry, your ping isn't nearly this bad</h4>
</div>

<div id="ping-chart"></div>
<br>
<br>
<div class="d-flex justify-content-center">
    <h3 id="ping-rate"></h3>
</div>

<jsp:include page="/WEB-INF/jsp/lib/foot.jsp"/>
<script src="js/ping_advanced.js"></script>
</body>
</html>
