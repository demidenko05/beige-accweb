<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
  <div class="col-12 col-md-4 mb-3">
    <label>${i18n.getMsg("pri", rvs.upf.lng.iid)}:</label>
    <select name="fltPriOp" onchange="onFilterNumberOperChanged(this, 'fltPriVal1', 'fltPriVal2');" class="form-control">
      <c:if test="${rvs.fltPri.opr ne 'GREATER_THAN_EQUAL'}"> <c:set var="selGreater" value=""/> </c:if>
      <c:if test="${rvs.fltPri.opr eq 'GREATER_THAN_EQUAL'}"> <c:set var="selGreater" value="selected"/> </c:if>
      <c:if test="${rvs.fltPri.opr ne 'LESS_THAN_EQUAL'}"> <c:set var="selLess" value=""/> </c:if>
      <c:if test="${rvs.fltPri.opr eq 'LESS_THAN_EQUAL'}"> <c:set var="selLess" value="selected"/> </c:if>
      <c:if test="${rvs.fltPri.opr ne 'BETWEEN_INCLUDE'}"> <c:set var="selBetween" value=""/> </c:if>
      <c:if test="${rvs.fltPri.opr eq 'BETWEEN_INCLUDE'}"> <c:set var="selBetween" value="selected"/> </c:if>
      <c:if test="${empty selGreater && empty selLess && empty selBetween}"> <c:set var="selNon" value=""/> </c:if>
      <c:if test="${!(empty selGreater && empty selLess && empty selBetween)}"> <c:set var="selNon" value="selected"/> </c:if>
      <option value="" ${selNon}>-</option>
      <option value="GREATER_THAN_EQUAL" ${selGreater}>${i18n.getMsg("price_from", rvs.upf.lng.iid)}</option>
      <option value="LESS_THAN_EQUAL" ${selLess}>${i18n.getMsg("price_to", rvs.upf.lng.iid)}</option>
      <option value="BETWEEN_INCLUDE" ${selBetween}>${i18n.getMsg("price_from_to", rvs.upf.lng.iid)}</option>
    </select>
  </div>
  <div class="col-12 col-md-4 mb-3">
    <c:if test="${empty selGreater && empty selLess && empty selBetween}"> <c:set var="disbV1" value="disabled"/> </c:if>
    <c:if test="${!(empty selGreater && empty selLess && empty selBetween)}"> <c:set var="disbV1" value=""/> </c:if>
    <label style="padding-left: 1rem;">${i18n.getMsg("Value1", rvs.upf.lng.iid)}:</label>
    <input id="fltPriVal1" name="fltPriVal1" ${disbV1} type="text" class="form-control bsNum0" value="${rvs.fltPri.value1}">
  </div>
  <div class="col-12 col-md-4 mb-3">
    <c:if test="${rvs.fltPri.opr ne 'BETWEEN_INCLUDE'}"> <c:set var="disbV2" value="disabled"/> </c:if>
    <c:if test="${rvs.fltPri.opr eq 'BETWEEN_INCLUDE'}"> <c:set var="disbV2" value=""/> </c:if>
    <label style="padding-left: 1rem;">${i18n.getMsg("Value2", rvs.upf.lng.iid)}:</label>
    <input id="fltPriVal2" name="fltPriVal2" ${disbV2} type="text" class="form-control bsNum0" value="${rvs.fltPri.value2}">
  </div>
</div>
