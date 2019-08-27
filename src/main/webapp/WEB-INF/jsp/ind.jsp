<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
  if (request.getParameter("logoff") != null) {
    request.getSession().invalidate();
  }
%>

<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="css/bsCmn.css" />
  <link rel="icon" type="image/png"  href="img/favicon.png">
  <title>${i18n.getMsg("app_name", rvs.upf.lng.iid)}</title>
</head>
<body>
  <div class="navbar">
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("Appearance", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="sec/srv">${i18n.getMsg("Desktop", rvs.upf.lng.iid)}</a>
        <a href="sec/srv?rnd=mbl&mbl=mbl">${i18n.getMsg("Mobile", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">...</a>
      <div class="dropdown-content">
        <a href="adm/srv">${i18n.getMsg("Admin", rvs.upf.lng.iid)}</a>
        <a href="adm/srv?rnd=asel">${i18n.getMsg("WebStoreSE", rvs.upf.lng.iid)}</a>
        <a href="sel/srv">${i18n.getMsg("SeSel", rvs.upf.lng.iid)}</a>
        <a href="adm/ntr?rnd=dbc">${i18n.getMsg("ImportDatabase", rvs.upf.lng.iid)}</a>
        <c:if test="${pageContext.servletContext.getInitParameter('ormDir') eq 'sqlite'}">
          <a href="adm/ntr?prc=PrcMngDb">${i18n.getMsg("Databases", rvs.upf.lng.iid)}</a>
        </c:if>
        <a href="adm/ntr?prc=MngSft">${i18n.getMsg("SoftwareManagement", rvs.upf.lng.iid)}</a>
        <a href="?prc=WsPg" target="_blank">${i18n.getMsg("WebStore", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="nav-right">
      <a href="https://sites.google.com/site/beigesoftware" target="_blank"></a>
    </div>
  </div>  
</body>
</html>
