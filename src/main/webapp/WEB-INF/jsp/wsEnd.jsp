<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty rvs.errMsg}">
  <div class="modal fade" id="errDlg" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">${i18n.getMsg("Error", rvs.upf.lng.iid)}!</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <h5>${i18n.getMsg(rvs.errMsg, rvs.upf.lng.iid)}</h5>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
        </div>
      </div>
    </div>
  </div>
  <script>
    $("#errDlg").modal("show");
  </script>
</c:if>

<div class="modal fade" id="infoDlg" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">${i18n.getMsg("About", rvs.upf.lng.iid)}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <h4>${i18n.getMsg("app_name", rvs.upf.lng.iid)}</h4>
        <h5><a href="https://sites.google.com/site/beigesoftware" target="_blank">Beigesoft™ https://beigesoft.org</a></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
      </div>
    </div>
  </div>
</div>

<c:if test="${!isUnSign}">
  <div class="modal fade" id="logoutDlg" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><span class="oi oi-book" aria-hidden="true"></span> ${i18n.getMsg("CuOrs", rvs.upf.lng.iid)} / <span class="oi oi-account-logout" aria-hidden="true"></span> ${i18n.getMsg("logout", rvs.upf.lng.iid)}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <h5><a href="${urlPrf}?prc=PrBuOr&prcRed=${prcRed}">${i18n.getMsg('CuOrs', rvs.upf.lng.iid)} <span class="oi oi-book" aria-hidden="true"></span></a></h5>
          <h5><a href="#" data-dismiss="modal" data-toggle="tooltip" title="${i18n.getMsg('shipping_address', rvs.upf.lng.iid)}" onclick="$('#buyrMdl').modal('show');">${i18n.getMsg("shipping_address", rvs.upf.lng.iid)} <span class="oi oi-pencil" aria-hidden="true"></span></a></h5>
        </div>
        <div class="modal-footer">
          <a type="button" class="btn btn-outline-primary" href="${urlPrf}?prc=PrLog&prcRed=${prcRed}">${rvs.buyr.nme} <span class="oi oi-account-logout" aria-hidden="true"></span> ${i18n.getMsg("logout", rvs.upf.lng.iid)}</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="buyrMdl" tabindex="-1" role="dialog" aria-labelledby="buyrMdlLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="buyrMdlLabel"><span class="oi oi-cart" aria-hidden="true"></span> ${i18n.getMsg("shipping_address", rvs.upf.lng.iid)}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <form action="${urlPrf}?" method="POST">
            <input type="hidden" name="prcRed" value="${prcRed}">
            <input type="hidden" name="prc" value="PrLog">
            <c:forEach var="enr" items="${fltUrlFrm.entrySet()}">
              <c:if test="${enr.key ne 'fltCtVal'}">
                <c:if test="${!(enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1)}">
                  <input type="hidden" name="${enr.key}" value="${enr.value}">
                </c:if>
                <c:if test="${enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1}">
                  <c:forEach var="cv" items="${enr.value.split(';')}">
                    <input type="hidden" name="${enr.key}" value="${cv}">
                  </c:forEach>
                </c:if>
              </c:if>
              <c:if test="${enr.key eq 'fltCtVal'}">
                <c:forEach var="cv" items="${enr.value.split(';')}">
                  <input type="hidden" name="fltCtVal" value="${cv}">
                </c:forEach>
              </c:if>
            </c:forEach>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("nme", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input required name="nme" class="form-control" value="${rvs.buyr.nme}">
              </div>
            </div>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("cntr", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input name="cntr" class="form-control" value="${rvs.buyr.cntr}">
              </div>
            </div>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("city", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input name="city" class="form-control" value="${rvs.buyr.city}">
              </div>
            </div>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("zip", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input required name="zip" class="form-control" value="${rvs.buyr.zip}">
              </div>
            </div>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("addr1", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input required name="addr1" class="form-control" value="${rvs.buyr.addr1}">
              </div>
            </div>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("addr2", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input name="addr2" class="form-control" value="${rvs.buyr.addr2}">
              </div>
            </div>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("phon", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input name="phon" class="form-control" value="${rvs.buyr.phon}">
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</c:if>

    </main>

    <button id="toTop">^</button>

    <script>
      $(window).scroll(function() { if ($(this).scrollTop() > 200) { $("#toTop").fadeIn(); } else { $("#toTop").fadeOut(); } });
      $("#toTop").click(function() { $("html, body").animate({scrollTop: 0}, 1000); });
    </script>

  </body>
</html>
