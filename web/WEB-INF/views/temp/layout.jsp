<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script defer src="/res/js/<tiles:getAsString name='common'/>.js?ver=1.0"></script>
<script defer src="/res/js/<tiles:getAsString name='addr1'/>/index.js?ver=1.0"></script>
<script defer src="/res/js/<tiles:getAsString name='addr2'/>.js?ver=1.0"></script>
</body>
</html>