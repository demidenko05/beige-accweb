<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="infDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg('About', rvs.upf.lng.iid)}
      <button onclick="bsClsDlg('infDlg')" class="btn-close">x</button>
    </div>
    <table class="tbl-fieldset">
      <tr>
        <td>
          <label>${i18n.getMsg("dbId", rvs.upf.lng.iid)}:</label>
        </td>
        <td>
          ${rvs.dbInf.dbId}
        </td>
      </tr>
      <tr>
        <td>
          <label>${i18n.getMsg("dbVr", rvs.upf.lng.iid)}:</label>
        </td>
        <td>
          ${rvs.dbInf.dbVr}
        </td>
      </tr>
      <tr>
        <td>
          <label>${i18n.getMsg("dscr", rvs.upf.lng.iid)}:</label>
        </td>
        <td>
          ${rvs.dbInf.inf}
        </td>
      </tr>
      <tr>
        <td>
          <label>${i18n.getMsg("appVer", rvs.upf.lng.iid)}:</label>
        </td>
        <td>
          ${rvs.appVer}
        </td>
      </tr>
      <tr>
        <td><a href="https://sites.google.com/site/beigesoftware" target="_blank">Beigesoft™</a></td>
      </tr>
    </table>
    <div class="form-actions">
      <button type="button" class="btn" onclick="bsClsDlg('infDlg');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
    </div>
  </div>
</dialog>
