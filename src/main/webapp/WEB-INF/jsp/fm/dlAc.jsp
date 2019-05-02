<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="form-actions">
  <input style="display: none" id="${frPlNm}DlFrmFa" type="submit"/>
  <button type="button" onclick="bsSbFrmAjxCf('${frPlNm}DlFrm',false);">${i18n.getMsg("Delete", rvs.upf.lng.iid)}</button>
  <button type="button" onclick="bsClsDlgCf('${frPlNm}Dl');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
</div>
