<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="tml/var.jsp"/>
<jsp:useBean id="usdDp" class="java.util.HashMap" scope="request"/>
<c:set var="ent" value="${rvs.uvs.ent}" scope="request"/>
<c:set var="frPlNm" value="frmMnPl" scope="request"/>
<c:set var="frAct" value="srv" scope="request"/>
<c:import url="/WEB-INF/jsp/tml/espe.jsp" varReader="rdEdEn" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "${frPlNm}", "cont": "${utJsp.toJsonStrCls(rdEdEn)}",
    "trgPrNm": null, "jscr": null}
    <c:set var="jscr" value="${hldUvd.setJs(rvs,usdDp,frPlNm)}bsOpnDlg('${frPlNm}EdDlg');"/>
    <c:if test="${not empty rvs.msgSuc}">
      <c:set var="jscr" value="${jscr}bsShwSuc('${i18n.getMsg(rvs.msgSuc, rvs.upf.lng.iid)}');"/>
    </c:if>
    <c:if test="${not empty rvs.msgWrn}">
      <c:set var="jscr" value="${jscr}bsShwWrn('${i18n.getMsg(rvs.msgWrn, rvs.upf.lng.iid)}');"/>
    </c:if>
    <c:if test="${not empty rvs.msgErr}">
      <c:set var="jscr" value="${jscr}bsShwErr('${i18n.getMsg(rvs.msgErr, rvs.upf.lng.iid)}');"/>
    </c:if>
    <c:if test="${not empty numJsAf}">
      <c:set var="jscr" value="${jscr}${numJsAf}"/>
    </c:if>
    <c:set var="lsPlNm" value="lstMnPl" scope="request"/>
    <c:set var="prfFlOrFrm" value="${lsPlNm}" scope="request"/>
    <c:set var="rndLst" value="lj" scope="request"/>
    <c:import url="/WEB-INF/jsp/tml/lst.jsp" varReader="rdEnts" charEncoding="UTF-8">
      ,{"trgNm": "${lsPlNm}lst", "cont": "${utJsp.toJsonStrCls(rdEnts)}",
        "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}
    </c:import>
  ]
}
</c:import>
