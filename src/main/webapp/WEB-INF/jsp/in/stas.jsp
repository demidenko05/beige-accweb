<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <b>${i18n.getMsg("stas", rvs.upf.lng.iid)}</b>
  </td>
  <td>
    <div class="input-line">
      <c:if test="${param.orAct eq 'cnc'}">
        <b>${i18n.getMsg('CANCELED', rvs.upf.lng.iid)}</b>
      </c:if>
      <c:if test="${param.orAct eq 'pyd'}">
        <b>${i18n.getMsg('PAYED', rvs.upf.lng.iid)}</b>
      </c:if>
      <c:if test="${param.orAct eq 'cls'}">
        <b>${i18n.getMsg('CLOSED', rvs.upf.lng.iid)}</b>
      </c:if>
      <input type="hidden" name="orAct" value="${param.orAct}"/>
    </div>
  </td>
</tr>
