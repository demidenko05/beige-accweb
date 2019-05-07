<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Clear current database then get identical copy of another one</title>
  <link rel="stylesheet" href="../css/bsCmn.css">
  <link rel="icon" type="image/png" href="../img/favicon.png">
</head>
<body style="padding: 20px;">
  <a class="btn" href="../">${i18n.getMsg("home", rvs.upf.lng.iid)}</a>
  <div class="form-std form-70-33"  style="top: initial;">
    <div class="dialog-title">
      ${i18n.getMsg("get_db_copy", rvs.upf.lng.iid)}
    </div>
    <form method="post" action="txt">
      <table class="tbl-fieldset">
        <tr>
          <td>
            <label>${i18n.getMsg("usr", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <div style="display: flex;">
              <input name="usr" value="">
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label>${i18n.getMsg("pwd", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <div style="display: flex;">
              <input type="password" name="pwd" value="">
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label>${i18n.getMsg("url_source", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <div style="display: flex;">
              <b>https://</b> <input name="urlSrc" value="localhost:8443/beige-web/adm/xml">
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label>${i18n.getMsg("max_records_per_transaction", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <div style="display: flex;">
              <input type="number" name="maxRecs" value="100">
              <input type="hidden" name="prc" value="DbImp">
              <input type="hidden" name="prcExp" value="DbExp">
            </div>
          </td>
        </tr>
      </table>
      <div>
        <c:set var="cdagcMsg" value="${i18n.getMsg('clear_db_and_get_copy', rvs.upf.lng.iid)}"/>
        <input type="submit" onclick="msCnfSbm(this, '${cdagcMsg}'); return false;"/>
      </div>
    </form>
  </div>
</body>
</html>
