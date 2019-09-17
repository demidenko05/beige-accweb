<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("Edit",rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName,rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="entChd,lst">
      <input type="hidden" name="ent" value="${cls.simpleName}">
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
        <c:set var="fdNm" value="iid" scope="request"/>
        <jsp:include page="../in/ida.jsp"/>
        <tr>
          <td>
            <label>${i18n.getMsg("dat", rvs.upf.lng.iid)}</label>
          </td>
        <c:if test="${not empty param.mbl}">
          <tr></tr>
        </c:if>
          <td>
            <div class="input-line">
              <c:set var="fdNm" value="dat" scope="request"/>
              <c:set var="mdl" value="${ent.dat}" scope="request"/>
              <jsp:include page="../st/${hldUvd.stgNn(cls,fdNm,'str')}.jsp"/>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label>${i18n.getMsg("acDb", rvs.upf.lng.iid)}</label>
          </td>
        <c:if test="${not empty param.mbl}">
          <tr></tr>
        </c:if>
          <td>
            <div class="input-line">
              ${ent.acDb.nme} ${ent.sadNm}
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label>${i18n.getMsg("acCr", rvs.upf.lng.iid)}</label>
          </td>
        <c:if test="${not empty param.mbl}">
          <tr></tr>
        </c:if>
          <td>
            <div class="input-line">
              ${ent.acCr.nme} ${ent.sacNm}
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label>${i18n.getMsg("Amount", rvs.upf.lng.iid)}</label>
          </td>
        <c:if test="${not empty param.mbl}">
          <tr></tr>
        </c:if>
          <td>
            <div class="input-line">
              <c:if test="${ent.cred.unscaledValue() == 0}">${hldUvd.toStr(rvs,cls,'debt',ent.debt)}</c:if>
              <c:if test="${ent.cred.unscaledValue() != 0}">${hldUvd.toStr(rvs,cls,'cred',ent.cred)}</c:if>
            </div>
          </td>
        </tr>
        <c:set var="fdNm" value="dscr" scope="request"/>
        <jsp:include page="../in/txt.jsp"/>
      </table>
      <div class="form-actions">
        <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
        <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=lcfj');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
