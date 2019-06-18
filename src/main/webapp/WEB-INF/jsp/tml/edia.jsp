<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="actTi" value="Edit"/>
<c:if test="${ent.isNew}">
  <c:set var="actTi" value="New"/>
</c:if>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg(actTi, rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="entSv,entEd,lst">
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
      <c:set var="auFoc" value="autofocus" scope="request"/>
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
            <th>${i18n.getMsg('iid', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('dat', rvs.upf.lng.iid)}</th>
            <th>${i18n.getMsg('acDb', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('sadNm', rvs.upf.lng.iid)}</th>
            <th>${i18n.getMsg('acCr', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('sacNm', rvs.upf.lng.iid)}</th>
            <th>${i18n.getMsg('Amount', rvs.upf.lng.iid)}</th><th>${i18n.getMsg('dscr', rvs.upf.lng.iid)}</th>
          </c:if>
          <c:if test="${not empty param.mbl}">
            <th>| ${i18n.getMsg('iid', rvs.upf.lng.iid)}
            | ${i18n.getMsg('acDb', rvs.upf.lng.iid)} | ${i18n.getMsg('sadNm', rvs.upf.lng.iid)}
            | ${i18n.getMsg('acCr', rvs.upf.lng.iid)} | ${i18n.getMsg('sacNm', rvs.upf.lng.iid)}
            | ${i18n.getMsg('Amount', rvs.upf.lng.iid)} | ${i18n.getMsg('dscr', rvs.upf.lng.iid)}</th>
          </c:if>
          <th class="column-actions">${i18n.getMsg('Actions', rvs.upf.lng.iid)}</th>
        </tr>
        <c:forEach var="ent" items="${rvs.entrs}">
          <c:set var="ent" value="${ent}" scope="request"/>
          <tr>
            <c:set var="isFst" value="${true}" scope="request"/>
            <c:set var="fdNm" value="iid" scope="request"/>
            <c:set var="mdl" value="${ent.iid}" scope="request"/>
            <jsp:include page="../${param.mbl}ls/ceDe.jsp"/>
            <c:set var="isFst" value="${false}" scope="request"/>
            <c:set var="fdNm" value="dat" scope="request"/>
            <c:set var="mdl" value="${ent.dat}" scope="request"/>
            <jsp:include page="../${param.mbl}ls/ceDe.jsp"/>
            <c:if test="${empty param.mbl}">
              <td>${ent.acDb.nme}</td><td>${ent.sadNm}</td>
              <td>${ent.acCr.nme}</td><td>${ent.sacNm}</td>
              <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) == 0}">
                <td style="text-align: right;">${hldUvd.toStr(rvs,cls,'debt',ent.debt)}</td>
              </c:if>
              <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) != 0}">
                <td style="text-align: right;">${hldUvd.toStr(rvs,cls,'cred',ent.cred)}</td>
              </c:if>
              <td>${ent.dscr}</td>
            </c:if>
            <c:if test="${not empty param.mbl}">
              <td>| ${ent.acDb.nme} | ${ent.sadNm}| ${ent.acCr.nme} | ${ent.sacNm}
              |<c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) == 0}">${hldUvd.toStr(rvs,cls,'debt',ent.debt)}</c:if>
               <c:if test="${ent.cred.compareTo(java.math.Bigdecimal.ZERO) != 0}">${hldUvd.toStr(rvs,cls,'cred',ent.cred)}</c:if>
              | ${ent.dscr}</td>
            </c:if>
            <td class="column-actions">
              <c:if test="${empty ent.rvId}">
                <c:set var="idPar" value="${hldUvd.idHtml(rvs,ent)}"/>
                <button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eaej&act=entCp&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.srId=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Copy", rvs.upf.lng.iid)}</button>
                <button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eaej&act=entRv&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.rvId=${ent.iid}&${cls.simpleName}.srId=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Reverse", rvs.upf.lng.iid)}</button>
              </c:if>
            </td>
          </tr>
        </c:forEach>
      </table>
      <div class="pages">
        <button onclick="bsGtAjxCf('GET', 'srv?rnd=eaej&act=entCr&ent=${cls.simpleName}&${cls.simpleName}.srId=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');" class="btn">
          ${i18n.getMsg("New", rvs.upf.lng.iid)}
        </button>
      </div>
      <c:set var="ent" value="${rvs.uvs.ent}" scope="request"/>
      <c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
    </c:if>      
  </div>
</dialog>
