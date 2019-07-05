<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${txbl}">
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
            <input disabled value="${ent.omTx}, ${ent.inTx}"/> 
            <input type="hidden" name="${ent.getClass().simpleName}.omTx" value="${ent.omTx}"/> 
            <input type="hidden" name="${ent.getClass().simpleName}.inTx" value="${ent.inTx}"/> 
          </c:if>
          <c:if test="${ent.omTx}">
            <input disabled value="${ent.omTx}"/> 
            <input type="hidden" name="${ent.getClass().simpleName}.omTx" value="${ent.omTx}"/> 
          </c:if>
        </div>
      </td>
    </tr>
  </c:if>
</c:if>
