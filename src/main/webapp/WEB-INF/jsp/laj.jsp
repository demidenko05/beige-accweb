<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="tml/var.jsp"/>
<c:set var="lsPlNm" value="lstMnPl" scope="request"/>
<c:set var="prfFlOrFrm" value="${lsPlNm}" scope="request"/>
<c:set var="rndLst" value="lj" scope="request"/>
<c:set var="jscr" value="${hldUvd.setJs(rvs,usdDp,frPlNm)}bsShwSuc('${i18n.getMsg(rvs.msgSuc, rvs.upf.lng.iid)}');"/>
<c:import url="/WEB-INF/jsp/tml/lst.jsp" varReader="rdEnts" charEncoding="UTF-8">
{"mlTrRsp":
  [{"trgNm": "frmMnPl", "cont": "",
    "trgPrNm": null, "jscr": null},
   {"trgNm": "${lsPlNm}lst", "cont": "${utJsp.toJsonStrCls(rdEnts)}",
    "trgPrNm": null, "jscr": "${utJsp.toJsonStr(jscr)}"}
  ]
}
</c:import>
