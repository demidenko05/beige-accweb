<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/bsPrn.css" />
  <link rel="stylesheet" type="text/css" href="../css/bsPrnAc.css" />
  <link rel="icon" type="image/png" href="../img/favicon.png">
  <title>${i18n.getMsg("RefreshItemsInList", rvs.upf.lng.iid)} <fmt:formatDate value="${now}" type="both" timeStyle="short"/></title>
</head>
<body>
  <div style="text-align: center;">
    <h4>
      ${i18n.getMsg("RefreshItemsInList", rvs.upf.lng.iid)} <fmt:formatDate value="${now}" type="both" timeStyle="short"/><br></br>
      ${rvs.astg.org}
    </h4>
  </div>
  <p>
    <table>
      <tr>
        <td>
          ${i18n.getMsg("totUpdGdSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdGdSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdGdAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdGdAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdGdPr", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdGdPr}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdServSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdServSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdServAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdServAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdServPr", rvs.upf.lng.iid)}:
        </td>
        <td>
            ${rvs.totUpdServPr}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdSeGoodSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdSeGoodSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdSeGoodAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdSeGoodAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdSeGoodPr", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdSeGoodPr}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdSeSrvSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdSeSrvSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdSeSrvAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdSeSrvAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totUpdSeSrvPr", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${rvs.totUpdSeSrvPr}
        </td>
      </tr>
    </table>
  </p>
</body>
</html>
