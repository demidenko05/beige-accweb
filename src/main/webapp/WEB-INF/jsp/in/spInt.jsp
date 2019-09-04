<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set target="${usdDp}" property="0" value="0"/>
<tr>
  <td>
    <label for="${cls.simpleName}.lng1">${i18n.getMsg("val", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum0" required name="${cls.simpleName}.lng1" value="${ent.lng1}" onchange="bsInpChn(this);"/> 
    </div>
  </td>
</tr>
