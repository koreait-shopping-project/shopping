<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/res/css/<tiles:getAsString name='layout'/>.css?ver=1.0">
    <link rel="stylesheet" href="/res/css/<tiles:getAsString name='common'/>.css?ver=1.0">
    <link rel="stylesheet" href="/res/css/<tiles:getAsString name='addr1'/>/index.css?ver=1.0">
    <link rel="stylesheet" href="/res/css/<tiles:getAsString name='addr2'/>.css?ver=1.0">
    <title><tiles:getAsString name="title" /></title>
</head>
<body>
<div id="header_wrap">
    <tiles:insertAttribute name="header" />
</div>
<div id="wrap">
    <div id="container">
        <div id="contents">
            <tiles:insertAttribute name="body" />
        </div>
    </div>
</div>
<div id="footer_wrap">
    <tiles:insertAttribute name="footer" />
</div>

<script defer src="/res/js/<tiles:getAsString name='common'/>.js?ver=1.0"></script>
<script defer src="/res/js/<tiles:getAsString name='addr1'/>/index.js?ver=1.0"></script>
<script defer src="/res/js/<tiles:getAsString name='addr2'/>.js?ver=1.0"></script>
</body>
</html>