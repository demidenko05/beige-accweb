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
      ${i18n.getMsg("Ledger", rvs.upf.lng.iid)} ${i18n.getMsg("from", rvs.upf.lng.iid)} <fmt:formatDate value="${rvs.dt1}"/>
      ${i18n.getMsg("to", rvs.upf.lng.iid)} <fmt:formatDate value="${rvs.dt2}"/> <br>
      ${rvs.astg.org} <br>
      ${i18n.getMsg("acnt", rvs.upf.lng.iid)}: ${param.accNm.nme}
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
      <th class="debt-cred-th">${i18n.getMsg("Debit", rvs.upf.lng.iid)}</th>
      <th class="debt-cred-th">${i18n.getMsg("Credit", rvs.upf.lng.iid)}</th>
      <th class="debt-cred-th">${i18n.getMsg("Balance", rvs.upf.lng.iid)}</th>
    </tr>
    <c:if test="${param.saNm == null && param.accNm.saTy != null}">
      <c:forEach var="enr" items="${ldgPrv.lnsMp}">
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
      <td class="total"><b>${numStr.frmt(ldgPrv.debtAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</b></td>
      <td class="total"><b>${numStr.frmt(ldgPrv.credAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</b></td>
      <td class="total"><b>${numStr.frmt(ldgPrv.balanceAcc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</b></td>
    </tr>
    <c:forEach var="ldgDeLn" items="${ldgDe.lns}">
      <c:set var="subAccAppear" value=""/>
      <c:if test="${param.saNm == null && param.accNm.saTy != null}">
        <c:set var="subAccAppear" value="${ldgDeLn.subacc}, ${ldgDeLn.blncSa.add(ldgPrv.lnsMp[ldgDeLn.subacc].blnc)},"/>
      </c:if>
      <tr>
        <td><fmt:formatDate value="${ldgDeLn.dat}" type="both" timeStyle="short"/></td>
        <td>${subAccAppear} ${ldgDeLn.dscr}</td>
        <td>${ldgDeLn.crAcNm}
          <c:if test="${not empty ldgDeLn.crSaNm}">
            - ${ldgDeLn.crSaNm}
          </c:if>
        </td>
        <td class="debt-cred">${numStr.frmt(ldgDeLn.debt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
        <td class="debt-cred">${numStr.frmt(ldgDeLn.cred.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
        <td class="debt-cred">${numStr.frmt(ldgDeLn.blnc.add(ldgPrv.balanceAcc).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
      </tr>
    </c:forEach>
    <c:if test="${param.saNm == null && param.accNm.saTy != null}">
      <c:forEach var="enr" items="${ldgPrv.lnsMp}">
        <tr>
          <td colspan="3" class="total">${enr.key}:</td>
          <td class="total">${numStr.frmt(enr.value.debt.add(ldgDe.saDbTo[enr.key]).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
          <td class="total">${numStr.frmt(enr.value.cred.add(ldgDe.saCrTo[enr.key]).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
          <td class="total">${numStr.frmt(enr.value.blnc.add(ldgDe.saBlnTo[enr.key]).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)}</td>
        </tr>
      </c:forEach>
    </c:if>
    <tr>
      <td colspan="3" class="total"><b>${i18n.getMsg("tot", rvs.upf.lng.iid)}:</b></td>
      <td class="total"><b>${numStr.frmt(ldgPrv.debtAcc.add(ldgDe.debtAcc).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)} ${rvs.astg.curr.nme}</b></td>
      <td class="total"><b>${numStr.frmt(ldgPrv.credAcc.add(ldgDe.credAcc).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)} ${rvs.astg.curr.nme}</b></td>
      <td class="total"><b>${numStr.frmt(ldgPrv.balanceAcc.add(ldgDe.balanceAcc).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.rpDp,rvs.upf.dgInGr)} ${rvs.astg.curr.nme}</b></td>
    </tr>
  </table>
</body>
</html>
