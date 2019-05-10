<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="shortcut icon" href="../img/favicon.png">
  <script type="text/javascript" src="../js/bsFrm.js"></script>
  <script type="text/javascript" src="../js/bsI18n${rvs.upf.lng.iid}.js"></script>
  <link rel="stylesheet" href="../css/bsCmn.css">
  <title>${i18n.getMsg("mngDatabase", rvs.upf.lng.iid)}</title>
</head>
<body>
  <br>
  <a class="btn" href="../" style="margin: 1rem;">${i18n.getMsg("home", rvs.upf.lng.iid)}</a>
  <c:if test="${not empty ourPublicKeyStr && not empty foreignPublicKeyStr}">
    <c:set var="encryptq" value="${i18n.getMsg('encrypt_log_files', rvs.upf.lng.iid)}"/>
    <c:set var="decryptq" value="${i18n.getMsg('decrypt_log_files', rvs.upf.lng.iid)}"/>
    <div style="text-align: center; margin: 1rem;">
      <a class="btn" href="?prc=PrcMngDb&act=encryptLogs" onclick="bsCnfHref(this, '${encryptq}?'); return false;">${i18n.getMsg("encrypt_log_files", rvs.upf.lng.iid)}</a>
      <br><br>
      <a class="btn" href="?prc=PrcMngDb&act=decryptLogs" onclick="bsCnfHref(this, '${decryptq}?'); return false;">${i18n.getMsg("decrypt_log_files", rvs.upf.lng.iid)}</a>
    </div>
  </c:if>
  <div style="text-align: center; margin-top: 1rem; margin-bottom: 1rem;">
    <h4>${i18n.getMsg("curr_db", rvs.upf.lng.iid)}: ${currDb}</h4>
      <table>
      <tr>
        <th style="padding: .4rem;">${i18n.getMsg("database", rvs.upf.lng.iid)}</th>
        <th style="padding: .4rem; width: 40%;">${i18n.getMsg("actions", rvs.upf.lng.iid)}</th>
      </tr>
      <c:set var="changeq" value="${i18n.getMsg('change_db_curr', rvs.upf.lng.iid)}"/>
      <c:set var="backupq" value="${i18n.getMsg('backup', rvs.upf.lng.iid)}"/>
      <c:set var="delq" value="${i18n.getMsg('Delete', rvs.upf.lng.iid)}"/>
      <c:forEach var="database" items="${databases}">
        <tr>
          <td style="padding: .4rem;">
            ${database}.sqlite
          </td>
          <td style="padding: 1rem;">
            <a class="btn" href="?prc=PrcMngDb&act=change&dbNm=${database}" onclick="bsCnfHref(this, '${changeq}?'); return false;">${i18n.getMsg("change_db_curr", rvs.upf.lng.iid)}</a>
            <br><br>
            <c:if test="${not empty ourPublicKeyStr && not empty foreignPublicKeyStr}">
              <a class="btn" href="?prc=PrcMngDb&act=backup&dbNm=${database}" onclick="bsCnfHref(this, '${backupq}?'); return false;">${i18n.getMsg("backup", rvs.upf.lng.iid)}</a>
              <br><br>
            </c:if>
            <a class="btn" href="?prc=PrcMngDb&act=delete&dbNm=${database}" onclick="bsCnfHref(this, '${delq}?'); return false;">${i18n.getMsg("Delete", rvs.upf.lng.iid)}</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>

  <c:set var="restoreq" value="${i18n.getMsg('restore', rvs.upf.lng.iid)}"/>
  <div style="text-align: center; margin-bottom: 1rem;">
    <h4>${i18n.getMsg("backuped_db", rvs.upf.lng.iid)} in ${backupDir}:</h4>
      <table>
      <tr>
        <th style="padding: .4rem;">${i18n.getMsg("database", rvs.upf.lng.iid)}</th>
        <th style="padding: .4rem;">${i18n.getMsg("actions", rvs.upf.lng.iid)}</th>
      </tr>
      <c:forEach var="database" items="${bkDatabases}">
        <tr>
          <td style="padding: .4rem;">
            ${database}.sqlten
          </td>
          <c:if test="${not empty ourPublicKeyStr && not empty foreignPublicKeyStr}">
            <td style="padding: 1rem;">
              <a class="btn" href="?prc=PrcMngDb&act=restore&dbNm=${database}" onclick="bsCnfHref(this, '${restoreq}?'); return false;">${i18n.getMsg("restore", rvs.upf.lng.iid)}</a>
            </td>
          </c:if>
        </tr>
      </c:forEach>
    </table>
  </div>

  <div style="border: solid 1px;">
    <div class="dialog-title">
      ${i18n.getMsg("create_db_curr", rvs.upf.lng.iid)}
    </div>
    <form method="post">
      <input type="hidden" name="act" value="create">
      <input type="hidden" name="prc" value="PrcMngDb">
      <table class="tbl-fieldset">
        <tr>
          <td>
            <label>${i18n.getMsg("create_label", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <div style="display: flex;">
              <input name="dbNm" value="dbmy">.sqlite
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label>${i18n.getMsg("idDatabase", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <div style="display: flex;">
              <input type="number" name="dbId" value="2">
            </div>
          </td>
        </tr>
      </table>
      <div style="text-align: center;">
        <input class="btn" type="submit" onclick="bsCnfSbm(this, 'Create?'); return false;"/>
      </div>
    </form>
  </div>

  <div style="margin: 1rem;">
    <c:if test="${not empty ourPublicKeyStr}">
      ${i18n.getMsg("ourPublicKey", rvs.upf.lng.iid)}:
      <br>
      <div class="pubKeyStr">
        ${ourPublicKeyStr}
      </div>
    </c:if>
  </div>
  <div style="margin: 1rem;">
    <c:if test="${not empty foreignPublicKeyStr}">
      ${i18n.getMsg("foreignPublicKey", rvs.upf.lng.iid)}:
      <br>
      <div class="pubKeyStr">
        ${foreignPublicKeyStr}
      </div>
    </c:if>
  </div>

  <dialog id="dlgCnf" class="dlg dlg-alert">
      <div class="confirm">
        <div class="dialog-title confirm-title">
          ${i18n.getMsg("Conformation", rvs.upf.lng.iid)}.
          <button onclick="document.getElementById('dlgCnf').close();" class="btn-close btn-confirm">x</button>
        </div>
        <div id="confirmPlace" class="msg-place">
        </div>
        <div class="dlg-actions">
          <button id="confirmYes" class="btn btn-act btn-confirm">${i18n.getMsg("Yes", rvs.upf.lng.iid)}</button>
          <button onclick="document.getElementById('dlgCnf').close();" class="btn btn-act btn-confirm">${i18n.getMsg("No", rvs.upf.lng.iid)}</button>
        </div>
     </div>
  </dialog>

</body>
</html>

