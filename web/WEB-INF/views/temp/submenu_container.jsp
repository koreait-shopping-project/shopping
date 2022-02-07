<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:importAttribute name="subMenuList"/>
<div class="submenu_section">
    <div>
        <ul>

        </ul>
    </div>
    <div class="p-10">
        <tiles:insertAttribute name="content"/>
    </div>
</div>