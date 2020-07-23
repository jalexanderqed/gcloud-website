<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  request.setAttribute("servletPath", request.getServletPath());
%>

<ul class="nav justify-content-center ja-navbar">
    <li class="nav-item left-item">
        <a
            <c:choose>
                <c:when test="${servletPath == ''}">class="nav-link active"</c:when>
                <c:otherwise>class="nav-link"</c:otherwise>
            </c:choose>
            href="/">
            Home
        </a>
   </li>
   <li class="nav-item right-item">
        <a
            <c:choose>
                <c:when test="${servletPath == '/credits'}">class="nav-link active"</c:when>
                <c:otherwise>class="nav-link"</c:otherwise>
            </c:choose>
            href="/credits">
            Credits
        </a>
    </li>
</ul>
<br/>
