<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
  <script type="text/javascript" src="../js/bsNum.js"></script>
  <script type="text/javascript" src="../js/bsInpNum.js"></script>
  <script type="text/javascript" src="../js/bsAjax.js"></script>
  <script type="text/javascript" src="../js/bsForm.js"></script>
  <script type="text/javascript" src="../js/bsAcc.js"></script>
  <script type="text/javascript" src="../js/bsI18n${rvs.upf.lng.iid}.js"></script>
  <link rel="stylesheet" href="../css/bsCmn.css" />
  <link rel="icon" type="image/png"  href="../img/favicon.png">
  <title>${i18n.getMsg("app_name", rvs.upf.lng.iid)}</title>
</head>
<body>

  <div class="navbar">
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("CatGs", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmCtl&pg=1');">${i18n.getMsg("ItmCtls", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmPlc&pg=1');">${i18n.getMsg("ItmPlcs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SrvCtl&pg=1');">${i18n.getMsg("SrvCtls", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SrvPlc&pg=1');">${i18n.getMsg("SrvPlcs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=CatGs&pg=1');">${i18n.getMsg("CatGss", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SubCat&pg=1');">${i18n.getMsg("SubCats", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PicPlc&pg=1');">${i18n.getMsg("PicPlcs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SeItmCtl&pg=1');">${i18n.getMsg("SeItmCtl", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SeSrvCtl&pg=1');">${i18n.getMsg("SeSrvCtl", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SeSel&pg=1');">${i18n.getMsg("SeSel", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18CatGs&pg=1');">${i18n.getMsg("I18CatGss", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("ItmSp", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmSpf&pg=1');">${i18n.getMsg("ItmSpfs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SrvSpf&pg=1');">${i18n.getMsg("SrvSpfs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmSp&pg=1');">${i18n.getMsg("ItmSps", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmSpGr&pg=1');">${i18n.getMsg("ItmSpGrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Htmlt&pg=1');">${i18n.getMsg("Htmlts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ChoSpTy&pg=1');">${i18n.getMsg("ChoSpTys", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ChoSp&pg=1');">${i18n.getMsg("ChoSps", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18ChoSp&pg=1');">${i18n.getMsg("I18ChoSps", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18ItmSpGr&pg=1');">${i18n.getMsg("I18ItmSpGrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18ItmSp&pg=1');">${i18n.getMsg("I18ItmSps", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("Pricing", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PriSrv&pg=1');">${i18n.getMsg("PriSrvs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PriItm&pg=1');">${i18n.getMsg("PriItms", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=BurPric&pg=1');">${i18n.getMsg("BurPrics", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Buyer&pg=1');">${i18n.getMsg("Buyers", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'ntr?rnd=prilj');">${i18n.getMsg("priceList", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PriCt&pg=1');">${i18n.getMsg("PriCts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=CurrRt&pg=1');">${i18n.getMsg("CurrRts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=CuOr&pg=1');">${i18n.getMsg("CuOrs", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("Common", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=TrdStg&pg=1');">${i18n.getMsg("TrdStg", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=AddStg&pg=1');">${i18n.getMsg("AddStg", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=RplAcc&pg=1');">${i18n.getMsg("RplAccs", rvs.upf.lng.iid)}</a>
        <a href="ntr?rnd=acimp" target="_blank">${i18n.getMsg("import_acc", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Deliv&pg=1');">${i18n.getMsg("Delivs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PayMd&pg=1');">${i18n.getMsg("PayMds", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18Trd&pg=1');">${i18n.getMsg("I18Trds", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">...</a>
      <div class="dropdown-content">
        <a href="../">${i18n.getMsg("Home", rvs.upf.lng.iid)}</a>
        <a href="srv">${i18n.getMsg("Refresh", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=EmCon&pg=1');">${i18n.getMsg("EmCons", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=EmAdr&pg=1');">${i18n.getMsg("EmAdrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=EmMsg&pg=1');">${i18n.getMsg("EmMsgs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=UsTmc&pg=1');">${i18n.getMsg("UsTmc", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=UsRlTmc&pg=1');">${i18n.getMsg("UsRlTmcs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsOpnDlg('dlgI18n');">${i18n.getMsg("changeUsPrf", rvs.upf.lng.iid)}</a>
        <a href="ntr?prc=RefrCat" target="_blank">${i18n.getMsg("RefreshCatalog", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'ntr?rnd=rflsj');">${i18n.getMsg("RefreshItemsInList", rvs.upf.lng.iid)}</a>
        <c:if test="${not empty pageContext['request'].userPrincipal}">
          <a href="../?logoff=true">${pageContext['request'].userPrincipal.name} Logout</a>
        </c:if>
      </div>
    </div>
  </div>  

  <div id="lstMnPl">
  </div>
  
  <div id="frmMnPl">
  </div>

  <div id="frmSbPl">
  </div>

  <div id="pisPl">
  </div>

  <div id="pisPlD">
  </div>

  <div id="trgInf">
  </div>

  <div id="frmRep">
  </div>

  <dialog id="dlgCnf" class="dlg dlg-alert">
      <div class="confirm">
        <div class="dialog-title confirm-title">
          ${i18n.getMsg("Conformation", rvs.upf.lng.iid)}.
          <button onclick="document.getElementById('dlgCnf').close();" class="btn-close btn-confirm">x</button>
        </div>
        <div id="cnfPl" class="msg-place">
        </div>
        <div class="dlg-actions">
          <button id="cnfYes" class="btn btn-act btn-confirm">${i18n.getMsg("Yes", rvs.upf.lng.iid)}</button>
          <button onclick="document.getElementById('dlgCnf').close();" class="btn btn-act btn-confirm">${i18n.getMsg("No", rvs.upf.lng.iid)}</button>
        </div>
     </div>
  </dialog>

  <dialog id="dlgI18n" class="dlg dlg-alert">
      <div class="confirm">
        <div class="dialog-title confirm-title">
          ${i18n.getMsg("changeUsPrf", rvs.upf.lng.iid)}
          <button onclick="document.getElementById('dlgI18n').close();" class="btn-close btn-confirm">x</button>
        </div>
        <form id="lngPrefFrm" action="?" method="POST">
          <div>
            <table class="tbl-fieldset">
              <tbody>
                <tr>
                  <td>
                    <label>${i18n.getMsg("pgSz", rvs.upf.lng.iid)}</label>
                  </td>
                  <td>
                    <div class="input-line">
                      <input type="number" name ="pgSz" value="${rvs.cpf.pgSz}" onchange="bsInpChn(this);">
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <label>${i18n.getMsg("lng", rvs.upf.lng.iid)}</label>
                  </td>
                  <td>
                    <div class="input-line">
                      <select name="lng" onchange="bsInpChn(this);">
                        <c:forEach var="it" items="${rvs.lngs}">
                          <c:set var="itmSel" value=""/>
                          <c:if test="${rvs.upf.lng.iid eq it.iid}">
                            <c:set var="itmSel" value="selected"/>
                          </c:if>
                          <option value="${it.iid}" ${itmSel}>${it.nme}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <label>${i18n.getMsg("dcSp", rvs.upf.lng.iid)}</label>
                  </td>
                  <td>
                    <div class="input-line">
                      <select name="dcSp" onchange="bsInpChn(this);">
                        <c:forEach var="it" items="${rvs.dcSps}">
                          <c:set var="itmSel" value=""/>
                          <c:if test="${rvs.upf.dcSp.iid eq it.iid}">
                            <c:set var="itmSel" value="selected"/>
                          </c:if>
                          <option value="${it.iid}" ${itmSel}>${i18n.getMsg(it.nme)}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <label>${i18n.getMsg("dcGrSp", rvs.upf.lng.iid)}</label>
                  </td>
                  <td>
                    <div class="input-line">
                      <select name="dcGrSp" onchange="bsInpChn(this);">
                        <c:forEach var="it" items="${rvs.dcGrSps}">
                          <c:set var="itmSel" value=""/>
                          <c:if test="${rvs.upf.dcGrSp.iid eq it.iid}">
                            <c:set var="itmSel" value="selected"/>
                          </c:if>
                          <option value="${it.iid}" ${itmSel}>${i18n.getMsg(it.nme)}</option>
                        </c:forEach>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <label>${i18n.getMsg("dgInGr", rvs.upf.lng.iid)}</label>
                  </td>
                  <td>
                    <div class="input-line">
                      <select name="dgInGr" onchange="bsInpChn(this);">
                        <c:set var="itmSel" value=""/>
                        <c:if test="${rvs.upf.dgInGr == 2}">
                          <c:set var="itmSel" value="selected"/>
                        </c:if>
                        <option value="2" ${itmSel}>2 ${i18n.getMsg("Indian", rvs.upf.lng.iid)}</option>
                        <c:set var="itmSel" value=""/>
                        <c:if test="${rvs.upf.dgInGr == 3}">
                          <c:set var="itmSel" value="selected"/>
                        </c:if>
                        <option value="3" ${itmSel}>3</option>
                        <c:set var="itmSel" value=""/>
                        <c:if test="${rvs.upf.dgInGr == 4}">
                          <c:set var="itmSel" value="selected"/>
                        </c:if>
                        <option value="4" ${itmSel}>4</option>
                      </select>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="dlg-actions">
            <input style="display: none" id="lngPrefFrmFakeSubmit" type="submit">
            <button type="submit" class="btn btn-act btn-confirm" onclick="return bsChkFrm(this.form, true);">${i18n.getMsg("Apply", rvs.upf.lng.iid)}</button>
            <button type="button" onclick="document.getElementById('dlgI18n').close(); return false;" class="btn btn-act btn-confirm">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
          </div>
        </form>
     </div>
  </dialog>

  <dialog id="dlgErr" class="dlg dlg-alert">
      <div class="error">
        <div class="dialog-title error-title">
          ${i18n.getMsg("Error", rvs.upf.lng.iid)}!
          <button onclick="document.getElementById('dlgErr').close()" class="btn-close btn-error">x</button>
        </div>
        <div id="errPl" class="msg-place">
        </div>
     </div>
  </dialog>

  <dialog id="dlgWrn" class="dlg dlg-alert">
    <div class="warning">
      <div class="dialog-title warning-title">
        ${i18n.getMsg("Warning", rvs.upf.lng.iid)}!
        <button onclick="document.getElementById('dlgWrn').close()" class="btn-close btn-warning">x</button>
      </div>
      <div id="wrnPl" class="msg-place">
      </div>
   </div>
  </dialog>

  <div id="dlgSuc" class="dlg-notifier">
    <div class="success">
      <div class="dialog-title success-title">
        ${i18n.getMsg("Success", rvs.upf.lng.iid)}!
        <button onclick="document.getElementById('dlgSuc').close()" class="btn-close btn-success">x</button>
      </div>
      <div id="sucPl" class="msg-place">
      </div>
   </div>
  </div>

</body>
</html>
