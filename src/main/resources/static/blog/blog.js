$(function () {

    $('#addArticleBtn').on('click', function () {
        saveArticle()
    })

    function saveArticle() {
        $.ajax({
            url: "saveArticle",
            data: $('#addArticleForm').serialize(),
            type: "POST",
            async: false,
            success: function (resp) {
                if (resp) {
                    saveArticleSuccess(resp)
                } else {
                    saveArticleFail()
                }
            },
            error: function () {
                saveArticleFail()
            }
        })
    }

    function saveArticleSuccess(resp) {
        alert('保存成功' )
        window.open('detailArticleView?id=' + resp.id)
    }

    function saveArticleFail() {
        alert("保存失败！")
    }


    // update the article
    $('#updateArticleBtn').on('click', function () {
        updateArticle()
    })

    function updateArticle() {
        $.ajax({
            url: "saveEditedArticle",
            data: $('#editArticleForm').serialize(),
            type: "POST",
            async: false,
            success: function (resp) {
                if (resp) {
                    updateArticleSuccess(resp)
                } else {
                    updateArticleFail()
                }
            },
            error: function () {
                updateArticleFail()
            }
        })
    }

    function updateArticleSuccess(resp) {
        alert('更新成功' )
        window.open('detailArticleView?id=' + resp.id)
    }

    function updateArticleFail() {
        alert("更新失败！")
    }
})