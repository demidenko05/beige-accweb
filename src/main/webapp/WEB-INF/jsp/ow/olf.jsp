<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pages">
  <button onclick="getHtmlByAjaxCareful('GET', 'srv?rnd=eoj&sct=entCr&ent=${cls.simpleName}&${cls.simpleName}.ownr=${hldUvd.ent.iid}${flyPar}');" class="btn">
    ${i18n.getMsg("New", rvs.upf.lng.iid)}
  </button>
</div>
