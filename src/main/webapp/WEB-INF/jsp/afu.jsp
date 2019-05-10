<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="shortcut icon" href="img/favicon.png">
  <link rel="stylesheet" href="css/bsCmn.css" />
  <title>Beigesoft ™ Accounting All In One</title>
</head>
<body>

<div style="padding: 20px;">
  ${i18n.getMsg("add_first_user_rules", rvs.upf.lng.iid)}
  <c:if test="${not empty errMsg}">
    <b style="color: red;">${i18n.getMsg(errMsg, rvs.upf.lng.iid)}</b>
  </c:if>
</div>

<div class="form-std form-70-33"  style="top: initial;">
  <div class="dialog-title">
    ${i18n.getMsg("add_first_user", rvs.upf.lng.iid)}
  </div>
  <form method="post">
    <table class="tbl-fieldset">
      <tr>
        <td>
          <label>${i18n.getMsg("user_name", rvs.upf.lng.iid)}:</label>
        </td>
        <td>
          <div style="display: flex;">
            <input required name="usr" value="">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <label>${i18n.getMsg("user_pass", rvs.upf.lng.iid)}:</label>
        </td>
        <td>
          <div style="display: flex;">
            <input type="password" required name="pwd" value="">
          </div>
        </td>
      </tr>
      <tr>
        <td>
          <label>${i18n.getMsg("user_pass_rep", rvs.upf.lng.iid)}:</label>
        </td>
        <td>
          <div style="display: flex;">
            <input type="password" required name="pwdc" value="">
          </div>
        </td>
      </tr>
    </table>
    <div>
      <input type="submit"/>
    </div>
  </form>
</div>

</body>
</html>
