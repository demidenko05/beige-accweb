<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="${cls.simpleName}.isNew" value="${ent.isNew}"/> 
<input type="hidden" name="${cls.simpleName}.isNew" value="${ent.isNew}"/> 
<input type="hidden" name="${cls.simpleName}.dbOr" value="${ent.dbOr}"/> 
<c:if test="${!ent.isNew}">
  <input type="hidden" name="${cls.simpleName}.ver" value="${ent.ver}"/> 
  <jsp:include page="reo.jsp"/>
  <tr>
    <td>
      <label for="cnfSacChNm">${i18n.getMsg("confirm_reason_changing_name", rvs.upf.lng.iid)}</label>
    </td>
  <c:if test="${not empty param.mbl}"></tr><tr></c:if>
    <td>
      <div class="input-line">
        <select ${auFoc} name="cnfSacChNm" onchange="bsInpChn(this);">
          <c:set var="auFoc" value="" scope="request"/>
          <option value="" selected>-</option>
          <option value="a">${i18n.getMsg("fixing_subacc_name_without_entries", rvs.upf.lng.iid)}</option>
          <option value="b">${i18n.getMsg("fixing_subacc_name_with_entries", rvs.upf.lng.iid)}</option>
        </select>
      </div>
    </td>
  </tr>
</c:if>
