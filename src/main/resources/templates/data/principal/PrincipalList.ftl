<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>网点审核</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="${basePath!}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${basePath!}/static/css/public.css" media="all" />
    <script src="${basePath!}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${basePath!}/static/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="${basePath!}/static/layui/layui.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath!}/static/js/data.js" ></script>
    <script type="text/javascript" src="${basePath!}/static/js/province.js" ></script>
</head>
<body>
<div style="width: 100%">
    <div class="layui-inline">
        <table>
            <tr>
                <td>网点编号：</td>
                <td><input class="layui-input" name="bracode" id="bracode" autocomplete="off" ></td>
                <td><button class="layui-btn" data-type="reload" id="sou">搜索</button></td>
            </tr>
        </table>
    </div>
</div>
    <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test">
    </table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjl">添加负责人</a>
    </script>
</div>
</body>
<script type="text/javascript">
    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;

        table.render({
            elem:'#demo'
            ,url: '/admin/principal/select'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '类型维护'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10
            ,cols: [[ //表头
                {field: 'braid', title: '序列'}
                ,{field: 'bracode', title: '网点编号'}
                ,{field: 'braname', title: '网点名称',totalRow: true}
                ,{field: 'brasuoshu', title: '所属网点', totalRow: true}
                ,{field: 'braremark', title: '备注',totalRow: true}
                ,{field: 'bratime', title: '申请时间',totalRow: true}
                ,{fixed: 'right',title: '操作',align:'center', toolbar: '#barDemo'}
            ]]
            ,id:'listData'
        });


        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;
            if (layEvent === "hkjl") {
                layer.open({
                    title: '添加负责人',
                    type: 2,
                    scrollbar: false,
                    area: ['400px', '300px'],
                    closeBtn: 2,
                    content: "/admin/principal/update?bracode="+data.bracode,
                    end: function () {
                        location.reload();
                    }
                    // cancel: function (index, layero) {
                    //
                    //     window.location.reload();
                    //
                    //     return false;
                    // }
                });
            }
        })
        var $ = layui.$;
        $('#sou').on('click', function(){
            var bracode = $('#bracode');
            //执行重载
            table.reload('listData', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    bracode: bracode.val(),
                }
            });
        });
    })
</script>
</html>