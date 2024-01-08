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
<style>
    td{display: block;
    float: left;}
</style>
</head>
<body>
<div style="width: 100%; height: 560px;float: left; float: right">
    <#list expresses as expresses>
        <form class="layui-form" action="" method="post" >
            <table>
                <tr >
                    <td style="width: 300px;margin: 15px"><input type="text" name="expnum" id="expnum" value="${expresses.expnum}" placeholder="运单编号" autocomplete="off" class="layui-input" lay-verify="required\number" onfocus=this.blur()></td>
                    <td style="width: 300px;margin: 15px"><input type="text" name="recipient" id="recipient" value="${expresses.recipient}"  placeholder="收件人姓名" autocomplete="off" class="layui-input" lay-verify="required"></td>
                </tr>
                <tr>
                    <td style="width: 600px;margin: 15px">
                        <#--                省市县级联-->
                        <div class="layui-form-item">
                            <div class="layui-input-inline">
                                <select name="provid" id="provid" lay-filter="provid">
                                    <option value="${expresses.recprovince}">${expresses.recprovince}</option>
                                </select>
                            </div>
                            <div class="layui-input-inline">
                                <select name="cityid" id="cityid" lay-filter="cityid">
                                    <option value="${expresses.reccity}">${expresses.reccity}</option>
                                </select>
                            </div>
                           <div class="layui-input-inline">
                                <select name="areaid" id="areaid" lay-filter="areaid">
                                    <option value="${expresses.reccounty}">${expresses.reccounty}</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>

            <table>
                <tr>
                    <td style="width: 600px;margin: 15px;row-span: 2"><input type="text" name="recdetailaddress"  id="recdetailaddress" value="${expresses.recdetailaddress}" placeholder="详细地址" autocomplete="off" class="layui-input" lay-verify="required"></td>
                </tr>
                <tr>
                   <td style="width: 300px;margin: 15px"><input type="text" name="recphone" id="recphone" value="${expresses.recphone}" placeholder="收件人电话" autocomplete="off" class="layui-input" lay-verify="required\number\phone" ></td>
                </tr>
                <tr>
                    <td style="row-span: 2">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="tj">确认修改</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </td>
                </tr>
            </table>

        </form>
    </#list>
</div>

</div>
</body>
<script type="text/javascript">
    var upurl = "{:url('xiaoguotu/upload')}"; //上传图片地址

    layui.use(['upload','table','form'], function(){
        var table = layui.table;
        var upload=layui.upload;
        var form=layui.form;


        form.on('submit(tj)', function(data){
            $.ajax({
                url:'/admin/express/updatedata',
                method:'post',
                data:{expnum:$("#expnum").val(),
                    recphone:$("#recphone").val(),
                    provid:$("#provid option:selected").text(),
                    cityid:$("#cityid option:selected").text(),
                    areaid:$("#areaid option:selected").text(),
                    recdetailaddress:$("#recdetailaddress").val()
                        },
                dataType:'JSON',
                success:function(res){
                    if(res.code='0'){
                        parent.closeIframe(res.msg);
                    }
                    else
                        alert(res.msg);
                },
                error:function (data) {

                }
            });
            var index=parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            window.parent.location.reload();

        });

    });
</script>
</html>