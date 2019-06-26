<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${txbl && stIb}">
  <c:if test="${not empty txDs}">
    ${txDs.nme}: ${i18n.getMsg("stRm", rvs.upf.lng.iid)}=${i18n.getMsg(txDs.stRm, rvs.upf.lng.iid)},
    ${i18n.getMsg("stIb", rvs.upf.lng.iid)}=${i18n.getMsg(txDs.stIb, rvs.upf.lng.iid)},
    ${i18n.getMsg("stAg", rvs.upf.lng.iid)}=${i18n.getMsg(txDs.stAg, rvs.upf.lng.iid)}
    <br>
  </c:if>
  <c:set var="taxesTl" value="0"/>
  ${i18n.getMsg("Taxs", rvs.upf.lng.iid)}:
  <c:forEach var="ent" items="${olme.value}" varStatus="vs">
    <c:if test="${!vs.isFirst()}">; </c:if>
    ${ent.tax.nme}
    <c:if test="${rvs.accSet.stIb}">
      * ${numStr.frmt(ent.txb.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)} =
    </c:if>
    ${numStr.frmt(ent.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
    <c:set var="taxesTl" value="${ent.tot + taxesTl}"/>
  </c:forEach>
  <br> <b>${i18n.getMsg("toTx", rvs.upf.lng.iid)}: ${numStr.frmt(taxesTl.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)} ${rvs.astg.curr.nme}</b>
</c:if>
<c:if test="${txbl && !stIb}">
  <div class="title-list">${i18n.getMsg("Taxs", rvs.upf.lng.iid)}:</div>
  <c:if test="${not empty txDs}">
    ${txDs.nme}: ${i18n.getMsg("stRm", rvs.upf.lng.iid)}=${i18n.getMsg(txDs.stRm, rvs.upf.lng.iid)},
    ${i18n.getMsg("stIb", rvs.upf.lng.iid)}=${i18n.getMsg(txDs.stIb, rvs.upf.lng.iid)},
    ${i18n.getMsg("stAg", rvs.upf.lng.iid)}=${i18n.getMsg(txDs.stAg, rvs.upf.lng.iid)}
    <br>
  </c:if>
  <c:set var="taxesTl" value="0"/>
  <table>
    <tr>
      <th>${i18n.getMsg("tax", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("txb", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("tot", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("Actions", rvs.upf.lng.iid)}</th>
    </tr>
    <c:forEach var="ent" items="${olme.value}">
      <tr>
        <td>
          ${ent.tax.nme}
        </td>
        <td style="text-align: right;">
          ${numStr.frmt(ent.txb.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
        </td>
        <td style="text-align: right;">
          ${numStr.frmt(ent.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
        </td>
        <td>
          <button class="btn" onclick="bsGtAjxCf('GET', '?rnd=eoj&act=entEd&ent=${ent.getClass().simpleName}&${ent.getClass().simpleName}.iid=${ent.iid}${owVr}${flyPar}');">${i18n.getMsg("Edit", rvs.upf.lng.iid)}</button>
        </td>
      </tr>
      <c:set var="taxesTl" value="${ent.tot + taxesTl}"/>
    </c:forEach>
  </table>
  <b>${i18n.getMsg("toTx", rvs.upf.lng.iid)}: ${numStr.frmt(taxesTl.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)} ${rvs.astg.curr.nme}</b>
</c:if>
