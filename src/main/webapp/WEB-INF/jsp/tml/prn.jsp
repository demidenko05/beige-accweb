<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
<c:set var="ent" value="${rvs.uvs.ent}" scope="request"/>
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
    <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
      <c:set var="fdNm" value="${fn}" scope="request"/>
      <c:set var="mdl" value="${ent[fn]}" scope="request"/>
      ${i18n.getMsg(fn, rvs.upf.lng.iid)}:
      <jsp:include page="../st/${hldUvd.stg(cls,fn,'str')}.jsp"/><br>
    </c:forEach>
    <br>
    <c:if test="${rvs.uvs.owdEntsMp != null && rvs.uvs.owdEntsMp.size() gt 0}">
      <c:forEach var="olme" items="${rvs.uvs.owdEntsMp}">
        <c:set var="cls" value="${olme.key}" scope="request"/>
        <c:set var="nameEnts" value="${cls.simpleName}s"/>
        <div class="title-list">${i18n.getMsg(nameEnts, rvs.upf.lng.iid)}</div>
        <table>
          <tr>
            <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
              <th>${i18n.getMsg(fn, rvs.upf.lng.iid)}</th>
            </c:forEach>
          </tr>
          <c:forEach var="entt" items="${olme.value}">
            <c:set var="ent" value="${entt}" scope="request"/>
            <tr>
              <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
                <c:set var="fdNm" value="${fn}" scope="request"/>
                <c:set var="mdl" value="${ent[fn]}" scope="request"/>
                <td><jsp:include page="../st/${hldUvd.stg(cls,fn,'str')}.jsp"/></td>
              </c:forEach>
            </tr>
          </c:forEach>
        </table>
      </c:forEach>
      <c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
    </c:if>
  </div>
</body>
</html>
