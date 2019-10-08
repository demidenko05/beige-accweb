<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--Modal buyer's preferences-->
<div class="modal fade" id="i18nMdl" tabindex="-1" role="dialog" aria-labelledby="i18nMdlLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="i18nMdlLabel"><span class="oi oi-globe" aria-hidden="true"></span> ${i18n.getMsg("changeUsPrf", rvs.upf.lng.iid)}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form action="${urlPrf}?" method="POST">
          <input type="hidden" name="prc" value="${prcRed}">
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
            <div class="col-12 col-md-6 mb-3">
              <label>${i18n.getMsg("pgSz", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-6 mb-3">
              <input type="number" class="form-control" name ="pgSz" min="5" max="100" value="${rvs.cpf.pgSz}">
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-6 mb-3">
              <label>${i18n.getMsg("lng", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-6 mb-3">
              <select name="lng" class="form-control">
                <c:forEach var="it" items="${rvs.lngs}">
                  <c:set var="itmSel" value=""/>
                  <c:if test="${rvs.upf.lng.iid eq it.iid}">
                    <c:set var="itmSel" value="selected"/>
                  </c:if>
                  <option value="${it.iid}" ${itmSel}>${it.nme}</option>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-6 mb-3">
              <label>${i18n.getMsg("dcSp", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-6 mb-3">
              <select name="dcSp"  class="form-control">
                <c:forEach var="it" items="${rvs.dcSps}">
                  <c:set var="itmSel" value=""/>
                  <c:if test="${rvs.upf.dcSp.iid eq it.iid}">
                    <c:set var="itmSel" value="selected"/>
                  </c:if>
                  <option value="${it.iid}" ${itmSel}>${i18n.getMsg(it.nme, rvs.upf.lng.iid)}</option>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-6 mb-3">
              <label>${i18n.getMsg("dcGrSp", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-6 mb-3">
              <select name="dcGrSp"  class="form-control">
                <c:forEach var="it" items="${rvs.dcGrSps}">
                  <c:set var="itmSel" value=""/>
                  <c:if test="${rvs.upf.dcGrSp.iid eq it.iid}">
                    <c:set var="itmSel" value="selected"/>
                  </c:if>
                  <option value="${it.iid}" ${itmSel}>${i18n.getMsg(it.nme, rvs.upf.lng.iid)}</option>
                </c:forEach>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-6 mb-3">
              <label>${i18n.getMsg("dgInGr", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-6 mb-3">
              <select name="dgInGr"  class="form-control">
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
          </div>
          <div class="row">
            <div class="col-12 col-md-6 mb-3">
              <label>${i18n.getMsg("shTxDet", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-6 mb-3">
              <select name="shTxDet"  class="form-control">
                <c:set var="itmSel" value=""/>
                <c:if test="${rvs.shTxDet}">
                  <c:set var="itmSel" value="selected"/>
                </c:if>
                <option value="true" ${itmSel}>${i18n.getMsg("true", rvs.upf.lng.iid)}</option>
                <c:set var="itmSel" value=""/>
                <c:if test="${!rvs.shTxDet}">
                  <c:set var="itmSel" value="selected"/>
                </c:if>
                <option value="false" ${itmSel}>${i18n.getMsg("false", rvs.upf.lng.iid)}</option>
              </select>
            </div>
          </div>
          <c:if test="${rvs.currRts.size() gt 0}">
            <div class="row">
              <div class="col-12 col-md-6 mb-3">
                <label>${i18n.getMsg("Curr", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-6 mb-3">
                <select name="wscurr"  class="form-control">
                  <c:set var="itmSel" value=""/>
                  <c:if test="${rvs.wscurr.iid.equals(rvs.astg.curr.iid)}">
                    <c:set var="itmSel" value="selected"/>
                  </c:if>
                  <option value="${rvs.astg.curr.iid}" ${itmSel}>${rvs.astg.curr.nme}</option>
                  <c:forEach var="cr" items="${rvs.currRts}">
                    <c:set var="itmSel" value=""/>
                    <c:if test="${rvs.wscurr.iid.equals(cr.curr.iid)}">
                      <c:set var="itmSel" value="selected"/>
                    </c:if>
                    <option value="${cr.curr.iid}" ${itmSel}>${cr.curr.nme} ${i18n.getMsg("exRt", rvs.upf.lng.iid)} ${numStr.frmt(cr.exRt.toString(), rvs.cpf.dcSpv, rvs.cpf.dcGrSpv, 4, rvs.upf.dgInGr)}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
          </c:if>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
            <button type="submit" class="btn btn-primary">${i18n.getMsg("Apply", rvs.upf.lng.iid)}</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

