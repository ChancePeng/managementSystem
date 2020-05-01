<%--
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/5/30
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <meta charset="utf-8">
  <title>Login</title>
  <meta name="viewport" content="width=device-width,nitial-scale=1.0">
  <script src="js/jquery-3.3.1.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
  <script src="js/bootstrap.js"></script>
  <link rel="stylesheet" href="css/index.css">
</head>

<body>
<div class="container">
  <div class="nav myNav col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">公司门户界面</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页</a></li>
            <li><a href="#">宏观</a></li>
            <li><a href="#">财经</a></li>
            <li><a href="#">行业</a></li>
            <li><a href="#">营商</a></li>
            <li><a href="#">招商</a></li>
            <li><a href="#">区域</a></li>
            <li><a href="loginForward">管理系统</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">公司</a></li>
                <li><a href="#">招聘</a></li>
                <li><a href="#">入职</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">请登录<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">切换</a></li>
                <li><a href="#">注销</a></li>
                <li><a href="#">个人信息</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
  </div>
  <div class="main">
    <h1 class="col-xs-12">SystemManagement</h1>
    <span class="glyphicon glyphicon-chevron-down span" aria-hidden="true"></span>
  </div>
  <div class="center" id="center">
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box low">
      <span>Hello You Come here</span>
      <p>Join</p>
    </div>
  </div>
  <div class="footer">
    <h2>欢迎来到门户网站</h2>
    <div class="box">
      <span class="glyphicon glyphicon-tags"></span>
      <h3>title</h3>
      <p class="name">提起小溪</p>
      <p>提起小溪，我们自然会想到鱼呀，虾呀，还有长着巨螯的螃蟹。清澈可饮的溪水，大大小小暗褐色的石头，圆的、扁的和着水的欢快，恬静如暖阳下的瞌睡，是那样地让人心旷神怡。小溪是小孩的乐园，水不深，浅处刚好湿及鞋底，踩在上面，水花四溅，不想湿鞋的在凸出水面的石块上蜻蜓点水似地跳跃，这样可以练就一身好轻功，没几个人确信，要不早就如同广场舞一样火得乱七八糟。当然若一味地坚持每天这样欢快的练下去，腿部力量肯定会增加不少，这于男孩自然是好事，女孩不喜欢粗大腿，跳一两下便找个酸痛的借口，踩到水里去了。</p>
      <p class="low">Join in</p>
    </div>
    <div class="box">
      <span class="glyphicon glyphicon-tags"></span>
      <h3>title</h3>
      <p class="name">提起小溪</p>
      <p>提起小溪，我们自然会想到鱼呀，虾呀，还有长着巨螯的螃蟹。清澈可饮的溪水，大大小小暗褐色的石头，圆的、扁的和着水的欢快，恬静如暖阳下的瞌睡，是那样地让人心旷神怡。小溪是小孩的乐园，水不深，浅处刚好湿及鞋底，踩在上面，水花四溅，不想湿鞋的在凸出水面的石块上蜻蜓点水似地跳跃，这样可以练就一身好轻功，没几个人确信，要不早就如同广场舞一样火得乱七八糟。当然若一味地坚持每天这样欢快的练下去，腿部力量肯定会增加不少，这于男孩自然是好事，女孩不喜欢粗大腿，跳一两下便找个酸痛的借口，踩到水里去了。</p>
      <p class="low">Join in</p>
    </div>
    <div class="box">
      <span class="glyphicon glyphicon-tags"></span>
      <h3>title</h3>
      <p class="name">提起小溪</p>
      <p>提起小溪，我们自然会想到鱼呀，虾呀，还有长着巨螯的螃蟹。清澈可饮的溪水，大大小小暗褐色的石头，圆的、扁的和着水的欢快，恬静如暖阳下的瞌睡，是那样地让人心旷神怡。小溪是小孩的乐园，水不深，浅处刚好湿及鞋底，踩在上面，水花四溅，不想湿鞋的在凸出水面的石块上蜻蜓点水似地跳跃，这样可以练就一身好轻功，没几个人确信，要不早就如同广场舞一样火得乱七八糟。当然若一味地坚持每天这样欢快的练下去，腿部力量肯定会增加不少，这于男孩自然是好事，女孩不喜欢粗大腿，跳一两下便找个酸痛的借口，踩到水里去了。</p>
      <p class="low">Join in</p>
    </div>
  </div>
</div>
<script>
  var center = document.getElementById('center');
  var aBox = center.getElementsByClassName('box');
  var imgUrl = ['img/1.jpg','img/2.jpg','img/3.jpg','img/4.jpg','img/5.jpg','img/6.jpg'];
  for(var i=0;i<aBox.length-1;i++){
    aBox.index = i;
    showImg(aBox[i],imgUrl[i]);
  }
  function showImg(box,imgUrl){
    box.style.background = 'url('+imgUrl+') no-repeat 50% 50%';
    box.style.backgroundSize = '100% 100%';


  }
</script>

</body>

</html>
