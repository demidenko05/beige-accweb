<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="actTi" value="Edit"/>
<c:set var="msgSuc" value="edit_ok"/>
<c:if test="${ent.isNew}">
  <c:set var="actTi" value="New"/>
  <c:set var="msgSuc" value="insert_ok"/>
</c:if>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg(actTi, rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="${acEntSv},entEd,lst">
      <input type="hidden" name="ent" value="${cls.simpleName}">
      <input type="hidden" name="msgSuc" value="${msgSuc}">
      <input type="hidden" name="pg" value="${param.pg}">
      <c:if test="${not empty param.mbl}">
        <input type="hidden" name="mbl" value="${param.mbl}">
      </c:if>
      <c:forEach items="${param}" var="par">
        <c:if test="${par.key.startsWith('fom') || par.key.startsWith('fly')}">
          <input type="hidden" name="${par.key}" value="${par.value}">
        </c:if>
      </c:forEach>
      <table class="tbl-fieldset">
      <c:set var="auFoc" value="autofocus" scope="request"/>
      <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
        <c:set var="fdNm" value="${fn}" scope="request"/>
        <c:if test="${not empty hldUvd.stg(cls,fn,'inWr')}">
          <jsp:include page="fm/${hldUvd.stg(cls,fn,'inWr')}.jsp"/>
        </c:if>
      </c:forEach>
      </table>
      <jsp:include page="fm/${hldUvd.stg(cls,'fmAc')}.jsp"/>
    </form>
    <c:if test="${!ent.isNew && rvs.uvs.owdEntsMp != null && rvs.uvs.owdEntsMp.size() gt 0}">
      <c:forEach var="olme" items="${rvs.uvs.owdEntsMp}">
        <c:set var="olme" value="${olme}" scope="request"/>
        <c:set var="cls" value="${olme.key}" scope="request"/>
        <jsp:include page="ow/owl.jsp"/>
      </c:forEach>
      <c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
    </c:if>
  </div>
</dialog>
