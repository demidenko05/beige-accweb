<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="frcd" value="${prfFlOr}frcd"/>
<c:if test="${rvs.uvs.fltMp[frcd].contains(fdNm)}">
  <c:set var="parVl1" value="${prfFlOr}${fdNm}Vl1"/>
  <c:set var="parOpr1" value="${prfFlOr}${fdNm}Opr1"/>
  <b>${i18n.getMsg("forced", rvs.upf.lng.iid)}</b>
  <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  ${i18n.getMsg(rvs.uvs.fltMp[parOpr1], rvs.upf.lng.iid)}
  <input type="hidden" name="${parOpr1}" value="${rvs.uvs.fltMp[parOpr1]}">
  <c:if test="${not empty rvs.uvs.fltMp[parVl1]}">
    ${rvs.uvs.fltMp[parVl1]}
    <input type="hidden" name="${parVl1}" value="${rvs.uvs.fltMp[parVl1]}">
  </c:if>
</c:if>
