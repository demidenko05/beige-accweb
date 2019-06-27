<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="txbl" value="${rvs.astg.stExs && !ent.omTx}" scope="request"/>
<c:set var="stIb" value="${rvs.astg.stIb}" scope="request"/>
<c:set var="inTx" value="${ent.inTx}" scope="request"/>
<c:set var="stAg" value="${rvs.astg.stAg}" scope="request"/>
<c:if test="${cls.simpleName eq 'PurInv'}">
  <c:set var="stExtract" value="${rvs.astg.stExp}"/>
</c:if>
<c:if test="${cls.simpleName eq 'SalInv'}">
  <c:set var="stExtract" value="${rvs.astg.stExs}"/>
</c:if>
<c:if test="${stExtract}">
  <c:if test="${ent.dbcr != null && ent.dbcr.txDs != null}">
    <c:set var="txDs" value="${ent.dbcr.txDs}" scope="request"/>
    <c:set var="stIb" value="${!ent.dbcr.txDs.stIb}" scope="request"/>
    <c:set var="stAg" value="${ent.dbcr.txDs.stAg}" scope="request"/>
  </c:if>
  <c:if test="${ent.tot.doubleValue() == 0}">
    <tr>
      <td>
        <label>${i18n.getMsg("omTx", rvs.upf.lng.iid)}</label>
      </td>
      <td>
        <div class="input-line">
          <select name="${ent.getClass().simpleName}.omTx" onchange="bsInpChn(this);">
            <c:set var="selTrue" value=""/>
            <c:if test="${ent.omTx}"> <c:set var="selTrue" value="selected"/> </c:if>
            <option value="true" ${selTrue}>${i18n.getMsg("Yes", rvs.upf.lng.iid)}</option>
            <c:set var="selF" value=""/>
            <c:if test="${!ent.omTx}"> <c:set var="selF" value="selected"/> </c:if>
            <option value="false" ${selF}>${i18n.getMsg("No", rvs.upf.lng.iid)}</option>
          </select>
        </div>
      </td>
    </tr>
    <c:if test="${!ent.omTx}">
      <tr>
        <td>
          <label>${i18n.getMsg("inTx", rvs.upf.lng.iid)}</label>
        </td>
        <td>
          <div class="input-line">
            <select name="${ent.getClass().simpleName}.inTx" onchange="bsInpChn(this);">
              <c:set var="selTrue" value=""/>
              <c:if test="${ent.inTx}"> <c:set var="selTrue" value="selected"/> </c:if>
              <option value="true" ${selTrue}>${i18n.getMsg("Yes", rvs.upf.lng.iid)}</option>
              <c:set var="selF" value=""/>
              <c:if test="${!ent.inTx}"> <c:set var="selF" value="selected"/> </c:if>
              <option value="false" ${selF}>${i18n.getMsg("No", rvs.upf.lng.iid)}</option>
            </select>
          </div>
        </td>
      </tr>
    </c:if>
  </c:if>
  <c:if test="${ent.tot.doubleValue() != 0}">
    <tr>
      <td>
        <label>${i18n.getMsg("omTx", rvs.upf.lng.iid)}
          <c:if test="${!ent.omTx}">
            , ${i18n.getMsg("inTx", rvs.upf.lng.iid)}
          </c:if>
        </label>
      </td>
      <td>
        <div class="input-line">
          <c:if test="${!ent.omTx}">
            <input disabled value="${i18n.getMsg(ent.omTx, rvs.upf.lng.iid)}, ${i18n.getMsg(ent.inTx, rvs.upf.lng.iid)}"/> 
            <input type="hidden" name="${ent.getClass().simpleName}.omTx" value="${ent.omTx}"/> 
            <input type="hidden" name="${ent.getClass().simpleName}.inTx" value="${ent.inTx}"/> 
          </c:if>
          <c:if test="${ent.omTx}">
            <input disabled value="${i18n.getMsg(ent.omTx, rvs.upf.lng.iid)}"/> 
            <input type="hidden" name="${ent.getClass().simpleName}.omTx" value="${ent.omTx}"/> 
          </c:if>
        </div>
      </td>
    </tr>
  </c:if>
</c:if>
