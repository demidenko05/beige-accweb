<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<c:if test="${now.time - buyr.lsTm lt 1800000}">
  <c:set var="isUnSign" value="${false}" scope="request"/>
</c:if>
<c:if test="${now.time - buyr.lsTm gt 1800000}">
  <c:set var="isUnSign" value="${true}" scope="request"/>
</c:if>
<c:if test="${not empty param.prcRed}">
  <c:set var="prcRed" value="${param.prcRed}" scope="request"/>
</c:if>
<c:if test="${empty param.prcRed}">
  <c:set var="prcRed" value="${param.prc}" scope="request"/>
</c:if>
<c:if test="${not empty param.rndRed}">
  <c:set var="rndRed" value="${param.rndRed}" scope="request"/>
</c:if>
<c:if test="${empty param.rndRed}">
  <c:set var="rndRed" value="${param.rnd}" scope="request"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="${urlPrf}img/favicon.png">

    <title>Beigesoft™ Web Store</title>
    <link href="${urlPrf}css/bootstrap.min.css" rel="stylesheet">
    <link href="${urlPrf}css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="${urlPrf}css/bootstrap-reboot.min.css" rel="stylesheet">
    <link href="${urlPrf}css/theme.css" rel="stylesheet">
    <link href="${urlPrf}css/open-iconic-bootstrap.min.css" rel="stylesheet">
    <link href="${urlPrf}css/flag-icon.min.css" rel="stylesheet">
    <script src="${urlPrf}js/jquery-3.3.1.min.js"></script>
    <script src="${urlPrf}js/bsNum.js"></script>
    <script src="${urlPrf}js/bsInpNum.js"></script>
    <script src="${urlPrf}js/bsWeSt.js"></script>
    <script src="${urlPrf}js/popper.min.js"></script>
    <script src="${urlPrf}js/bootstrap.min.js"></script>
    <script type="text/javascript">
    jQuery(function($) {
      setVarsNum('${rvs.cpf.dcSpv}','${rvs.cpf.dcGrSpv}',${rvs.upf.dgInGr});
      $('#quan').bsInpNum({step: 1});
      $('.bsNum${rvs.astg.prDp}').bsInpNum({decPl: ${rvs.astg.prDp}});
      $('.bsNum0').bsInpNum({decPl: 0});
      $('#quan').on("change", function () {
        bsRefCaItTo('',${rvs.astg.prDp},${rvs.astg.rndm.ordinal()});
      });
      $('#quantEdit').on("change", function () {
        bsRefCaItTo('Edit',${rvs.astg.prDp},${rvs.astg.rndm.ordinal()});
      });
    });
    </script>
  </head>

  <body>

    <header id="top">
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
      <a href="${urlPrf}?prc=WsPg" class="navbar-brand navbar-brand-img"><img src="${urlPrf}img/logo-web-store.png"></a>
      
      <a class="navbar-brand" href="${urlPrf}?prc=WsPg">${utlTradeJsp.webstoreName(rvs.tstg, rvs.i18nWebStoreList, rvs.upf.lng.iid)}</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1" aria-controls="navbar1" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div id="navbar1" class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
          <c:if test="${not empty rvs.catls}">
            <c:forEach var="cat1l" items="${rvs.catls}" varStatus="status">
              <c:if test="${cat1l.subcatls.size() gt 0}">
                <li class="nav-itm dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="dropdown${status.index}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${utlTradeJsp.catlToStr(cat1l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a>
                  <div class="dropdown-menu" aria-labelledby="dropdown${status.index}">
                    <a class="dropdown-itm" href="${urlPrf}?prc=WsPg&catlId=${cat1l.catl.iid}">${i18n.getMsg("All", rvs.upf.lng.iid)}</a>
                    <c:forEach var="cat2l" items="${cat1l.subcatls}">
                      <c:if test="${cat2l.subcatls.size() gt 0}">
                        <a class="dropdown-itm" href="#" data-toggle="modal" data-target="#subcatalogsMdl${cat2l.catl.iid}">${utlTradeJsp.catlToStr(cat2l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a>
                      </c:if>
                      <c:if test="${cat2l.subcatls.size() eq 0}">
                        <a class="dropdown-itm" href="${urlPrf}?prc=WsPg&catlId=${cat2l.catl.iid}">${utlTradeJsp.catlToStr(cat2l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a>
                      </c:if>
                    </c:forEach>
                  </div>
                </li>
              </c:if>
              <c:if test="${cat1l.subcatls.size() eq 0 && cat1l.catl.isInMenu}">
                <li class="nav-itm"><a class="nav-link" href="${urlPrf}?prc=WsPg&catlId=${cat1l.catl.iid}">${utlTradeJsp.catlToStr(cat1l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a></li>
              </c:if>
            </c:forEach>
          </c:if>
          <c:if test="${not empty rvs.fltPri || not empty rvs.fltCatl || not empty rvs.fltSpfs}">
            <li class="nav-itm"><a href="#" class="nav-link" data-toggle="modal" data-target="#filterMdl"><span class="oi oi-sort-ascending" title="Filter, order" aria-hidden="true"></span></a></li>
          </c:if>
        </ul>
        <ul class="navbar-nav navbar-right">
          <c:if test="${isUnSign}">
            <li class="nav-itm"><a href="#" class="nav-link" data-toggle="tooltip" title="${i18n.getMsg('log_in', rvs.upf.lng.iid)}" onclick="$('#signMdl').modal('toggle');"><span class="oi oi-account-login" aria-hidden="true"></span></a></li>
          </c:if>
          <c:if test="${!isUnSign}">
            <li class="nav-itm"><a href="#" class="nav-link" data-toggle="tooltip" title="${i18n.getMsg('log_out', rvs.upf.lng.iid)}" onclick="$('#logoutDlg').modal('toggle');">${buyr.nme} <span class="oi oi-account-logout" aria-hidden="true"></span></a></li>
          </c:if>
          <c:if test="${not empty cart}">
            <li class="nav-itm"><a href="#" class="nav-link" data-toggle="tooltip" title="${i18n.getMsg('shopping_cart', rvs.upf.lng.iid)}" onclick="$('#cartMdl').modal('toggle');"><span class="oi oi-cart" title="cart" aria-hidden="true"></span><span class="badge badge-secondary">${numStr.frmt(cart.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${rvs.wscurr.sgn}</span></a></li>
          </c:if>
          <li class="nav-itm"><a href="#" class="nav-link" data-toggle="tooltip" title="${i18n.getMsg('About', rvs.upf.lng.iid)}" onclick="$('#infoDlg').modal('toggle');"><span class="oi oi-info" aria-hidden="true"></span></a></li>
          <c:if test="${empty countryFlag}">
            <c:if test="${rvs.upf.lng.iid eq 'en'}">
              <c:set var="countryFlag" value="us"/>
            </c:if>
            <c:if test="${rvs.upf.lng.iid ne 'en'}">
              <c:set var="countryFlag" value="${rvs.upf.lng.iid}"/>
            </c:if>
          </c:if>
          <li class="nav-itm"><a href="#" class="nav-link" data-toggle="tooltip" title="${i18n.getMsg('lang', rvs.upf.lng.iid)}" onclick="$('#i18nMdl').modal('toggle');"><span class="flag-icon flag-icon-${countryFlag}"></span></a></li>
        </ul>
      </div>
    </nav>
    </header>

    <main role="main">
