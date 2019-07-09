<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pages">
  <button onclick="bsGtAjxCf('GET', 'srv?rnd=eoj&act=entCr&ent=${cls.simpleName}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');" class="btn">
    ${i18n.getMsg("New", rvs.upf.lng.iid)}
  </button>
  <button onclick="bsGtAjxCf('GET', 'srv?rnd=eoj&knCs=1&act=entCr&ent=${cls.simpleName}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');" class="btn">
    ${i18n.getMsg("New_known_cost", rvs.upf.lng.iid)}
  </button>
</div>
