<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="frcd" value="${prfFlOr}frcd"/>
<c:if test="${hldUvd.fltMp[frcd].contains(fdNm)}">
  <c:set var="parVl1" value="${prfFlOr}${fdNm}Vl1"/>
  <c:set var="parOpr1" value="${prfFlOr}${fdNm}Opr1"/>
  <b>${i18n.getMsg("forced", rvs.upf.lng.iid)}</b>
  <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  ${i18n.getMsg(hldUvd.fltMp[parOpr1], rvs.upf.lng.iid)}
  <input type="hidden" name="${parOpr1}" value="${hldUvd.fltMp[parOpr1]}">
  <c:if test="${not empty hldUvd.fltMp[parVl1]}">
    ${hldUvd.fltMp[parVl1]}
    <input type="hidden" name="${parVl1}" value="${hldUvd.fltMp[parVl1]}">
  </c:if>
</c:if>
