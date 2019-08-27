<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<c:set var="jscr" value="bsOpnDlg('frmRepDlg');"/>
<c:import url="/WEB-INF/jsp/rep/rflsf.jsp" varReader="rdForm" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "frmRep", "cont": "${utJsp.toJsonStrCls(rdForm)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}]
}
</c:import>
