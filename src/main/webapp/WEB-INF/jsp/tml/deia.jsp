<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${frPlNm}DlDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("Delete", rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Dl')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}DlFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="entDl,lst">
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
        <jsp:include page="../in/idi.jsp"/>
        <c:set var="fdNm" value="dat" scope="request"/>
        <jsp:include page="../in/dis.jsp"/>
        <c:set var="fdNm" value="debt" scope="request"/>
        <jsp:include page="../in/dis.jsp"/>
        <c:set var="fdNm" value="cred" scope="request"/>
        <jsp:include page="../in/dis.jsp"/>
        <c:set var="fdNm" value="dscr" scope="request"/>
        <jsp:include page="../in/dis.jsp"/>
      </table>
      <c:set var="cls" value="${rvs.entrCls}" scope="request"/>
      <c:set var="nameEnts" value="${cls.simpleName}s"/>
      <div class="title-list"> ${i18n.getMsg(nameEnts, rvs.upf.lng.iid)} </div>
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
        </tr>
        <c:forEach var="ent" items="${ent.entrs}">
          <c:set var="ent" value="${ent}" scope="request"/>
          <tr>
            <c:set var="isFst" value="${true}" scope="request"/>
            <c:set var="fdNm" value="iid" scope="request"/>
            <c:set var="mdl" value="${ent.iid}" scope="request"/>
            <jsp:include page="../ls/ceDe.jsp"/>
            <c:set var="isFst" value="${false}" scope="request"/>
            <c:set var="fdNm" value="dat" scope="request"/>
            <c:set var="mdl" value="${ent.dat}" scope="request"/>
            <jsp:include page="../ls/ceDe.jsp"/>
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
          </tr>
        </c:forEach>
      </table>
      <c:set var="ent" value="${rvs.uvs.ent}" scope="request"/>
      <c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
      <jsp:include page="../fm/${hldUvd.stgNn(cls,'dlAc')}.jsp"/>
    </form>
  </div>
</dialog>
