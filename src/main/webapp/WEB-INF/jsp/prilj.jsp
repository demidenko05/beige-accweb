<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<jsp:useBean id="usdDp" class="java.util.HashMap" scope="request"/>
<c:set target="${usdDp}" property="${rvs.astg.prDp.toString()}" value="${rvs.astg.prDp.toString()}"/>
<c:set target="${usdDp}" property="0" value="'0'"/>
<c:set var="jscr" value="${hldUvd.setJs(rvs,usdDp,'frmRep')}bsOpnDlg('frmRepDlg');"/>
<c:import url="/WEB-INF/jsp/rep/prilf.jsp" varReader="rdForm" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "frmRep", "cont": "${utJsp.toJsonStrCls(rdForm)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}]
}
</c:import>
