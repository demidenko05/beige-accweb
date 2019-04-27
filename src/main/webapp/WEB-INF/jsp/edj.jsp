<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="var.jsp"/>
<jsp:useBean id="usdDp" class="java.util.HashMap" scope="request"/>
<c:set var="ent" value="${hldUvd.ent}" scope="request"/>
<c:set var="frPlNm" value="frmMnPl" scope="request"/>
<c:set var="jscrt" value="${hldUvd.setJs()}bsOpnDlg('${frPlNm}EdDlg');"/>
<c:import url="/WEB-INF/jsp/ed.jsp" varReader="rdEdEn" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "${frPlNm}", "cont": "${utJsp.toJsonStrCls(rdEdEn)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscrt)}"}
    <c:if test="${usdPd.size() gt 0}">
      <c:forEach items="${param}" var="par">
        <c:set var="udps" value="${udps},${udp}"/>
      </c:forEach>
        <c:set var="jsnumall" value="bsIniInpNum('${udps}','${frPlNm}');"/>
      <c:if test="${not empty numJsAf}">
        <c:set var="jsnumall" value="${jsnumall}${numJsAf}"/>
      </c:if>
      ,{"trgNm": null, "cont": null,
      "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jsnumall)}"}      
    </c:if>
  ]
}
</c:import>
