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
                <img id="favicon-example" class="center-vert" alt="Drawing of the website author"
                    src="https://storage.cloud.google.com/jalexander-website-bucket/MeE_cropped_small.png">
                <span>
                    Favicon by <a href="https://zochascribe.tumblr.com/">zochascribe.tumblr.com</a>
                </span>
            <span>
        </li>
        <li>
            <span>
                Deployment based on the
                <a href="https://cloud.google.com/java/docs/tutorials/getting-started-on-compute-engine">
                    Java on Compute Engine tutorial
                </a>
            </span>
        </li>
        <li>
            <span>
                The
                <a href="https://github.com/jalexanderqed/gcloud-website">
                    GitHub repo
                </a>
                for this website
            </span>
        </li>
    </ul>
</div>

<jsp:include page="/WEB-INF/jsp/lib/foot.jsp"/>
</body>
</html>
