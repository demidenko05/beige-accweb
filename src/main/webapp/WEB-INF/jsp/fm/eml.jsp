<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="form-actions">
  <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
  <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=esj');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
  <button type="button" onclick="bsSbFrmAjxCf('${frPlNm}EdFrm', false, 'rnd=esj&ndSnd=1');">${i18n.getMsg("Send", rvs.upf.lng.iid)}</button>
  <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
</div>
