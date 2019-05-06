<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="tml/var.jsp"/>
<jsp:useBean id="usdDp" class="java.util.HashMap" scope="request"/>
<c:set var="ent" value="${rvs.uvs.ent}" scope="request"/>
<c:set var="frPlNm" value="frmMnPl" scope="request"/>
<c:set var="acEntSv" value="entSv" scope="request"/>
<c:set var="frAct" value="srv" scope="request"/>
<c:import url="/WEB-INF/jsp/tml/ed.jsp" varReader="rdEdEn" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "${frPlNm}", "cont": "${utJsp.toJsonStrCls(rdEdEn)}",
    "trgPrNm": null, "jscr": null},
    <c:set var="jscr" value="${hldUvd.setJs(rvs,usdDp,frPlNm)}bsOpnDlg('${frPlNm}EdDlg');"/>
    <c:if test="${not empty numJsAf}">
      <c:set var="jscr" value="${jscr}${numJsAf}"/>
    </c:if>
   {"trgNm": null, "cont": null,
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}      
  ]
}
</c:import>
