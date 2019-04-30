<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="form-actions">
  <input style="display: none" id="${frPlNm}EdFrmFa" type="submit"/>
  <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=esoj');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
  <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
</div>
