<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty ent.saTy}">
  <c:set var="emptsel" value=""/>
</c:if>
<c:if test="${empty ent.saTy}">
  <c:set var="emptsel" value="selected"/>
</c:if>
<tr>
  <td>
    <label for="Acnt.saTy">${i18n.getMsg("saTy", rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <select name="Acnt.saTy" onchange="bsInpChn(this);">
        <option value="" ${emptsel}>-</option>
        <c:forEach var="enr" items="${hlTySac.clsMp}">
          <c:if test="${ent.saTy ne enr.key}">
            <c:set var="sel" value=""/>
          </c:if>
          <c:if test="${ent.saTy eq enr.key}">
            <c:set var="sel" value="selected"/>
          </c:if>
          <option value="${enr.key}" ${sel}>${i18n.getMsg(enr.value.simpleName, rvs.upf.lng.iid)}</option>
        </c:forEach>
      </select>
    </div>
  </td>
</tr>
