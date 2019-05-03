<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${lsPlNm}${param.ent}Dlg" class="dlg">
  <div class="form-std">
    <div class="dialog-title">
      <c:set var="nameEnts" value="${param.ent}s"/>
      ${srvI18n.getMsg(nameEnts, reqVars.lang)} ${i18n.getMsg("picker", reqVars.lang)}
      <button onclick="bsClsDlg('${lsPlNm}${param.ent}Dlg')" class="btn-close">x</button>
    </div>
    <div id="${lsPlNm}${param.ent}lst">
      <jsp:include page="pic.jsp"/>
    </div>
  </div>
</dialog>
<c:set var="flOr" value="${hldUvd.stg(cls, 'flOr')}"/>
<c:if test="${not empty flOr}">
  <jsp:include page="tml/${flOr}.jsp"/>
</c:if>
