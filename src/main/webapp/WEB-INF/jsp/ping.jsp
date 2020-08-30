<!doctype html>

<html lang="en">
<head>
  <jsp:include page="/WEB-INF/jsp/lib/head.jsp"/>
  <link rel="stylesheet" href="/css/ping.css">
</head>

<body>

<jsp:include page="/WEB-INF/jsp/lib/navbar.jsp"/>

<div class="d-flex justify-content-center">
    <h1 id="current-ping"></h1>
</div>
<div class="d-flex justify-content-center">
    <h3 id="ping-error">&nbsp;</h3>
</div>
<br>
<div class="d-flex justify-content-center">
    <a id="advanced-btn" href="/ping_advanced" class="btn btn-primary btn-lg">Advanced</a>
</div>

<jsp:include page="/WEB-INF/jsp/lib/foot.jsp"/>
<script src="js/ping.js"></script>
</body>
</html>
