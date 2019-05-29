<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("New", rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="entSv,entEd,lst">
      <input type="hidden" name="ent" value="${cls.simpleName}">
      <input type="hidden" name="pg" value="${param.pg}">
      <input type="hidden" name="owVr" value="${rvs.owVr}">
      <input type="hidden" name="Entr.srId" value="${ent.srId}">
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
        <c:set var="fdNm" value="dat" scope="request"/>
        <jsp:include page="../${param.mbl}in/dtTm.jsp"/>
        <c:set var="fdNm" value="acDb" scope="request"/>
        <c:set var="saNm" value="sadNm" scope="request"/>
        <c:set var="saId" value="sadId" scope="request"/>
        <c:set var="saTy" value="sadTy" scope="request"/>
        <jsp:include page="../${param.mbl}in/acc.jsp"/>
        <c:set var="fdNm" value="acCr" scope="request"/>
        <c:set var="saNm" value="sacNm" scope="request"/>
        <c:set var="saId" value="sacId" scope="request"/>
        <c:set var="saTy" value="sacTy" scope="request"/>
        <jsp:include page="../${param.mbl}in/acc.jsp"/>
        <tr>
          <td>
            <label for="Entr.debt">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
          </td>
        <c:if test="${not empty param.mbl}">
          <tr></tr>
        </c:if>
          <td>
            <div class="input-line">
              <c:set target="${usdDp}" property="${rvs.cpf.maxDp}m" value="${rvs.cpf.maxDp}m"/>
              <input type="text" class="bsNum${rvs.cpf.maxDp}m" required name="Entr.debt" value="${hldUvd.toStr(rvs,cls,'debt',ent.debt)}" onchange="bsInpChn(this);"/> 
            </div>
          </td>
        </tr>
        <c:set var="fdNm" value="dscr" scope="request"/>
        <jsp:include page="../${param.mbl}in/txt.jsp"/>
      </table>
      <div class="form-actions">
        <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
        <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=esiaj');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
