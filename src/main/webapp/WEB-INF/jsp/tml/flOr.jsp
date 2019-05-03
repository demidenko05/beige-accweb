<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${prfFlOrFrm}FlOrDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      <c:set var="nameEnts" value="${param.ent}s"/>
      ${i18n.getMsg(nameEnts, rvs.upf.lng.iid)} ${i18n.getMsg("filterOrder", rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${prfFlOrFrm}FlOr')" class="btn-close">x</button>
    </div>
    <form class="filter" id="${prfFlOrFrm}FlOrFrm" action="srv" method="POST">
      <input type="hidden" name="rnd" value="${rndLst}">
      <input type="hidden" name="act" value="lst">
      <input type="hidden" name="ent" value="${cls.simpleName}">
      <input type="hidden" name="pg" value="${param.pg}">
      <input type="hidden" name="jscr" value="bsClChnCsDlg('${prfFlOrFrm}FlOr')">
      <c:forEach items="${param}" var="par">
        <c:if test="${par.key.startsWith('fly')}">
          <input type="hidden" name="${par.key}" value="${par.value}">
        </c:if>
      </c:forEach>
      <c:if test="${not empty param.mbl}">
        <input type="hidden" name="mbl" value="${param.mbl}">
      </c:if>
      <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
        <c:set var="fdNm" value="${fn}" scope="request"/>
        <c:if test="${not empty hldUvd.stg(cls,fn,'flt')}">
          <jsp:include page="../${param.mbl}fl/${hldUvd.stg(cls,fn,'flt')}.jsp"/>
        </c:if>
      </c:forEach>
      <div class="input-line">
        ${i18n.getMsg("OrderBy", rvs.upf.lng.iid)}
        <c:set var="ordByNm" value="${prfFlOr}ordBy" scope="request"/>
        <c:set var="ordByDeNm" value="${prfFlOr}ordByDe"/>
        <c:if test="${rvs.uvs.ordMp[ordByNm] != 'disabled'}"> <c:set var="isChkd" value=""/> </c:if>
        <c:if test="${rvs.uvs.ordMp[ordByNm] == 'disabled'}"> <c:set var="isChkd" value="checked"/> </c:if>
        <label>
          <input type="radio" name="${ordByNm}" value="disabled" ${isChkd} onchange="bsInpChn(this);">
          ${i18n.getMsg("disabled", rvs.upf.lng.iid)}
        </label>
        <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
          <c:set var="fdNm" value="${fn}" scope="request"/>
          <c:if test="${not empty hldUvd.stg(cls,fn,'ord')}">
            <jsp:include page="../or/${hldUvd.stg(cls,fn,'ord')}.jsp"/>
          </c:if>
        </c:forEach>
        <c:if test="${rvs.uvs.ordMp[ordByDeNm] != 'on'}"> <c:set var="isChkd" value=""/> </c:if>
        <c:if test="${rvs.uvs.ordMp[ordByDeNm] == 'on'}"> <c:set var="isChkd" value="checked"/> </c:if>
        <label>
          <input type="checkbox" name="${ordByDeNm}" ${isChkd} onchange="bsInpChn(this);">
          ${i18n.getMsg("orderByDesc", rvs.upf.lng.iid)}
        </label>
      </div>
      <div class="form-actions">
        <input style="display: none" id="${prfFlOrFrm}FlOrFrmFs" type="submit"/>
        <button type="button" onclick="bsSbFrmAjx('${prfFlOrFrm}FlOrFrm',true);">${i18n.getMsg("Apply", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${prfFlOrFrm}FlOr');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
