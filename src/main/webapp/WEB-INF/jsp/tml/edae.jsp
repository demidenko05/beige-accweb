<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.rvId}">
  <c:set var="tit" value="New"/>
</c:if>
<c:if test="${not empty ent.rvId}">
  <c:set var="tit" value="Reverse"/>
</c:if>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg(tit,rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName,rvs.upf.lng.iid)}
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
        <jsp:include page="../in/ida.jsp"/>
        <c:set var="auFoc" value="autofocus" scope="request"/>
        <c:if test="${empty ent.rvId}">  
          <c:set var="fdNm" value="dat" scope="request"/>
          <jsp:include page="../in/dtTm.jsp"/>
          <c:set var="fdNm" value="acDb" scope="request"/>
          <c:set var="saNm" value="sadNm" scope="request"/>
          <c:set var="saId" value="sadId" scope="request"/>
          <c:set var="saTy" value="sadTy" scope="request"/>
          <jsp:include page="../in/acc.jsp"/>
          <c:set var="fdNm" value="acCr" scope="request"/>
          <c:set var="saNm" value="sacNm" scope="request"/>
          <c:set var="saId" value="sacId" scope="request"/>
          <c:set var="saTy" value="sacTy" scope="request"/>
          <jsp:include page="../in/acc.jsp"/>
          <tr>
            <td>
              <label for="Entr.debt">${i18n.getMsg("Amount", rvs.upf.lng.iid)}</label>
            </td>
          <c:if test="${not empty param.mbl}">
            <tr></tr>
          </c:if>
            <td>
              <div class="input-line">
                <c:set target="${usdDp}" property="${rvs.astg.csDp}m" value="${rvs.astg.csDp}m"/>
                <input type="text" class="bsNum${rvs.astg.csDp}m" required name="Entr.debt" value="${hldUvd.toStr(rvs,cls,'debt',ent.debt)}" onchange="bsInpChn(this);"/> 
              </div>
            </td>
          </tr>
        </c:if>
        <c:if test="${not empty ent.rvId}">  
          <input type="hidden" name="Entr.rvId" value="${ent.rvId}">
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
                <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) == 0}">${hldUvd.toStr(rvs,cls,'debt',ent.debt.negate())}</c:if>
                <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) != 0}">${hldUvd.toStr(rvs,cls,'cred',ent.cred.negate())}</c:if>
              </div>
            </td>
          </tr>
        </c:if>
        <c:set var="fdNm" value="dscr" scope="request"/>
        <jsp:include page="../in/txt.jsp"/>
      </table>
      <div class="form-actions">
        <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
        <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=esiaej');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
