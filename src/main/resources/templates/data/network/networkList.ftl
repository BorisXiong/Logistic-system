<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>网点维护</title>
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

    <script type="text/javascript">
        var defaults = {
            s1: 'provid',
            s2: 'cityid',
            s3: 'areaid',
            v1: null,
            v2: null,
            v3: null
        };
    </script>
<style>
    td{display: block;
    float: left;}
</style>
</head>
<body>
<div id="brarank">${brarank}</div>
    <div style="width: 100%; height: 580px">
<#--        左侧-->
        <div style="width: 600px; height: 560px; background-color: #c5dbec;float: left; ">
            <table class="layui-table" lay-even lay-skin="nob" id="demo" lay-filter="test">
            </table>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjl">修改信息</a>
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="hkjh">删除</a>
            </script>
        </div>
<#--        右侧-->
        <div style="width: 700px; height: 560px; background-color: #c5dbec;float: left; float: right">
            <form class="layui-form" action="" method="post" >
               <table>
                   <tr >
                       <td style="width: 180px;margin: 15px"><input type="text" name="bracode" id="bracode" placeholder="网点编码" autocomplete="off" class="layui-input" lay-verify="required|number"></td>
                       <td style="width: 180px;margin: 15px"><input type="text" name="braname" id="braname"  placeholder="网点名称" autocomplete="off" class="layui-input" lay-verify="required"></td>
                       <td style="width: 180px;margin: 15px"><input type="text" name="branameEnglish" id="branameEnglish"  placeholder="网点英文缩写" autocomplete="off" class="layui-input" lay-verify="required"></td>
                   </tr>
               </table>
                <table>
                    <tr>
                        <td style="width: 600px;margin: 15px">
                            <#--                省市县级联-->
                            <div class="layui-form-item">
                                <div class="layui-input-inline">
                                    <select name="provid" id="provid" lay-filter="provid">
                                        <option>请选择省</option>
                                    </select>
                                </div>
                                <div class="layui-input-inline">
                                    <select name="cityid" id="cityid" lay-filter="cityid">
                                        <option>请选择市</option>
                                    </select>
                                </div>
                                <div class="layui-input-inline">
                                    <select name="areaid" id="areaid" lay-filter="areaid">
                                        <option>请选择区域</option>
                                    </select>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td style="width: 300px;margin: 15px;row-span: 2"><input type="text" name="braaddress"  id="braaddress" placeholder="详细地址" autocomplete="off" class="layui-input" lay-verify="required"></td>
                        <td>
                            <div class="layui-input-inline">
                                <select id="type" name="type">
                                        <option value="">请选择</option>
                                </select>
                            </div>

                        </td>
                    </tr>
<#--                    <tr>-->
<#--                        <td style="width: 285px;margin: 15px"><input type="text" name="braprincipal" id="braprincipal"  placeholder="负责人" autocomplete="off" class="layui-input" lay-verify="required"></td>-->
<#--                        <td style="width: 285px;margin: 15px"><input type="text" name="braphone" id="braphone" placeholder="电话" autocomplete="off" class="layui-input" lay-verify="required|phone|number" ></td>-->
<#--                    </tr>-->
                    <tr>
                        <td style="width: 585px;margin: 15px"><input type="text" name="braremark" id="braremark" placeholder="备注" autocomplete="off" class="layui-input" lay-verify="required"></td>
                    </tr>
                    <tr>
                        <td>
<#--                            <div class="box"><span style="">tp5 + layui 上传图片</span></div>-->
<#--                            <div class="box1">-->
<#--                                <div class="controls need-img">-->
<#--                                    <button type="button" class="layui-btn layui-btn-primary" id="upload_img_icon">上传图片</button>-->
<#--                                    <div class="upload-img-box" id="brapicture">-->
<#--                                    </div>-->
<#--                                </div>-->
<#--                            </div>-->
                        </td>
                    </tr>
                    <tr>
                        <td style="row-span: 2">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="tj">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>



                            </div>
                        </td>
                    </tr>
                </table>

            </form>
        </div>

    </div>


</body>
<script type="text/javascript">
    var upurl = "{:url('xiaoguotu/upload')}"; //上传图片地址

    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;

        // upload.render({
        //     elem: '#upload_img_icon',
        //     url: upurl,
        //     multiple: true, //是否允许多文件上传。设置 true即可开启。不支持ie8/9
        //     auto:true,//自动上传
        //     before: function(obj) {
        //         layer.msg('图片上传中...', {
        //             icon: 16,
        //             shade: 0.01,
        //             time: 0
        //         })
        //     },
        //     done:function (res) {
        //         layer.close(layer.msg('上传成功'));
        //         $('.upload-img-box').append('<dd class="upload-icon-img" ><div class="upload-pre-item"><i οnclick="deleteImg($(this))"   class="layui-icon"></i><img src="\' + res.data + \'" class="img" ><input type="hidden" name="case_images[]" value="\' + res.data + \'" /></div></dd>');
        //     },
        //     error:function () {
        //         layer.msg('上传错误')
        //     }
        // });


        //执行一个 table 实例     render 渲染,显示
        table.render({
            elem:'#demo'
            ,width:600    //jquery的id选择器   也就是table的id
            ,height:550
            ,url: '/admin/network/select'     //数据接口
            //,where:{loanId:$("#loanId").val()}
            ,title: '下级'
            ,page:true           //是否开启分页
            ,totalRow: true
            ,limit:10        //每页显示的条数
            ,cols: [[ //表头
                {type: 'numbers'}
                ,{field: 'bracode', title: '网点编号', width:150}
                ,{field: 'braname', title: '网点名称', width:200,totalRow: true}
                ,{fixed: 'right',title: '操作', width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        });

        $.ajax({
            url:"/admin/network/selbranch",
            type:"post",
            dataType:"json",
            success: function (data) {
                $.each(data, function (index, item) {
                    $('#type').append(new Option( item.braname,item.braid));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }})








        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            layEvent = obj.event;

            if (layEvent === "hkjl") {
                layer.open({
                    title: '修改信息',
                    type: 2,
                    area: ['700px', '500px'],
                    closeBtn: 2,
                    content: "/admin/network/update?bracode=" + data.bracode,
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
            if (layEvent == "hkjh") {

                layer.confirm('真的要删除吗？', function (index) {
                    $.post("/admin/network/del",{'bracode':data.bracode},function(result)
                        {
                            layer.msg(result.msg, {
                                icon: 1,
                                time: 100 //2秒关闭（如果不配置，默认是3秒）
                            }, function(){
                                //刷新父页面
                                window.location.reload();
                            });
                        }
                    );
                });
            }
        })


        form.on('submit(tj)', function(data){
             var provid= $("#brarank").text();
            // var cityid= document.getElementById("cityid").title;
            // var areaid= document.getElementById("areaid").title;
             alert($("#type").val());
            if (provid<=1){
            $.ajax({
                url:'/admin/network/insertbranch',
                method:'post',
                 data:{bracode:$("#bracode").val(),
                     braname:$("#braname").val(),
                     branameEnglish:$("#branameEnglish").val(),
                     provid:$("#provid option:selected").text(),
                     cityid:$("#cityid option:selected").text(),
                     areaid:$("#areaid option:selected").text(),
                     braaddress:$("#braaddress").val(),
                     typetext:$("#type :selected").text(),
                     typebraid:$("#type").val(),
                     // braprincipal:$("#braprincipal").val(),
                     // braphone:$("#braphone").val(),
                     braremark:$("#braremark").val()
                        },
                dataType:'JSON',
                success:function(res){
                    if(res.code='0'){

                        window.location.reload();
                    }
                    else
                        alert(res.msg);
                },
                error:function (data) {

                }
            }) ;
            }else{
                //提交添加网点申请
                $.ajax({
                    url:'/admin/network/insertbranchSQ',
                    method:'post',
                     data:{bracode:$("#bracode").val(),
                         braname:$("#braname").val(),
                         branameEnglish:$("#branameEnglish").val(),
                         provid:$("#provid option:selected").text(),
                         cityid:$("#cityid option:selected").text(),
                         areaid:$("#areaid option:selected").text(),
                         braaddress:$("#braaddress").val(),
                         typetext:$("#type :selected").text(),
                         typebraid:$("#type").val(),
                         braremark:$("#braremark").val()
                    },
                    dataType:'JSON',
                    success:function(res){
                        if(res.code='0'){

                            window.location.reload();
                        }
                        else
                            alert(res.msg);
                    },
                    error:function (data) {

                    }
                }) ;
            }
        });

    });
</script>
</html>