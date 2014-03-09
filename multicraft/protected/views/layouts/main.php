<?php
/**
 *
 *   Copyright © 2010-2012 by xhost.ch GmbH
 *
 *   All rights reserved.
 *
 **/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!--
 -
 -   Copyright © 2010-2012 by xhost.ch GmbH
 -
 -   All rights reserved.
 -
 -->
<head>
	<meta content="initial-scale=1.0, width=device-width, user-scalable=yes" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<link rev="made" href="mailto:multicraft@xhost.ch">
	<meta name="description" content="Multicraft: The Minecraft server control panel">
	<meta name="keywords" content="Multicraft, Minecraft, server, management, control panel, hosting">
	<meta name="author" content="xhost.ch GmbH">

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('screen.css') ?>" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('print.css') ?>" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('ie.css') ?>" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('main.css') ?>" />
	<link rel="stylesheet" type="text/css" href="<?php echo Theme::css('form.css') ?>" />

	<link href="http://localhost:8001/css/style.css" media="all" rel="stylesheet" type="text/css" />
	<link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="//use.typekit.net/ace7bsp.js"></script>
	<script type="text/javascript">try{Typekit.load();}catch(e){}</script>

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>
	<div class="page-wrap">
		<div class="container">
			<nav class="navbar" role="navigation" id="page-navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon icon-list"></span>
						</button>
					</div>

					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Plans</a>
								<ul class="dropdown-menu">
									<li><a href="/minecraft">Minecraft</a></li>
									<li><a href="/dedicated">Dedicated</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">About</a>
								<ul class="dropdown-menu">
									<li><a href="/about">About Us</a></li>
									<li><a href="/about#careers">Careers</a></li>
									<li><a href="/partnerships">Partnerships</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="http://panel.mineocityhosting.com">Panel</a></li>
							<li><a href="https://client.mineocityhosting.com/submitticket.php">Contact</a></li>
						</ul>
						<a class="navbar-brand" href="/">Mineocity Hosting</a>
					</div>
				</div>
			</nav>
		</div>
		<h1 class="page-title orange-banner"><?php echo $this->breadcrumbs[0] ?></h1>
		<div class="row-dark arrow-compact">
			<div class="container">
				<nav class="navbar">
					<?php
					$items = array();

					$simple = (Yii::app()->theme && in_array(Yii::app()->theme->name, array('simple', 'mobile', 'platform')));
					if (!$simple)
						$items[] = array('label'=>Yii::t('mc', 'Home'), 'url'=>array('/site/page', 'view'=>'home'));
					if (@Yii::app()->params['installer'] !== 'show')
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Servers'),
							'url'=>array('/server/index', 'my'=>($simple && !Yii::app()->user->isSuperuser() ? 1 : 0)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Users'),
							'url'=>array('/user/index'),
							'visible'=>(Yii::app()->user->isSuperuser()
								|| !(Yii::app()->user->isGuest || (Yii::app()->params['hide_userlist'] === true) || $simple)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Profile'),
							'url'=>array('/user/view', 'id'=>Yii::app()->user->id),
							'visible'=>(!Yii::app()->user->isSuperuser() && !Yii::app()->user->isGuest
								&& ((Yii::app()->params['hide_userlist'] === true) || $simple)),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Settings'),
							'url'=>array('/daemon/index'),
							'visible'=>Yii::app()->user->isSuperuser(),
						);
						$items[] = array(
							'label'=>Yii::t('mc', 'Support'),
							'url'=>array('/site/report'),
							'visible'=>!empty(Yii::app()->params['admin_email']),
						);
					}
					if (Yii::app()->user->isGuest)
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Login'),
							'url'=>array('/site/login'),
							'itemOptions'=>$simple ? array('style'=>'float: right') : array(),
						);
					}
					else
					{
						$items[] = array(
							'label'=>Yii::t('mc', 'Logout ({name})', array('{name}'=>Yii::app()->user->name)),
							'url'=>array('/site/logout'),
							'itemOptions'=>$simple ? array('style'=>'float: right') : array(),
						);
					}
					$items[] = array(
						'label'=>Yii::t('mc', 'About'),
						'url'=>array('/site/page', 'view'=>'about'),
						'visible'=>$simple,
						'itemOptions'=>array('style'=>'float: right'),
					);
					
					
					$this->widget('zii.widgets.CMenu', array(
						'items'=>$items,
						'htmlOptions' => array('class' => 'nav navbar-nav navbar-center')
					)); ?>
				</nav>
			</div>
		</div><!-- mainmenu -->

		<div class="container">
			<div class="pagecontent">
			
				<?php
					if (!$simple)
					{
						array_pop($this->breadcrumbs);
						$this->widget('zii.widgets.CBreadcrumbs', array(
							'homeLink'=>'',
							'links'=>$this->breadcrumbs,
							'tagName' => 'ol',
							'htmlOptions' => array('class' => 'breadcrumb'),
							'separator' => '',
							'activeLinkTemplate' => '<li><a href="{url}">{label}</a></li>',
							'inactiveLinkTemplate' => '<li class="active">{label}</li>',
						));
					}
				?>

				<?php echo $content; ?>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="col-md-6">
				Copyright 2014. <a href="peet.io">Designed</a>.
			</div>
			<div class="col-md-6">
				<a href="/terms">Terms of Service</a>
			</div>
		</div>
	</footer>
</body>
</html>
