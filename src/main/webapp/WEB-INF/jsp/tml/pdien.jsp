<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cls" value="${driEnrCls}" scope="request"/>
<c:set var="nameEnts" value="${cls.simpleName}s"/>
<div class="title-list">${i18n.getMsg(nameEnts, rvs.upf.lng.iid)}:</div>
<table>
  <tr>
    <c:if test="${empty param.mbl}">
      <th>${i18n.getMsg('iid', rvs.upf.lng.iid)}</th></th>
      <th>${i18n.getMsg('itm', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('uom', rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg('quan', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('tot', rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg('dscr', rvs.upf.lng.iid)}</th>
    </c:if>
    <c:if test="${not empty param.mbl}">
      <th>${i18n.getMsg('iid', rvs.upf.lng.iid)}
      | ${i18n.getMsg('itm', rvs.upf.lng.iid)} | ${i18n.getMsg('uom', rvs.upf.lng.iid)}
      | ${i18n.getMsg('quan', rvs.upf.lng.iid)} | ${i18n.getMsg('tot', rvs.upf.lng.iid)}
      |${i18n.getMsg('dscr', rvs.upf.lng.iid)}</th>
    </c:if>
  </tr>
  <c:forEach var="ent" items="${driEnrs}">
    <c:set var="ent" value="${ent}" scope="request"/>
    <tr>
      <c:set var="isFst" value="${true}" scope="request"/>
      <c:set var="fdNm" value="iid" scope="request"/>
      <c:set var="mdl" value="${ent.iid}" scope="request"/>
      <jsp:include page="../ls/ceDe.jsp"/>
      <c:set var="isFst" value="${false}" scope="request"/>
      <c:set var="fdNm" value="itm" scope="request"/>
      <c:set var="mdl" value="${ent.itm}" scope="request"/>
      <jsp:include page="../ls/ceDe.jsp"/>
      <c:set var="fdNm" value="uom" scope="request"/>
      <c:set var="mdl" value="${ent.uom}" scope="request"/>
      <jsp:include page="../ls/ceDe.jsp"/>
      <c:set var="fdNm" value="quan" scope="request"/>
      <c:set var="mdl" value="${ent.quan}" scope="request"/>
      <jsp:include page="../ls/ceDe.jsp"/>
      <c:set var="fdNm" value="tot" scope="request"/>
      <c:set var="mdl" value="${ent.tot}" scope="request"/>
      <jsp:include page="../ls/ceDe.jsp"/>
      <c:set var="fdNm" value="dscr" scope="request"/>
      <c:set var="mdl" value="${ent.dscr}" scope="request"/>
      <jsp:include page="../ls/ceDe.jsp"/>
    </tr>
  </c:forEach>
</table>
<c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
