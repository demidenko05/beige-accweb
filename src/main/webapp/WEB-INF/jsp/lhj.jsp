<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="tml/var.jsp"/>
<jsp:useBean id="usdDp" class="java.util.HashMap" scope="request"/>
<c:set var="lsPlNm" value="lstMnPl" scope="request"/>
<c:set var="rndLst" value="lj" scope="request"/>
<c:set var="prfFlOrFrm" value="${lsPlNm}" scope="request"/>
<c:set var="prfFlOr" value="fom" scope="request"/>
<c:import url="/WEB-INF/jsp/tml/lsh.jsp" varReader="rdEnts" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "${lsPlNm}", "cont": "${utJsp.toJsonStrCls(rdEnts)}",
    "trgPrNm": null, "jscr": null},
    <c:if test="${param.jscr == null}">
      <c:set var="jscr" value="${hldUvd.setJs(rvs,usdDp, lsPlNm)}"/>
    </c:if>
    <c:if test="${param.jscr != null}">
      <c:set var="jscr" value="${hldUvd.setJs(rvs,usdDp)}${param.jscr}"/>
    </c:if>
   {"trgNm": null, "cont": null,
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}      
  ]
}
</c:import>
