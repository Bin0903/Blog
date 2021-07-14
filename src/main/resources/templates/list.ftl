<html>
<#include "common/head.ftl">
<body>
<#include "common/navbar.ftl">
<div class="ui container">
    <div class="ui segments">
        <div class="ui segment">
            <h1>我的博客</h1>
            <a href="addArticleView" target="_blank" class="ui labeled icon button"><i class="pencil alternate icon"></i>写文章</a>
        </div>
        <div class="ui segment">
            <table id="myTable" class="ui celled table">
                <thead>
                <th>序号</th>
                <th>标题</th>
                <th>作者</th>
                <th>发表时间</th>
                <th>操作</th>
                </thead>
                <tbody>
                <#-- 使用FTL指令 -->
                <#list articles as article>
                <tr>
                    <td>${article.id}</td>
                    <td><a target="_blank" href="detailArticleView?id=${article.id}">${article.title}</a></td>
                    <td>${article.author}</td>
                    <td>${article.gmtModified}</td>
                    <td><a href="editArticleView?id=${article.id}" target="_blank">编辑</a></td>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        var dataTableOptions = {
                "bDestroy": true,
                dom: 'lfrtip',
                "paging": true,
                "lengthChange": false,
                "searching": true,
                "ordering": true,
                "info": true,
                "autoWidth": true,
                "processing": true,
                "stateSave": true,
                responsive: true,
                fixedHeader: false,
                order: [[1, "desc"]],
                language: {
                    paginate: {//分页的样式内容
                        previous: "上一页",
                        next: "下一页",
                        first: "第一页",
                        last: "最后"
                    }
                },
                zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
                //下面三者构成了总体的左下角的内容。
                info: "总计 _TOTAL_ 条,共 _PAGES_ 页，_START_ - _END_ ",//左下角的信息显示，大写的词为关键字。
                infoEmpty: "0条记录",//筛选为空时左下角的显示。
                infoFiltered: ""//筛选之后的左下角筛选提示
            }
        $(document).ready( function () {
            $('#myTable').DataTable(dataTableOptions);
            $('#myTable_filter').addClass('ui segment')
            $('#myTable_info').addClass('ui mini green message')
            //$('#myTable_filter').addClass('ui segment')
        });
    })
</script>
</html>