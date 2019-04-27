<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="var.jsp"/>
<jsp:useBean id="usdDp" class="java.util.HashMap" scope="request"/>
<c:set var="lsPlNm" value="lstMnPl" scope="request"/>
<c:set var="rndLst" value="lj" scope="request"/>
<c:set var="prfFlOrFrm" value="${lsPlNm}" scope="request"/>
<c:set var="prfFlOr" value="fom" scope="request"/>
<c:if test="${param.jscr == null}">
  <c:set var="jscrt" value="${hldUvd.setJs()}"/>
</c:if>
<c:if test="${param.jscr != null}">
  <c:set var="jscrt" value="${hldUvd.setJs()}${param.jscr}"/>
</c:if>
<c:import url="/WEB-INF/jsp/lsh.jsp" varReader="rdEnts" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "${lsPlNm}", "cont": "${utJsp.toJsonStrCls(rdEnts)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscrt)}"}
    <c:if test="${usdPd.size() gt 0}">
      <c:forEach items="${param}" var="par">
        <c:set var="udps" value="${udps},${udp}"/>
      </c:forEach>
        <c:set var="jsnumall" value="bsIniInpNum('${udps}','${lsPlNm}');"/>
      <c:if test="${not empty numJsAf}">
        <c:set var="jsnumall" value="${jsnumall}${numJsAf}"/>
      </c:if>
      ,{"trgNm": null, "cont": null,
      "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jsnumall)}"}      
    </c:if>
  ]
}
</c:import>
