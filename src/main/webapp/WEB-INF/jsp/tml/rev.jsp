<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("Reverse", rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="${acLst}lst">
      <input type="hidden" name="ent" value="${cls.simpleName}">
      <input type="hidden" name="pg" value="${param.pg}">
      <input type="hidden" name="rnd" value="${rnRv}">
      <c:if test="${not empty param.mbl}">
        <input type="hidden" name="mbl" value="${param.mbl}">
      </c:if>
      <c:forEach items="${param}" var="par">
        <c:if test="${par.key.startsWith('fom') || par.key.startsWith('fly')}">
          <input type="hidden" name="${par.key}" value="${par.value}">
        </c:if>
      </c:forEach>
      <table class="tbl-fieldset">
      <c:set var="fdNm" value="rvId" scope="request"/>
      <jsp:include page="../in/reo.jsp"/>
      <c:set var="auFoc" value="autofocus" scope="request"/>
      <c:set var="fdNm" value="dscr" scope="request"/>
      <jsp:include page="../in/txt.jsp"/>
      <c:forEach var="fn" items="${hldUvd.lazFrmFds(cls)}">
        <c:if test="${fn eq 'iid'}">
          <c:set var="fdNm" value="iid" scope="request"/>
          <jsp:include page="../in/${hldUvd.stgNn(cls,fn,'inp')}.jsp"/>
        </c:if>
        <c:if test="${fn ne 'iid' && fn ne 'rvId' && fn ne 'dscr' && fn ne 'ownr'}">
          <c:set var="fdNm" value="${fn}" scope="request"/>
          <jsp:include page="../in/reo.jsp"/>
        </c:if>
      </c:forEach>
      </table>
      <div class="form-actions">
        <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
        <button type="button" onclick="bsSbFrmAjxCf('${frPlNm}EdFrm', true);">${i18n.getMsg("Reverse", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
