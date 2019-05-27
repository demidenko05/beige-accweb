<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="actTi" value="Edit"/>
<c:if test="${ent.isNew}">
  <c:set var="actTi" value="New"/>
</c:if>
<c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg(actTi, rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="${frAct}" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="${acEntSv},entEd,lst">
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
        <jsp:include page="../${param.mbl}in/ida.jsp"/>
        <c:set var="fdNm" value="dat" scope="request"/>
        <jsp:include page="../${param.mbl}in/dtTm.jsp"/>
        <c:set var="fdNm" value="debt" scope="request"/>
        <jsp:include page="../${param.mbl}in/reo.jsp"/>
        <c:set var="fdNm" value="cred" scope="request"/>
        <jsp:include page="../${param.mbl}in/reo.jsp"/>
        <c:set var="fdNm" value="dscr" scope="request"/>
        <jsp:include page="../${param.mbl}in/txt.jsp"/>
      </table>
      <div class="form-actions">
        <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
        <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=esiaj');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
    <c:if test="${!ent.isNew}">
      <c:set var="cls" value="${rvs.entrCls}" scope="request"/>
      <table>
        <tr>
          <c:if test="${empty param.mbl}">
            <th>${i18n.getMsg('iid', rvs.upf.lng.iid)}</th>
            <th>${i18n.getMsg('acDb', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('sadNm', rvs.upf.lng.iid)}</th>
            <th>${i18n.getMsg('acCr', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('sacNm', rvs.upf.lng.iid)}</th>
            <th>${i18n.getMsg('amount', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('dscr', rvs.upf.lng.iid)}</th>
          </c:if>
          <c:if test="${not empty param.mbl}">
            | ${i18n.getMsg('iid', rvs.upf.lng.iid)}
            | ${i18n.getMsg('acDb', rvs.upf.lng.iid)} | ${i18n.getMsg('sadNm', rvs.upf.lng.iid)}
            | ${i18n.getMsg('acCr', rvs.upf.lng.iid)} | ${i18n.getMsg('sacNm', rvs.upf.lng.iid)}
            | ${i18n.getMsg('amount', rvs.upf.lng.iid)} | ${i18n.getMsg('dscr', rvs.upf.lng.iid)}
          </c:if>
          <th class="column-actions">${i18n.getMsg('Actions', rvs.upf.lng.iid)}</th>
        </tr>
        <c:forEach var="entr" items="${rvs.entrs}">
          <tr>
            <c:set var="isFst" value="${true}" scope="request"/>
            <c:set var="fdNm" value="iid" scope="request"/>
            <c:set var="mdl" value="${entr.iid}" scope="request"/>
            <jsp:include page="../${param.mbl}ls/ceDe.jsp"/>
            <c:if test="${empty param.mbl}">
              <td>${entr.acDb.nme}</td><td>${entr.sadNm}</td>
              <td>${entr.acCr.nme}</td><td>${entr.sacNm}</td>
              <c:if test="${entr.cred.compareTo(java.math.Bigdecimal.ZERO) == 0}">
                <td style="text-align: right;">${hldUvd.toStr(rvs,cls,'debt',entr.debt)}</td>
              </c:if>
              <c:if test="${entr.cred.compareTo(java.math.Bigdecimal.ZERO) != 0}">
                <td style="text-align: right;">${hldUvd.toStr(rvs,cls,'cred',entr.cred)}</td>
              </c:if>
              <td>${entr.dscr}</td>
            </c:if>
            <c:if test="${not empty param.mbl}">
              | ${entr.acDb.nme} | ${entr.sadNm}
              | ${entr.acCr.nme} | ${entr.sacNm}
              | ${hldUvd.toStr(rvs,cls,'debt',entr.debt)} | ${entr.dscr}
            </c:if>
            <td class="column-actions">
              <c:set var="idPar" value="${hldUvd.idHtml(rvs,entr)}"/>
              <button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eaej&act=entCp&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.srId=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Copy", rvs.upf.lng.iid)}</button>
              <button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eaej&act=entRv&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.srId=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Reverse", rvs.upf.lng.iid)}</button>
            </td>
          </tr>
        </c:forEach>
      </table>
      <div class="pages">
        <button onclick="bsGtAjxCf('GET', 'srv?rnd=eaej&act=entCr&ent=${rvs.entrCls.simpleName}&${rvs.entrCls.simpleName}.srid=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');" class="btn">
          ${i18n.getMsg("New", rvs.upf.lng.iid)}
        </button>
      </div>
      <c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
    </c:if>      
  </div>
</dialog>
