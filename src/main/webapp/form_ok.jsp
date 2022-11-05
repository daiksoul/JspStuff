<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Enumeration" %>
<%--
  Created by IntelliJ IDEA.
  User: daiks
  Date: 2022-11-05
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HashMap<String,String> reqParams = new HashMap<>();
    Enumeration<String> reqEn = request.getParameterNames();
    while(reqEn.hasMoreElements()){
        String name = reqEn.nextElement();
        if(request.getParameter(name)!=null)
            reqParams.put(name,request.getParameter(name));
    }

    String font_fam = "";
    switch (reqParams.get("font")){
        case "dgm":
            font_fam =  "'NeoDunggeunmo Pro'";
            break;
        case "ver":
            font_fam =  "Verdana";
            break;
        case "ari":
            font_fam =  "Arial";
            break;
        case "d2c":
            font_fam =  "'D2Coding'";
            break;
    }

    String hover_style = "";
    switch(Integer.parseInt(reqParams.get("hover-action"))) {
        case 1:
            hover_style = "transform: scale(200%);\ntransform-origin: top left;";
            break;
        case 2:
            hover_style = "background-color: " + reqParams.get("ha-extra-2") + ";";
            break;
        case 3:
            hover_style = "background-color: " + reqParams.get("color") + ";";
            break;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form res</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/neodgm/neodgm-pro-webfont@1.020/neodgm_pro/style.css">
    <link href="https://cdn.jsdelivr.net/gh/wan2land/d2coding/d2coding-full.css" rel="stylesheet" />
    <style>
        h1{
            display: inline-block;
            color: <%=reqParams.get("color")%>;
            font-family: <%=font_fam%>;
            font-weight: <%=reqParams.get("weight")%>;
            font-style: <%=reqParams.get("italic")!=null? "italic": "normal"%>;
            text-decoration: <%=reqParams.get("underline")!=null? "underline":""%> <%=reqParams.get("through")!=null? "line-through":""%>;
            transition: all 1s;
        }
        h1:hover{
          <%=hover_style%>
          margin-bottom: 0;
        }
        #wrap{
            height: 3.5em;
            overflow: hidden;
            transition: all 1s;
        }
        <%=reqParams.get("hover-action").equals("4")?
        "#wrap:hover{height: 7em;}":""
        %>
        #hidden-txt{
            margin-top:0;
            color: silver;
        }
        .info{
            font-size: 0.8em;
            margin-left: 15px;
            color: #999999;
            margin-bottom: 5px;
        }
        .info-sub{
            margin-left: -15px;
            font-size: 1.2em;
            color: black;
        }
        .info-wrap h4{
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<div id="wrap">
    <h1><%=reqParams.get("text")%></h1><br>
    <div id="hidden-txt"><%=reqParams.get("ha-extra-4")%></div>
</div>
<div class="info-wrap">
    <h4>Additional Info</h4>
<div class="info">
    Description<br>
    <div class="info-sub">
        <%=reqParams.get("descr")%>
    </div>
</div>
<div class="info">
    Creation Date<br>
    <div class="info-sub">
        <%=reqParams.get("date")%>
    </div>
</div>
<div class="info">
    Author Contact info<br>
    <div class="info-sub">
        <%=reqParams.get("email")%>
    </div>
</div>
</div>
</body>
</html>