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
          ${i18n.getMsg("totalUpdatedGdSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedGdSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedGdAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedGdAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedGdPr", rvs.upf.lng.iid)}:
        </td>
        <td>
            ${totalUpdatedGdPr}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedServSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedServSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedServAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedServAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedServPr", rvs.upf.lng.iid)}:
        </td>
        <td>
            ${totalUpdatedServPr}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedSeGoodSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedSeGoodSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedSeGoodAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedSeGoodAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedSeGoodPr", rvs.upf.lng.iid)}:
        </td>
        <td>
            ${totalUpdatedSeGoodPr}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedSeServiceSp", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedSeServiceSp}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedSeServiceAv", rvs.upf.lng.iid)}:
        </td>
        <td>
          ${totalUpdatedSeServiceAv}
        </td>
      </tr>
      <tr>
        <td>
          ${i18n.getMsg("totalUpdatedSeServicePr", rvs.upf.lng.iid)}:
        </td>
        <td>
            ${totalUpdatedSeServicePr}
        </td>
      </tr>
    </table>
  </p>
</body>
</html>
