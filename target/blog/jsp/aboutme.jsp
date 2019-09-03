<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>关于我</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="../static/css/me.css">
</head>
<body>

<!--导航-->
<nav  class="ui inverted attached segment m-padded-tb-mini m-shadow-small" >
    <div class="ui container">
        <div class="ui inverted secondary  menu">
            <h2 class="ui pink header item">MyBlog</h2>
        </div>
    </div>

</nav>

<!--中间内容-->
<div  class="m-container m-padded-tb-big animated fadeIn">
    <div class="ui container">

        <div class="ui stackable grid">
            <div class="eleven wide column">
                <div class="ui segment">
                    <img src="https://unsplash.it/800/600?image=1004" alt="" class="ui rounded image">
                </div>
            </div>
            <div class="five wide column">
                <div class="ui top attached segment">
                    <div class="ui blue header">关于我</div>
                </div>
                <div class="ui attached segment">
                    <p class="m-text">每天读一读书可以使我的内心平静下来，不论是名著还是各种网络小说我都很喜欢看。我喜欢通过书本体验不一样的生活</p>
                    <p class="m-text">现在我想把我读过的书记录下来，与大家一起分享.如果你们有觉得写的很好的书也可以推荐给我</p>
                </div>
                <div class="ui attached segment">
                    <div class="ui orange basic left pointing label">编程</div>
                    <div class="ui orange basic left pointing label">读书</div>
                    <div class="ui orange basic left pointing label">思考</div>
                    <div class="ui orange basic left pointing label">运动</div>
                </div>
                <div class="ui attached segment">
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">外国名著</div>
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">中国历史</div>
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">中国名著</div>
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">言情小说</div>
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">武侠小说</div>
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">玄幻小说</div>
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">穿越小说</div>
                    <div class="ui yellow basic left pointing label m-margin-tb-tiny">...</div>
                </div>
                <div class="ui bottom attached segment">
                    <a href="https://github.com/lst9608/CashSystem/commit/08c964e3fe2d0b51aa4ca86dba7d67130b788e00"
                       class="ui circular icon button"><i class="github icon"></i></a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" class="ui wechat circular icon button"><i class="weixin icon"></i></a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" class="ui qq circular icon button" data-content="1934486989" data-position="bottom center"><i class="qq icon"></i></a>
                </div>

                <div class="ui wechat-qr flowing popup transition hidden">
                    <img src="../static/images/vx.png" alt="" class="ui rounded image" style="width: 110px">
                </div>
            </div>
        </div>

    </div>
</div>
<!--底部footer-->
<!--底部footer-->
<footer  class="ui inverted vertical segment m-padded-tb">
    <div class="ui center aligned container">
        <div class="ui inverted divided  grid">

            <div class="five wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="../static/images/vx.png" class="ui rounded image" alt="" style="width: 110px">
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
                <p class="m-text-thin m-text-spaced m-opacity-mini">大家好，这是我的个人博客，这里我会分享我读过的一些我认为写的
                    比较好的书，希望可以给大家推荐到好书。如果有小伙伴也读过这本书，可以和我互动讨论哟</p>
            </div>
        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced m-opacity-tiny">Copyright © 2019 - 2050 Lishuting Designed by Lishuting</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>


<script>


    $('.wechat').popup({
        popup : $('.wechat-qr'),
        position: 'bottom center'
    });
    $('.qq').popup();

</script>
</body>
</html>