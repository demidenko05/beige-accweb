<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!txbl}">
  <c:if test="${empty ent.cuFr}">
    <tr>
      <td>
        <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
      </td>
      <td>
        <div class="input-line">
          <c:set var="mdl" value="${ent[fdNm]}" scope="request"/> 
          <jsp:include page="../st/${hldUvd.stgNn(cls,fdNm,'str')}.jsp"/>
        </div>
      </td>
    </tr>
  </c:if>
  <c:if test="${not empty ent.cuFr}">
    <tr>
      <td>
        <label>${i18n.getMsg("toFc", rvs.upf.lng.iid)}</label>
      </td>
      <td>
        <div class="input-line">
          <c:set var="mdl" value="${ent.toFc}" scope="request"/> 
          <jsp:include page="../st/${hldUvd.stgNn(cls,'toFc','str')}.jsp"/>
        </div>
      </td>
    </tr>
  </c:if>
</c:if>
<c:if test="${txbl}">
  <c:if test="${empty ent.cuFr}">
    <tr>
      <td>
        <label>${i18n.getMsg("subt", rvs.upf.lng.iid)}+${i18n.getMsg("toTx", rvs.upf.lng.iid)}=${i18n.getMsg("tot", rvs.upf.lng.iid)}</label>
      </td>
      <td>
        <div class="input-line">
          <c:set var="mdl" value="${ent.subt}" scope="request"/> 
          <jsp:include page="../st/${hldUvd.stgNn(cls,'subt','str')}.jsp"/>
          <c:set var="mdl" value="${ent.toTx}" scope="request"/> 
          +<jsp:include page="../st/${hldUvd.stgNn(cls,'toTx','str')}.jsp"/>
          <c:set var="mdl" value="${ent.tot}" scope="request"/> 
          =<jsp:include page="../st/${hldUvd.stgNn(cls,'tot','str')}.jsp"/>
        </div>
      </td>
    </tr>
  </c:if>
  <c:if test="${not empty ent.cuFr}">
    <tr>
      <td>
        <label>${i18n.getMsg("suFc", rvs.upf.lng.iid)}+${i18n.getMsg("txFc", rvs.upf.lng.iid)}=${i18n.getMsg("toFc", rvs.upf.lng.iid)}</label>
      </td>
      <td>
        <div class="input-line">
          <c:set var="mdl" value="${ent.suFc}" scope="request"/> 
          <jsp:include page="../st/${hldUvd.stgNn(cls,'suFc','str')}.jsp"/>
          <c:set var="mdl" value="${ent.txFc}" scope="request"/> 
          +<jsp:include page="../st/${hldUvd.stgNn(cls,'txFc','str')}.jsp"/>
          <c:set var="mdl" value="${ent.toFc}" scope="request"/> 
          =<jsp:include page="../st/${hldUvd.stgNn(cls,'toFc','str')}.jsp"/>
        </div>
      </td>
    </tr>
  </c:if>
</c:if>
