<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.rsRcId}">
  <c:set var="idPar" value="${hldUvd.idHtml(rvs,ent)}"/>
  <c:if test="${ent.stas eq 'VOIDED'}">
    <button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=bslj&act=entEd&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("AddReverse", rvs.upf.lng.iid)}</button>
  </c:if>
  <c:if test="${ent.stas ne 'VOIDED'}">
    <button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=bslj&act=entEd&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("AddAdjusting", rvs.upf.lng.iid)}</button>
  </c:if>
</c:if>
