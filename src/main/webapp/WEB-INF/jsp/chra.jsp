<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/bsPrn.css" />
  <link rel="icon" type="image/png" href="../static/img/favicon.png">
  <title>${i18n.getMsg("chartOfAccounts", rvs.upf.lng.iid)}</title>
</head>
<body>
  <div style="text-align: center;">
    <h4>
      ${i18n.getMsg("chartOfAccounts", rvs.upf.lng.iid)} <br></br>
      ${rvs.astg.org}
    </h4>
  </div>
  <table>
    <tr>
      <th>${i18n.getMsg("iid", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("nmbr", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("nme", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("subacc", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("blTy", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("typ", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("dscr", rvs.upf.lng.iid)}</th>
    </tr>
    <c:forEach var="acc" items="${rvs.accs}">
      <tr>
        <td>
          ${acc.iid}
        </td>
        <td>
          ${acc.nmbr}
        </td>
        <td>
          ${acc.nme}
        </td>
        <td>
          <c:if test="${not empty acc.sacntId}">
            (${acc.sacntId}) ${acc.subacc}
          </c:if>
        </td>
        <td>
          <c:if test="${not empty acc.blTy}">
            ${i18n.getMsg(acc.blTy, rvs.upf.lng.iid)}
          </c:if>
        </td>
        <td>
          <c:if test="${not empty acc.typ}">
            ${i18n.getMsg(acc.typ, rvs.upf.lng.iid)}
          </c:if>
        </td>
        <td>
          ${acc.dscr}
        </td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
