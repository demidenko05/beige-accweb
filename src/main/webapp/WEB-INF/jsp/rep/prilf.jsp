<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date" />
<dialog id="frmRepDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("priceList", rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('frmRep')" class="btn-close">x</button>
    </div>
    <form id="frmRepFrm" action="csv" method="GET" target="_blank">
      <input type="hidden" name="fileNm" value="priceList${srvDt.toDdMmYy(now)}">
      <table class="tbl-fieldset">
        <tr>
          <td>
            <label for="priCt">${i18n.getMsg("priCt", rvs.upf.lng.iid)}</label>
          </td>
          <td>
            <div class="input-line">
              <input class="picked-appearence" id="priCtApVsb" disabled="disabled" type="text" onchange="bsInpChn(this);">
              <input id="priCtId" type="hidden" name="priCt">
              <button type="button" class="btn" onclick="bsPick('PriCt','', 'priCt', '&mbl=${param.mbl}');">...</button>
              <button type="button" class="btn" onclick="bsClrSelEnt('priCt');">X</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label for="CsvMth">${i18n.getMsg("CsvMth", rvs.upf.lng.iid)}</label>
          </td>
          <td>
            <div class="input-line">
              <input class="picked-appearence" id="CsvMthApVsb" disabled="disabled" type="text" onchange="bsInpChn(this);">
              <input id="CsvMthId" type="hidden" name="CsvMth">
              <button type="button" class="btn" onclick="bsPick('CsvMth','', 'CsvMth', '&mbl=${param.mbl}');">...</button>
              <button type="button" class="btn" onclick="bsClrSelEnt('CsvMth');">X</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label for="unAvPri">${i18n.getMsg("unAvPri", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <input type="text" class="bsNum${rvs.astg.prDp}" name="unAvPri" onchange="bsInpChn(this);"/> 
          </td>
        </tr>
        <tr>
          <td>
            <label for="optmQuan">${i18n.getMsg("optmQuan", rvs.upf.lng.iid)}:</label>
          </td>
          <td>
            <input type="text" class="bsNum0" name="optmQuan" onchange="bsInpChn(this);"/> 
          </td>
        </tr>
      </table>
      <div class="form-actions">
        <button type="button" onclick="bsSbFrmNw('frmRepFrm', false);">${i18n.getMsg("Report", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('frmRep');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
