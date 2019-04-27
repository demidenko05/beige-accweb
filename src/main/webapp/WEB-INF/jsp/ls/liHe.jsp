<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="nameEnts" value="${cls.simpleName}s"/>
<div class="title-list">${i18n.getMsg(nameEnts, rvs.upf.lng.iid)}
  <c:if test="${not empty hldUvd.stg(cls,'flOr')}">
    <button onclick="bsOpnDlg('${prfFlOrFrm}FlOrDlg');" class="btn">${i18n.getMsg("filterOrder", rvs.upf.lng.iid)}</button>
  </c:if>
</div>
