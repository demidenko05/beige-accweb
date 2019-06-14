<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:set var="cls" value="${rvs.entrCls}" scope="request"/>
    <c:set var="nameEnts" value="${cls.simpleName}s"/>
    <div class="title-list">${i18n.getMsg(nameEnts, rvs.upf.lng.iid)}</div>
    <table>
      <tr>
        <c:if test="${empty param.mbl}">
          <th>${i18n.getMsg('iid', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('dat', rvs.upf.lng.iid)}</th>
          <th>${i18n.getMsg('acDb', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('sadNm', rvs.upf.lng.iid)}</th>
          <th>${i18n.getMsg('acCr', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('sacNm', rvs.upf.lng.iid)}</th>
          <th>${i18n.getMsg('Amount', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('dscr', rvs.upf.lng.iid)}</th>
        </c:if>
        <c:if test="${not empty param.mbl}">
          <th>| ${i18n.getMsg('iid', rvs.upf.lng.iid)}
          | ${i18n.getMsg('acDb', rvs.upf.lng.iid)} | ${i18n.getMsg('sadNm', rvs.upf.lng.iid)}
          | ${i18n.getMsg('acCr', rvs.upf.lng.iid)} | ${i18n.getMsg('sacNm', rvs.upf.lng.iid)}
          | ${i18n.getMsg('Amount', rvs.upf.lng.iid)} | ${i18n.getMsg('dscr', rvs.upf.lng.iid)}</th>
        </c:if>
      </tr>
      <c:forEach var="ent" items="${ent.entrs}">
        <c:set var="ent" value="${ent}" scope="request"/>
        <tr>
          <c:set var="isFst" value="${true}" scope="request"/>
          <c:set var="fdNm" value="iid" scope="request"/>
          <c:set var="mdl" value="${ent.iid}" scope="request"/>
          <jsp:include page="../${param.mbl}ls/ceDe.jsp"/>
          <c:set var="isFst" value="${false}" scope="request"/>
          <c:set var="fdNm" value="dat" scope="request"/>
          <c:set var="mdl" value="${ent.dat}" scope="request"/>
          <jsp:include page="../${param.mbl}ls/ceDe.jsp"/>
          <c:if test="${empty param.mbl}">
            <td>${ent.acDb.nme}</td><td>${ent.sadNm}</td>
            <td>${ent.acCr.nme}</td><td>${ent.sacNm}</td>
            <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) == 0}">
              <td style="text-align: right;">${hldUvd.toStr(rvs,cls,'debt',ent.debt)}</td>
            </c:if>
            <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) != 0}">
              <td style="text-align: right;">${hldUvd.toStr(rvs,cls,'cred',ent.cred)}</td>
            </c:if>
            <td>${ent.dscr}</td>
          </c:if>
          <c:if test="${not empty param.mbl}">
            <td>| ${ent.acDb.nme} | ${ent.sadNm}| ${ent.acCr.nme} | ${ent.sacNm}
            |<c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) == 0}">${hldUvd.toStr(rvs,cls,'debt',ent.debt)}</c:if>
             <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) != 0}">${hldUvd.toStr(rvs,cls,'cred',ent.cred)}</c:if>
            | ${ent.dscr}</td>
          </c:if>
        </tr>
      </c:forEach>
    </table>
    <c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
  </div>
</body>
</html>
