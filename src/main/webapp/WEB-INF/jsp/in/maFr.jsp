<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty ent.clsNm}">
  <c:set var="emptsel" value=""/>
</c:if>
<c:if test="${empty ent.clsNm}">
  <c:set var="emptsel" value="selected"/>
</c:if>
<tr>
  <td>
    <label for="MaFrn.clsNm">${i18n.getMsg("clsNm", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <select required name="MaFrn.clsNm" onchange="bsInpChn(this);">
        <option value=""${emptsel}>-</option>
        <c:if test="${ent.clsNm ne 'Itm'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'Itm'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="Itm"${sel}>${i18n.getMsg('Itm', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'ItmCt'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'ItmCt'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="ItmCt"${sel}>${i18n.getMsg('ItmCt', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'Srv'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'Srv'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="Srv"${sel}>${i18n.getMsg('Srv', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'SrvCt'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'SrvCt'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="SrvCt"${sel}>${i18n.getMsg('SrvCt', rvs.upf.lng.iid)}</option>
      </select>
    </div>
  </td>
</tr>
