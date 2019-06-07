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
  <title>${i18n.getMsg("trial_balance", rvs.upf.lng.iid)} <fmt:formatDate value="${rvs.blnDt}"/></title>
</head>
<body>
  <div style="text-align: center;">
    <h4>
      ${i18n.getMsg("trial_balance", rvs.upf.lng.iid)} <fmt:formatDate value="${rvs.blnDt}" type="both" dateStyle="LONG" timeStyle="SHORT"/> <br>
      ${rvs.as.org}
    </h4>
  </div>
  <table>
    <tr>
      <th colspan="2" align="left">${i18n.getMsg("Acnt", rvs.upf.lng.iid)}</th>
      <th class="debt-cred-th">${i18n.getMsg("debt", rvs.upf.lng.iid)}</th>
      <th class="debt-cred-th">${i18n.getMsg("cred", rvs.upf.lng.iid)}</th>
    </tr>
    <c:set var="accCurr" value=""/>
    <c:set var="debtTotal" value="0"/>
    <c:set var="credTotal" value="0"/>
    <c:forEach var="blLn" items="${rvs.blnLns}">
      <tr>
        <td>
          <c:if test="${blLn.acNm != accCurr}">
            <c:set var="accCurr" value="${blLn.acNm}"/>
            ${blLn.acNm}
            ${blLn.acNm}
          </c:if>
        </td>
        <td>
          ${blLn.saNm}</td>
        <td class="debt-cred">${numStr.frmt(blLn.debt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)}</td>
        <td class="debt-cred">${numStr.frmt(blLn.cred.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)}</td>
      </tr>
      <c:set var="debtTotal" value="${blLn.debt + debtTotal}"/>
      <c:set var="credTotal" value="${blLn.cred + credTotal}"/>
    </c:forEach>
    <tr>
      <td colspan="2" class="total"><b>${i18n.getMsg("itsTotal", rvs.upf.lng.iid)}:</b></td>
      <td class="total"><b>${numStr.frmt(debtTotal.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)} ${rvs.as.curr.nme}</b></td>
      <td class="total"><b>${numStr.frmt(credTotal.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)} ${rvs.as.curr.nme}</b></td>
    </tr>
  </table>

</body>
</html>
