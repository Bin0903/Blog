<!DOCTYPE html>
<html>
<#include "common/head.ftl">
<body>
<#include "common/navbar.ftl">
<div class="ui container">
    <form id="editArticleForm" class="form-horizontal">
        <input type="hidden" name="id" value="${article.id}">
        <div class="ui segment">
            <div class="ui fluid icon input">
                <input type="text" name="title" value="${article.title}">
                <icon class="file icon"></icon>
            </div>
        </div>
        <div class="ui divider"></div>
        <div class="ui segments">
            <div class="ui piled segment">
                <textarea id="articleContentEditor" type="text" name="content" class="form-control" rows="20"
                          placeholder="">${article.content}</textarea>
            </div>
            <div class="ui horizontal segment">
                <div class="ui icon input">
                    <icon class="save icon"></icon>
                    <button type="submit" class="ui button" id="updateArticleBtn">更新</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $(function () {
        //获取写文章的mditor
        var editor = new mditor(document.getElementById('articleContentEditor'))
        editor.preview()

        //源码高亮
        $('pre code').each(function (i, block) {
            hljs.highlightBlock(block);
        });
    })
</script>
</html>