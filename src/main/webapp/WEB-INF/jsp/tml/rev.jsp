<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("Reverse", rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="entSv,lst">
      <input type="hidden" name="ent" value="${cls.simpleName}">
      <input type="hidden" name="pg" value="${param.pg}">
      <input type="hidden" name="rnd" value="lcfj">
      <c:if test="${not empty param.mbl}">
        <input type="hidden" name="mbl" value="${param.mbl}">
      </c:if>
      <c:forEach items="${param}" var="par">
        <c:if test="${par.key.startsWith('fom') || par.key.startsWith('fly')}">
          <input type="hidden" name="${par.key}" value="${par.value}">
        </c:if>
      </c:forEach>
      <table class="tbl-fieldset">
      <c:set var="fdNm" value="iid" scope="request"/>
      <jsp:include page="../${param.mbl}in/ida.jsp"/>
      <c:set var="fdNm" value="rvId" scope="request"/>
      <jsp:include page="../${param.mbl}in/reo.jsp"/>
      <c:set var="auFoc" value="autofocus" scope="request"/>
      <c:set var="fdNm" value="dscr" scope="request"/>
      <jsp:include page="../${param.mbl}in/txt.jsp"/>
      <c:forEach var="fn" items="${hldUvd.lazFrmFds(cls)}">
        <c:if test="${fn ne 'iid' && fn ne 'rvId' && fn ne 'dscr'}">
          <c:set var="fdNm" value="${fn}" scope="request"/>
          <c:set var="mdl" value="${ent[fn]}" scope="request"/>
          ${i18n.getMsg(fn, rvs.upf.lng.iid)}:
          <jsp:include page="../st/${hldUvd.stgNn(cls,fn,'str')}.jsp"/><br>
        </c:if>
      </c:forEach>
      </table>
      <div class="form-actions">
        <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
        <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true);">${i18n.getMsg("Reverse", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
