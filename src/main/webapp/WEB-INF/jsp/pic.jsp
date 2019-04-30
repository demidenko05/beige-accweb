<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="liHe" value="${hldUvd.stg(cls,'liHe')}"/>
<c:if test="${not empty liHe}">
  <jsp:include page="ls/${liHe}.jsp"/>
</c:if>
<c:set var="liAc" value="${hldUvd.stg(cls,'liAc')}"/>
<table>
  <tr>
    <jsp:include page="${param.mbl}ls/roHe.jsp"/>
    <th class="column-actions">${i18n.getMsg('Actions', rvs.upf.lng.iid)}</th>
  </tr>
  <c:forEach var="ent" items="${hldUvd.ents}">
    <c:set var="ent" value="${ent}" scope="request"/>
    <tr>
      <jsp:include page="${param.mbl}ls/roDe.jsp"/>
      <td class="column-actions">
        <c:if test="${empty param.pic}">
          <jsp:include page="pi/${hldUvd.stg(cls,'pic')}.jsp"/>
        </c:if>
        <c:if test="${not empty param.pic}">
          <jsp:include page="pi/${param.pic}.jsp"/>
        </c:if>
      </td>
    </tr>
  </c:forEach>
</table>
<c:set var="piFo" value="${hldUvd.stg(cls,'piFo')}"/>
<c:if test="${not empty piFo}">
  <jsp:include page="pi/${piFo}.jsp"/>
</c:if>
