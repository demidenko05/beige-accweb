<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/bsPrn.css" />
  <link rel="stylesheet" type="text/css" href="../css/bsPrnAc.css" />
  <link rel="icon" type="image/png" href="../img/favicon.png">
  <title>${i18n.getMsg("Ledger", rvs.upf.lng.iid)}</title>
</head>
<body>
  <div style="text-align: center;">
    <h4>
      ${i18n.getMsg("Ledger", rvs.upf.lng.iid)} ${i18n.getMsg("from", rvs.upf.lng.iid)} <fmt:formatDate value="${rvs.dt1}" type="both" timeStyle="short"/>
      ${i18n.getMsg("to", rvs.upf.lng.iid)} <fmt:formatDate value="${rvs.dt2}" type="both" timeStyle="short"/> <br>
      ${rvs.astg.org} <br>
      ${i18n.getMsg("Acnt", rvs.upf.lng.iid)}: ${param.accNm}
      <c:if test="${not empty param.saNm}">
        , <c:out value="${param.saNm}"/>
      </c:if>
    </h4>
  </div>
  <table>
    <tr>
      <th>${i18n.getMsg("dat", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("dscr", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("coracc", rvs.upf.lng.iid)}</th>
      <th class="debt-cred-th">${i18n.getMsg("debt", rvs.upf.lng.iid)}</th>
      <th class="debt-cred-th">${i18n.getMsg("cred", rvs.upf.lng.iid)}</th>
      <th class="debt-cred-th">${i18n.getMsg("blnc", rvs.upf.lng.iid)}</th>
    </tr>
    <c:if test="${empty param.saNm}">
      <c:forEach var="enr" items="${rvs.ldgPrv.lnsMp}">
        <tr>
          <td colspan="3" class="total">${enr.key}:</td>
          <td class="total">${numStr.frmt(enr.value.debt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
          <td class="total">${numStr.frmt(enr.value.cred.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
          <td class="total">${numStr.frmt(enr.value.blnc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
        </tr>
      </c:forEach>
    </c:if>
    <tr>
      <td colspan="3" class="total"><b>${i18n.getMsg("Previous", rvs.upf.lng.iid)}:</b></td>
      <td class="total"><b>${numStr.frmt(rvs.ldgPrv.debitAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</b></td>
      <td class="total"><b>${numStr.frmt(rvs.ldgPrv.creditAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</b></td>
      <c:if test="${rvs.ldgPrv.balanceAcc.compareTo(java.math.BigDecimal.ZERO) eq -1}">
        <c:set var="blnPrv">
          <span class='rdBlnc'>${numStr.frmt(rvs.ldgPrv.balanceAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</span>
        </c:set>
      </c:if>
      <c:if test="${rvs.ldgPrv.balanceAcc.compareTo(java.math.BigDecimal.ZERO) ne -1}">
        <c:set var="blnPrv" value="${numStr.frmt(rvs.ldgPrv.balanceAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}"/>
      </c:if>
      <td class="total"><b>${blnPrv}</b></td>
    </tr>
    <c:forEach var="ldgDeLn" items="${rvs.ldgDe.lns}">
      <c:set var="subAccAppear" value=""/>
      <c:if test="${empty param.saNm && ldgDeLn.subacc != null}">
        <c:if test="${ldgDeLn.blncSa.compareTo(java.math.BigDecimal.ZERO) eq -1}">
          <c:set var="blnSa">
            <span class='rdBlnc'>${ldgDeLn.blncSa}</span>
          </c:set>
        </c:if>
        <c:if test="${ldgDeLn.blncSa.compareTo(java.math.BigDecimal.ZERO) ne -1}">
          <c:set var="blnSa" value="${ldgDeLn.blncSa}"/>
        </c:if>
        <c:set var="subAccAppear" value="${ldgDeLn.subacc}, ${blnSa},"/>
      </c:if>
      <tr>
        <td><fmt:formatDate value="${ldgDeLn.dat}" type="both" timeStyle="short"/></td>
        <td>${subAccAppear} ${ldgDeLn.dscr}</td>
        <td>${ldgDeLn.crAcNm}
          <c:if test="${not empty ldgDeLn.crSaNm}">- ${ldgDeLn.crSaNm}</c:if>
        </td>
        <td class="debt-cred">${numStr.frmt(ldgDeLn.debt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
        <td class="debt-cred">${numStr.frmt(ldgDeLn.cred.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
        <c:if test="${ldgDeLn.blnc.compareTo(java.math.BigDecimal.ZERO) eq -1}">
          <c:set var="blnLn">
            <span class='rdBlnc'>${numStr.frmt(ldgDeLn.blnc,rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</span>
          </c:set>
        </c:if>
        <c:if test="${ldgDeLn.blnc.compareTo(java.math.BigDecimal.ZERO) ne -1}">
          <c:set var="blnLn" value="${numStr.frmt(ldgDeLn.blnc,rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}"/>
        </c:if>
        <td class="debt-cred">${blnLn}</td>
      </tr>
    </c:forEach>
    <c:if test="${empty param.saNm}">
      <c:forEach var="ky" items="${rvs.ldgDe.saDbTo.keySet()}">
        <tr>
          <td colspan="3" class="total">${ky}:</td>
          <td class="total">${numStr.frmt(rvs.ldgDe.saDbTo[ky].toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
          <td class="total">${numStr.frmt(rvs.ldgDe.saCrTo[ky].toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
          <c:if test="${rvs.ldgDe.saBlnTo[ky].compareTo(java.math.BigDecimal.ZERO) eq -1}">
            <c:set var="blnSaEnd">
              <span class='rdBlnc'>${numStr.frmt(rvs.ldgDe.saBlnTo[ky].toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</span>
            </c:set>
          </c:if>
          <c:if test="${rvs.ldgDe.saBlnTo[ky].compareTo(java.math.BigDecimal.ZERO) ne -1}">
            <c:set var="blnSaEnd" value="${numStr.frmt(rvs.ldgDe.saBlnTo[ky].toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}"/>
          </c:if>
          <td class="total">${blnSaEnd}</td>
        </tr>
      </c:forEach>
    </c:if>
    <tr>
      <td colspan="3" class="total"><b>${i18n.getMsg("tot", rvs.upf.lng.iid)}:</b></td>
      <td class="total"><b>${numStr.frmt(rvs.ldgDe.debitAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)} ${rvs.astg.curr.nme}</b></td>
      <td class="total"><b>${numStr.frmt(rvs.ldgDe.creditAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)} ${rvs.astg.curr.nme}</b></td>
      <c:if test="${rvs.ldgDe.balanceAcc.compareTo(java.math.BigDecimal.ZERO) eq -1}">
        <c:set var="blnEnd">
          <span class='rdBlnc'>${numStr.frmt(rvs.ldgDe.balanceAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</span>
        </c:set>
      </c:if>
      <c:if test="${rvs.ldgDe.balanceAcc.compareTo(java.math.BigDecimal.ZERO) ne -1}">
        <c:set var="blnEnd" value="${numStr.frmt(rvs.ldgDe.balanceAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}"/>
      </c:if>
      <td class="total"><b>${blnEnd} ${rvs.astg.curr.nme}</b></td>
    </tr>
  </table>
</body>
</html>
