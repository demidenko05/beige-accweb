<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="input-line">
  <c:set var="frcd" value="${prfFlOr}frcd"/>
  <c:set var="parVal" value="${prfFlOr}${fdNm}Vl"/>
  <c:if test="${rvs.uvs.fltMp[frcd].contains(fdNm)}">
    <b>${i18n.getMsg("forced", rvs.upf.lng.iid)}</b>
    ${i18n.getMsg(fdNm, rvs.upf.lng.iid)}: ${i18n.getMsg(rvs.uvs.fltMp[parVal], rvs.upf.lng.iid)}
    <input type="hidden" name="${parVal}" value="${rvs.uvs.fltMp[parVal]}">
  </c:if>
  <c:if test="${!rvs.uvs.fltMp[frcd].contains(fdNm)}">
    <label for="${parVal}">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    <select name="${parVal}" onchange="bsInpChn(this);">
      <c:set var="selDis" value=""/>
      <c:if test="${empty rvs.uvs.fltMp[parVal]}"> <c:set var="selDis" value="selected"/> </c:if>
      <option value="null" ${selDis}>${i18n.getMsg("disabled", rvs.upf.lng.iid)}</option>
      <c:set var="selDis" value=""/>
      <c:if test="${rvs.uvs.fltMp[parVal].toString() eq 'true'}"> <c:set var="selDis" value="selected"/> </c:if>
      <option value="true" ${selDis}>${i18n.getMsg("Yes", rvs.upf.lng.iid)}</option>
      <c:set var="selDis" value=""/>
      <c:if test="${rvs.uvs.fltMp[parVal].toString() eq 'false'}"> <c:set var="selDis" value="selected"/> </c:if>
      <option value="false" ${selDis}>${i18n.getMsg("No", rvs.upf.lng.iid)}</option>
    </select>
  </c:if>
</div>
