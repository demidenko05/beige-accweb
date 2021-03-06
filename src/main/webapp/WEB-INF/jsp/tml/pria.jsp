<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" type="text/css" href="../css/bsPrn.css" />
  <link rel="icon" type="image/png" href="../img/favicon.png">
  <title>${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}, <fmt:formatDate value="${now}" type="both" timeStyle="short"/></title>
</head>
<body>
  <div class="entity-title">${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}, <fmt:formatDate value="${now}" type="both" timeStyle="short"/></div>
  <div class="entity">
    <c:forEach var="fn" items="${hldUvd.lazFrmFds(cls)}">
      <c:set var="fdNm" value="${fn}" scope="request"/>
      <c:if test="${not empty hldUvd.stg(cls,fn,'inWr')}">
        <c:set var="mdl" value="${ent[fn]}" scope="request"/>
        ${i18n.getMsg(fn, rvs.upf.lng.iid)}:
        <jsp:include page="../st/${hldUvd.stgNn(cls,fn,'str')}.jsp"/><br>
      </c:if>
    </c:forEach>
    <br>
    <jsp:include page="penr.jsp"/><br>
  </div>
</body>
</html>
