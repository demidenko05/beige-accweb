<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="var.jsp"/>
<c:set var="lsPlNm" value="lstMnPl" scope="request"/>
<c:set var="prfFlOrFrm" value="${lsPlNm}" scope="request"/>
<c:set var="rndLst" value="lj" scope="request"/>
<c:if test="${param.jscr == null}">
<c:set var="jscrt" value="${hldUvd.setJs()}"/>
</c:if>
<c:if test="${param.jscr != null}">
  <c:set var="jscrt" value="${hldUvd.setJs()}${param.jscr}"/>
</c:if>
<c:import url="/WEB-INF/jsp/lst.jsp" varReader="rdEnts" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "${lsPlNm}lst", "cont": "${utJsp.toJsonStrCls(rdEnts)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscrt)}"}]
}
</c:import>
