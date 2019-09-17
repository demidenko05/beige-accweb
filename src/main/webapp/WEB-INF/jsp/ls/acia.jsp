<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="idPar" value="${hldUvd.idHtml(rvs,ent)}"/>
<button onclick="window.open('srv?rnd=prn&act=entPr&ent=${cls.simpleName}&${idPar}', '_blank');" class="btn" >${i18n.getMsg("Print", rvs.upf.lng.iid)}</button>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eiaj&act=entEd&ent=${cls.simpleName}&${idPar}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Edit", rvs.upf.lng.iid)}</button>
<c:if test="${ent.debt.unscaledValue() eq 0 && ent.cred.unscaledValue() eq 0}">
  <button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=dej&act=entCd&ent=${cls.simpleName}&${idPar}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Delete", rvs.upf.lng.iid)}</button>
</c:if>
