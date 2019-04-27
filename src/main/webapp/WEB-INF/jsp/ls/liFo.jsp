<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pages">
  <c:forEach var="page" items="${hldUvd.pgs}">
    <c:if test="${page.val eq '...'}">
      <span class="page-inactive">...</span>
    </c:if>
    <c:if test="${!(page.val eq '...') && page.cur}">
      <a href="#" class="page-current" onclick="bsGtAjx('GET', 'srv/?rnd=${rndLst}&act=lst&ent=${cls.simpleName}&pg=${page.val}${flyPar}');">${page.val}</a>
    </c:if>
    <c:if test="${!(page.val eq '...') && !page.cur}">
      <a href="#" class="page" onclick="bsGtAjx('GET', 'srv/?rnd=${rndLst}&act=lst&ent=${cls.simpleName}&pg=${page.val}${flyPar}');">${page.val}</a>
    </c:if>
  </c:forEach>
  <button id="listMainNew" onclick="bsGtAjx('GET', 'srv/?rnd=edj&act=entCr&ent=${cls.simpleName}&pg=${param.pg}${flyPar}');" class="btn">
    ${i18n.getMsg('New', rvs.upf.lng.iid)}
  </button>
</div>
