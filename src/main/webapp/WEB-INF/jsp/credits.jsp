<!doctype html>

<html lang="en">
<head>
  <jsp:include page="/WEB-INF/jsp/lib/head.jsp"/>
  <link rel="stylesheet" href="/css/credits.css">
</head>

<body>

<jsp:include page="/WEB-INF/jsp/lib/navbar.jsp"/>

<div class=container>
    <h1>Credits</h1>
    <ul>
        <li>
            <span>
                <img id="favicon-example" class="center-vert"
                    src="https://storage.cloud.google.com/jalexander-website-bucket/MeE_cropped_small.png">
                <span>
                    Favicon by Zoya Chakourski
                </span>
            <span>
        </li>
        <li>
            <span>
                Deployment based on the
                <a href=https://cloud.google.com/java/docs/tutorials/getting-started-on-compute-engine>
                    Java on Compute Engine tutorial
                </a>
            </span>
        </li>
    </ul>
</div>

<jsp:include page="/WEB-INF/jsp/lib/foot.jsp"/>
</body>
</html>
