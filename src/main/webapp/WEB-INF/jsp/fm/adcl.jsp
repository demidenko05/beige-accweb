<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="form-actions">
  <input style="display: none" id="${frPlNm}EdFrmFs" type="submit"/>
  <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=esj');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
  <c:if test="${ent.tot.unscaledValue() gt 0}">
    <button type="button" onclick="bsSbFrmAjxCf('${frPlNm}EdFrm', false, 'rnd=lcfj&acAd=mkEnr');">${i18n.getMsg("Account", rvs.upf.lng.iid)}</button>
  </c:if>
  <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
</div>
