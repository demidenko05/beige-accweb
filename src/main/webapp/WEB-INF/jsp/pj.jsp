<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="var.jsp"/>
<jsp:useBean id="usdDp" class="java.util.HashMap" scope="request"/>
<c:set var="lsPlNm" value="pisPl" scope="request"/>
<c:set var="rndLst" value="pj" scope="request"/>
<c:set var="prfFlOrFrm" value="${lsPlNm}" scope="request"/>
<c:set var="prfFlOr" value="fop" scope="request"/>
<c:if test="${param.jscr == null}">
<c:set var="jscr" value="${hldUvd.setJs(null,null)}"/>
</c:if>
<c:if test="${param.jscr != null}">
  <c:set var="jscr" value="${hldUvd.setJs(null,null)}${param.jscr}"/>
</c:if>
<c:import url="/WEB-INF/jsp/pic.jsp" varReader="rdEnts" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "${lsPlNm}${param.ent}lst", "cont": "${utJsp.toJsonStrCls(rdEnts)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}
  ]
}
</c:import>
