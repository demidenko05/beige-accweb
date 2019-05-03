<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${frPlNm}DlDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("Delete", rvs.upf.lng.iid)} ${i18n.getMsg(cls.simpleName, rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Dl')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}DlFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="${acsDl},lst">
      <input type="hidden" name="rnd" value="${rndd}">
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
      <c:set var="auFoc" value="autofocus" scope="request"/>
      <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
        <c:set var="fdNm" value="${fn}" scope="request"/>
        <c:if test="${not empty hldUvd.stg(cls,fn,'wde')}">
          <jsp:include page="${param.mbl}in/${hldUvd.stg(cls,fn,'wde')}.jsp"/>
        </c:if>
      </c:forEach>
      </table>
      <c:if test="${!ent.isNew && rvs.uvs.owdEntsMp != null && rvs.uvs.owdEntsMp.size() gt 0}">
        <c:forEach var="olme" items="${rvs.uvs.owdEntsMp}">
          <c:set var="cls" value="${olme.key}" scope="request"/>
          <jsp:include page="ow/owl.jsp"/>
          <c:set var="nameEnts" value="${cls.simpleName}s"/>
          <div class="title-list"> ${i18n.getMsg(nameEnts, rvs.upf.lng.iid)} </div>
          <table>
            <tr>
              <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
                <th>${i18n.getMsg(fn, rvs.upf.lng.iid)}</th>
              </c:forEach>
            </tr>
            <c:forEach var="entt" items="${olme.value}">
              <c:set var="ent" value="${ent}" scope="request"/>
              <tr>
                <c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}">
                  <c:set var="mdl" value="${ent[fn]}" scope="request"/>
                  <td><jsp:include page="st/${hldUvd.stg(cls,fn,'str')}.jsp"/></td>
                </c:forEach>
              </tr>
            </c:forEach>
          </table>
        </c:forEach>
        <c:set var="cls" value="${rvs.uvs.cls}" scope="request"/>
      </c:if>
      <jsp:include page="fm/${hldUvd.stg(cls,'dlAc')}.jsp"/>
    </form>
  </div>
</dialog>
