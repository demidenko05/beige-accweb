<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="frcd" value="${prfFlOr}frcd"/>
<c:set var="parVal" value="${prfFlOr}${fdNm}Vl"/>
<c:set var="parOpr" value="${prfFlOr}${fdNm}Opr"/>
<div class="input-line">
  <c:if test="${hldUvd.fltMp[frcd].contains(fdNm)}">
    <b>${i18n.getMsg("forced", rvs.upf.lng.iid)}</b>
    <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    ${hldUvd.fltMp[parOpr]}
    <input type="hidden" name="${parOpr}" value="${hldUvd.fltMp[parOpr]}">
    ${hldUvd.fltMp[parVal]}
    <input type="hidden" name="${parVal}" value="${hldUvd.fltMp[parVal]}">
  </c:if>
  <c:if test="${!hldUvd.fltMp[frcd].contains(fdNm)}">
    <c:if test="${hldUvd.fltMp[parOpr] eq 'eq'}"> <c:set var="selEq" value="selected"/> </c:if>
    <c:if test="${hldUvd.fltMp[parOpr] eq 'like'}"> <c:set var="selLike" value="selected"/> </c:if>
    <label for="${parOpr}">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    <c:if test="${empty selEq && empty selLike}"> <c:set var="selDis" value="selected"/> </c:if>
    <select name="${parOpr}" onchange="bsFltStrChd(this, '${prfFlOrFrm}${parVal}');">
      <option value="disabled" ${selDis}>${i18n.getMsg("disabled", rvs.upf.lng.iid)}</option>
      <option value="eq" ${selEq}>=</option>
      <option value="like" ${selLike}>Like</option>
    </select>
    <c:if test="${empty selEq && empty selLike}"> <c:set var="dsbl" value="disabled"/> </c:if>
    <input id="${prfFlOrFrm}${parVal}" name="${parVal}" ${dsbl} type="text" value="${hldUvd.fltMp[parVal]}" onchange="bsInpChn(this);">
  </c:if>
</div>
