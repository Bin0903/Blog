<!DOCTYPE html>
<html>
<#include "common/head.ftl">
<body>
<#include "common/navbar.ftl">
<div class="ui container">
    <h1>${article.title}</h3>
    <h6>${article.author}</h6>
    <h6>${article.gmtModified}</h6>
    <textarea id="articleContentShow" style="display:
              none">${article.content}</textarea>
    <div id="article-content" class="ui piled segment"></div>
</div>
</body>
<script>
    $(function () {
        //获取写文章的mditor
        var editor = new mditor(document.getElementById('articleContentShow'))
        $(".mditor-mini").hide()
        $("#article-content").html(editor.getHtml())
        $(".mditor-mini").remove()

        //源码高亮
        $('pre code').each(function (i, block) {
            hljs.highlightBlock(block);
        });
    })
</script>
</html>