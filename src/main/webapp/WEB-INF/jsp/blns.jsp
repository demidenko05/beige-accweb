<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/bsPrn.css" />
  <link rel="icon" type="image/png" href="../img/favicon.png">
  <title>${i18n.getMsg("balance_sheet", rvs.upf.lng.iid)} <fmt:formatDate value="${rvs.blnSht.dat}" type="date" dateStyle="LONG"/></title>
</head>
<body>
  <div style="text-align: center;">
    <h4>
      ${rvs.as.org} <br>
      ${i18n.getMsg("balance_sheet", rvs.upf.lng.iid)} <br>
      <fmt:formatDate value="${rvs.blnSht.dat}" type="date" dateStyle="LONG"/>
     </h4>
  </div>
  <table>
    <tr>
      <td colspan="2"><b>${i18n.getMsg("AssetsTitle", rvs.upf.lng.iid)}</b></th>
      <td colspan="2"><b>${i18n.getMsg("LiabilitiesTitle", rvs.upf.lng.iid)}</b></th>
    </tr>
    <c:forEach var="currIdx" begin="1" end="${rvs.blnSht.detRc}">
      <tr>
        <c:if test="${currIdx le rvs.blnSht.toLnAs}">
          <td>
            ${rvs.blnSht.lns.get(currIdx - 1).accName}
          </td>
          <td align="right">
            <c:if test="${rvs.blnSht.lns.get(currIdx - 1).debit.doubleValue() != 0}">
              ${numStr.frmt(rvs.blnSht.lns.get(currIdx - 1).debit.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)}
            </c:if>
            <c:if test="${rvs.blnSht.lns.get(currIdx - 1).credit.doubleValue() != 0}">
              (${numStr.frmt(rvs.blnSht.lns.get(currIdx - 1).credit.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)})
            </c:if>
          </td>
        </c:if>
        <c:if test="${currIdx gt rvs.blnSht.toLnAs}">
          <td></td>
          <td></td>
        </c:if>

        <c:if test="${currIdx le rvs.blnSht.toLnLi}">
          <td>
            ${rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 1).accName}
          </td>
          <td align="right">
            <c:if test="${rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 1).credit.doubleValue() != 0}">
              ${numStr.frmt(rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 1).credit.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)}
            </c:if>
            <c:if test="${rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 1).debit.doubleValue() != 0}">
              (${numStr.frmt(rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 1).debit.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)})
            </c:if>
          </td>
        </c:if>
        <c:if test="${currIdx == rvs.blnSht.toLnLi + 1}">
          <td align="center"><b>${i18n.getMsg("total_l", rvs.upf.lng.iid)}</b></td>
          <td align="right"><b>${numStr.frmt(rvs.blnSht.totLia.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)}</b></td>
        </c:if>
        <c:if test="${currIdx == rvs.blnSht.toLnLi + 2}">
          <td colspan="2"><b>${i18n.getMsg("OwnersEquityTitle", rvs.upf.lng.iid)}</b></td>
        </c:if>
        <c:if test="${(currIdx gt rvs.blnSht.toLnLi + 2) && (currIdx lt rvs.blnSht.toLnLi + rvs.blnSht.totalLinesOwnersEquity + 3)}">
          <td>
            ${rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 3).accName}
          </td>
          <td align="right">
            <c:if test="${rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 3).credit.doubleValue() != 0}">
              ${numStr.frmt(rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 3).credit.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)}
            </c:if>
            <c:if test="${rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 3).debit.doubleValue() != 0}">
              (${numStr.frmt(rvs.blnSht.lns.get(rvs.blnSht.toLnAs + currIdx - 3).debit.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)})
            </c:if>
          </td>
        </c:if>
        <c:if test="${currIdx == rvs.blnSht.toLnLi + rvs.blnSht.totalLinesOwnersEquity + 3}">
          <td align="center"><b>${i18n.getMsg("total_oe", rvs.upf.lng.iid)}</b></td>
          <td align="right"><b>${numStr.frmt(rvs.blnSht.totOwe.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)}</b></td>
        </c:if>
        <c:if test="${currIdx gt rvs.blnSht.toLnLi + rvs.blnSht.totalLinesOwnersEquity + 3}">
          <td></td>
          <td></td>
        </c:if>
      </tr>
    </c:forEach>
    <tr>
      <td align="center"><b>${i18n.getMsg("total_assets", rvs.upf.lng.iid)}</b></td>
      <td align="right"><b>${numStr.frmt(rvs.blnSht.totAss.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)} ${rvs.as.curr.nme}</b></td>
      <td align="center"><b>${i18n.getMsg("total_l_oe", rvs.upf.lng.iid)}</b></td>
      <td align="right"><b>${numStr.frmt(rvs.blnSht.totLia.add(rvs.blnSht.totOwe).toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.as.rpDp,rvs.upf.dgInGr)} ${rvs.as.curr.nme}</b></td>
    </tr>
  </table>
</body>
</html>
