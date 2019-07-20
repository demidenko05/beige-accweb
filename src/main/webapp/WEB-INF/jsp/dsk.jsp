<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
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
      <a href="#" class="dropdown-btn">${i18n.getMsg("Common", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsOpnDlg('dlgI18n');">${i18n.getMsg("changeUsPrf", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Tax&pg=1');">${i18n.getMsg("Taxs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=TxCt&pg=1');">${i18n.getMsg("TxCts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=TxDst&pg=1');">${i18n.getMsg("TxDsts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SrvCt&pg=1');">${i18n.getMsg("SrvCts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Srv&pg=1');">${i18n.getMsg("Srvs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=DcrCt&pg=1');">${i18n.getMsg("DcrCts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=DbCr&pg=1');">${i18n.getMsg("DbCrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=DriEnrSr&pg=1');">${i18n.getMsg("DriEnrSrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18Srv&pg=1');">${i18n.getMsg("I18Srvs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18Buyr&pg=1');">${i18n.getMsg("I18Buyrs", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("Accounting", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=InEntr&pg=1');">${i18n.getMsg("InEntrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Entr&pg=1');">${i18n.getMsg("Entrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'ntr?rnd=blnj');">${i18n.getMsg("trial_balance", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'ntr?rnd=blnsj');">${i18n.getMsg("balance_sheet", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'ntr?rnd=ldgj');">${i18n.getMsg("Ledger", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=AcStg&pg=1');">${i18n.getMsg("AcStgs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Acnt&pg=1');">${i18n.getMsg("Acnts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Expn&pg=1');">${i18n.getMsg("Expns", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Bnka&pg=1');">${i18n.getMsg("Bnkas", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Curr&pg=1');">${i18n.getMsg("Currs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=EnrSrc&pg=1');">${i18n.getMsg("EnrSrcs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18Acc&pg=1');">${i18n.getMsg("I18Accs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18Curr&pg=1');">${i18n.getMsg("I18Currs", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("Trade", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PrepTo&pg=1');">${i18n.getMsg("PrepTos", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PurInv&pg=1');">${i18n.getMsg("PurInvs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PaymTo&pg=1');">${i18n.getMsg("PaymTos", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PrepFr&pg=1');">${i18n.getMsg("PrepFrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SalInv&pg=1');">${i18n.getMsg("SalInvs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PaymFr&pg=1');">${i18n.getMsg("PaymFrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=PurRet&pg=1');">${i18n.getMsg("PurRets", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=SalRet&pg=1');">${i18n.getMsg("SalRets", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("Warehouse", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=MovItm&pg=1');">${i18n.getMsg("MovItms", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmAdd&pg=1');">${i18n.getMsg("ItmAdds", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmUlb&pg=1');">${i18n.getMsg("ItmUlbs", rvs.upf.lng.iid)}</a>
        <a href="ntr?prc=PrWrhItm" target="_blank">${i18n.getMsg("items_warehouse", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Itm&pg=1');">${i18n.getMsg("Itms", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=ItmCt&pg=1');">${i18n.getMsg("ItmCts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Uom&pg=1');">${i18n.getMsg("Uoms", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Wrh&pg=1');">${i18n.getMsg("Wrhs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=WrhPl&pg=1');">${i18n.getMsg("WrhPls", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18Itm&pg=1');">${i18n.getMsg("I18Itms", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=I18Uom&pg=1');">${i18n.getMsg("I18Uoms", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">${i18n.getMsg("Other", rvs.upf.lng.iid)}</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=MnfPrc&pg=1');">${i18n.getMsg("MnfPrcs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Mnfct&pg=1');">${i18n.getMsg("Mnfcts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Wage&pg=1');">${i18n.getMsg("Wages", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=WagTy&pg=1');">${i18n.getMsg("WagTys", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=EmpCt&pg=1');">${i18n.getMsg("EmpCts", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Empl&pg=1');">${i18n.getMsg("Empls", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=WagTt&pg=1');">${i18n.getMsg("WagTts", rvs.upf.lng.iid)}</a>
      </div>
    </div>
    <div class="dropdown">
      <a href="#" class="dropdown-btn">...</a>
      <div class="dropdown-content">
        <a href="#" onclick="bsGtAjx('GET', 'ntr?prc=About');">${i18n.getMsg("About", rvs.upf.lng.iid)}</a>
        <a href="srv">${i18n.getMsg("Refresh", rvs.upf.lng.iid)}</a>
        <a href="../">${i18n.getMsg("Home", rvs.upf.lng.iid)}</a>
        <a href="ntr?prc=RefrI18n" target="_blank">${i18n.getMsg("RefrI18n", rvs.upf.lng.iid)}</a>
        <c:if test="${not empty pageContext['request'].userPrincipal}">
          <a href="../?logoff=true">${pageContext['request'].userPrincipal.name} ${i18n.getMsg("logout", rvs.upf.lng.iid)}</a>
        </c:if>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Lng&pg=1');">${i18n.getMsg("Lngs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=Cntr&pg=1');">${i18n.getMsg("Cntrs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=DcSp&pg=1');">${i18n.getMsg("DcSps", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=DcGrSp&pg=1');">${i18n.getMsg("DcGrSps", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=UsPrf&pg=1');">${i18n.getMsg("UsPrfs", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=CsvMth&pg=1');">${i18n.getMsg("CsvMths", rvs.upf.lng.iid)}</a>
        <a href="#" onclick="bsGtAjx('GET', 'srv?act=lst&rnd=lhj&ent=MaFrn&pg=1');">${i18n.getMsg("MaFrns", rvs.upf.lng.iid)}</a>
        <c:if test="${pageContext.servletContext.getInitParameter('ormDir') eq 'sqlite'}">
          <a href="ntr?prc=PrcUsrPwd">${i18n.getMsg("change_password", rvs.upf.lng.iid)}</a>
        </c:if>
      </div>
    </div>
  </div>

  <jsp:include page="tml/bum.jsp"/>

</body>
</html>
