<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<title>博客列表</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- HTTP 1.1 -->
<meta http-equiv="pragma" content="no-cache">
<!-- HTTP 1.0 -->
<meta http-equiv="cache-control" content="no-cache">
<!-- Prevent caching at the proxy server -->
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
<!-- jQuery -->
<script type="text/javascript" src="static/jquery/jquery-1.12.4.min.js"></script>
<!-- bootstrap -->
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css" >
<link rel="stylesheet" href="static/css/me.css">
<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="static/css/app.css?v=1" rel="stylesheet">
</head>
<body>
<nav  class="ui inverted attached segment m-padded-tb-mini m-shadow-small" >
    <div class="ui container">
        <div id="article_list_container" class="ui inverted secondary  menu">
            <h1 class="ui purple header item">MyBlog</h1>
            <a id="article_add_btn"  href="jsp/articleDetail.jsp?userAccout=stu&type=add" class=" m-item item " role="button" target="_blank">
                <i class="edit icon"></i>发布博客</a>

            <a id="article_update_btn" href="javascript:void(0);" class="m-item item" role="button" target="_blank">
                <i class=" pencil alternate icon"></i>修改</a>

            <a id="article_delete_btn" href="javascript:void(0);" class="m-item item">
                <i class=" trash icon"></i>删除</a>
            <a id="aboutme_btn" href="javascript:void(0);" class="m-item item "><i class=" info icon"></i>关于我</a>
        </div>

    </div>
</nav>
<div  class="m-container m-padded-tb-big">
    <div class="ui container">
        <div id="article_list_div"></div>

        <div class="modal fade" id="delete_confirm"  role="dialog"
             aria-labelledby="delete_confirm_label">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="delete_confirm_label">操作提示</h4>
                    </div>
                    <div class="modal-body">
                        <label>确认要删除选中的数据吗？</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="article_delete_submit" class="btn btn-primary"
                                data-dismiss="modal">
                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>确认
                        </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--底部footer-->
<footer  class="ui inverted vertical segment m-padded-tb">
    <div class="ui center aligned container">
        <div class="ui inverted divided  grid">

            <div class="five wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="static/images/vx.png" class="ui rounded image" alt="" style="width: 110px">
                    </div>
                </div>
            </div>
            <div class="five wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced ">其它联系方式</h4>
                <div class="ui inverted link list">
                    <p class="item m-text-thin">Email：lst9608@163.com</p>
                    <p class="item m-text-thin">QQ：1934486989</p>
                </div>
            </div>

            <div class="six wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced ">个人读物分享</h4>
                <p class="m-text-thin m-text-spaced m-opacity-mini">我的个人博客，这里我会记录我读过的一些我认为写的
                    比较好的书，希望可以给大家推荐到好书</p>
            </div>
        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced m-opacity-tiny">Copyright © 2019 - 2050 Lishuting Designed by Lishuting</p>
    </div>
</footer>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>

    </body>

<script type="text/javascript">

    var devToken = '<%=request.getParameter("devToken")%>';
    var devUri = "";
    if (typeof devToken === 'string'  &&  devToken.length  >  0){
        devUri = "devToken="+devToken;
    }

    // 点击文章列表中的数据：当前行选中，其他行取消选中
    function chooseArticle(id){
        $('.article_check').each(function(index){
            // 这里的this是html dom对象，直接使用.属性取值
            // 使用jquery对象为$(this)，获取chechbox的状态用$(this).prop("checked")或者$(this).is(":checked")
            if(id == this.value){
                if(!this.checked){
                    this.checked = true;
                }
            }else{
                this.checked = false;
            }
        });
        resetArticleBtns();
    }
    // 初始化及重置按钮组状态
    function resetArticleBtns(){

        // 获取当前选中的文章并集中到数组
        var checked = new Array();
        $('.article_check:checked').each(function(){
            checked.push($(this).val());
        });
        checked = checked || new Array();

        // 未选中时不可操作删除按钮，其他情况可以删除
        if(checked.length==0){
            $("#article_delete_btn").addClass("disabled");
        }else{
            $("#article_delete_btn").removeClass("disabled");
        }

        // 只选中一条文章才能修改
        if(checked.length==1){
            $("#article_update_btn").removeClass("disabled");
        }else{
            $("#article_update_btn").addClass("disabled");
        }
    }
    $(function(){
        if (devUri.length  >  0){
            var addUri = $("#article_add_btn").attr("href");
            $("#article_add_btn").attr("href", addUri+"&"+devUri);
        }
        // 获取文章列表数据
        $.get('articleList?id=1', function(json) {
            if(json.success){
                var data = json.data;
                var contents = "";
                for(var i in data){
                    contents += '<div id="article_div'+data[i].id+'" class="input-group">';
                    contents += 	'<span class="input-group-addon">';
                    contents += 		'<input class="article_check" type="checkbox" value="'
                        +data[i].id+'" onclick="resetArticleBtns()">';
                    contents += 	'</span>';
                    contents += 	'<a href="javascript:void(0);" onclick="chooseArticle('+data[i].id+')" class="list-group-item">';
                    contents += 		data[i].title;
                    contents += 	'</a>';
                    contents += '</div>';
                }
                $('#article_list_div').html(contents);
                resetArticleBtns();
            }else{
                alert("文章列表获取失败："+json.message);
            }
        });

        // 修改文章：新开窗口
        $("#article_update_btn").click(function(){
            var id = $('.article_check:checked:first-child').val();
            var uri = "jsp/articleDetail.jsp?type=update&id="+id;
            if(devUri.length>0){
                uri += "&"+devUri;
            }
            window.open(uri);
        });
        $("#aboutme_btn").click(function(){
            window.open("jsp/aboutme.jsp");
        });

        // 点击删除文章按钮：弹出确认框
        $("#article_delete_btn").click(function(){
            $('#delete_confirm').modal("show")
        });

        // 删除文章：在弹出窗确认后调用删除接口
        $("#article_delete_submit").click(function(){
            var checked = new Array();
            $('.article_check:checked').each(function(){
                checked.push($(this).val());
            });
            $.get("articleDelete?ids="+checked.join(",")+"&"+devUri, function(json){
                if(json.success){
                    for(var i in checked){
                        $("#article_div"+checked[i]).remove();
                    }
                }else{
                    var message = "删除文章失败："+json.message;
                    if(devUri.length>0){
                        message += "\n";
                        message += json.stackTrace;
                    }
                    alert(message);
                }
            });
        });


    });

</script>
</html>