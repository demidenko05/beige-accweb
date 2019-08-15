<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}.str1">${i18n.getMsg("val", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <textarea rows="2" required name="${cls.simpleName}.str1" onchange="bsInpChn(this);">${ent.str1}</textarea> 
    </div>
  </td>
</tr>
