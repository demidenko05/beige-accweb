<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${rvs.uvs.ordMp[ordByNm] != fdNm}"> <c:set var="checkedOrNot" value=""/> </c:if>
<c:if test="${rvs.uvs.ordMp[ordByNm] == fdNm}"> <c:set var="checkedOrNot" value="checked"/> </c:if>
<label>
  <input type="radio" name="${ordByNm}" value="${fdNm}" ${checkedOrNot} onchange="bsInpChn(this);">
  ${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
