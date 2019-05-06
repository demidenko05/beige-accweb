<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<c:set var="jscr" value="bsOpnDlg('infDlg');"/>
<c:import url="/WEB-INF/jsp/tml/abo.jsp" varReader="rdAbout" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "trgInf", "cont": "${utJsp.toJsonStrCls(rdAbout)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}]
}
</c:import>
