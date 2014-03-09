<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta http-equiv="content-type" content="text/html; charset={$charset}">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
			{if $systemurl}<base href="{$systemurl}">{/if}
	
			<script type="text/javascript" src="templates/{$template}/assets/jquery/js/jquery-1.10.2.min.js"></script>
			<script type="text/javascript" src="templates/{$template}/assets/bootstrap/js/bootstrap.min.js"></script>
			<script src="templates/{$template}/assets/whmcs/js/whmcs.js"></script>

			<link href="http://mineocityhosting.com/css/style.css" media="all" rel="stylesheet" type="text/css"/>
			<script type="text/javascript" src="//use.typekit.net/ace7bsp.js"></script>
			<script type="text/javascript">Typekit.load();</script>
	
			{if $livehelpjs}{$livehelpjs}{/if}
			
			{$headoutput}
		</head>
		<body>

			{$headeroutput}
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
											<li><a href="http://mineocityhosting.com/minecraft">Minecraft</a></li>
											<li><a href="http://mineocityhosting.com/dedicated">Dedicated</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">About</a>
										<ul class="dropdown-menu">
											<li><a href="http://mineocityhosting.com/about">About Us</a></li>
											<li><a href="http://mineocityhosting.com/about#careers">Careers</a></li>
											<li><a href="http://mineocityhosting.com/partnerships">Partnerships</a></li>
										</ul>
									</li>
								</ul>
								<ul class="nav navbar-nav navbar-right">
									<li><a href="http://panel.mineocityhosting.com">Panel</a></li>
									<li><a href="https://client.mineocityhosting.com/submitticket.php">Contact</a></li>
								</ul>
								<a class="navbar-brand" href="http://mineocityhosting.com/">Mineocity Hosting</a>
							</div>
						</div>
					</nav>
				</div>
				<h1 class="page-title orange-banner">{$pagetitle}</h1>
				<div class="row-dark arrow-compact">
					<div class="container">
						<div class="navbar">
							<div class="container-fluid">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
										<span class="sr-only">Toggle Navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>
								<div class="collapse navbar-collapse" id="navbar-collapse-1">
		{if $loggedin}
									<ul class="nav navbar-nav">
										<li><a href="clientarea.php" title="{$LANG.hometitle}">{$LANG.hometitle}</a></li>
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.navservices}">{$LANG.navservices}<b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="clientarea.php?action=products" title="{$LANG.clientareanavservices}">{$LANG.clientareanavservices}</a></li>
												{if $condlinks.pmaddon}<li><a href="index.php?m=project_management" title="{$LANG.clientareaprojects}">{$LANG.clientareaprojects}</a></li>{/if}
												
												<li><a href="cart.php" title="{$LANG.navservicesorder}">{$LANG.navservicesorder}</a></li>
												<li><a href="cart.php?gid=addons" title="{$LANG.clientareaviewaddons}">{$LANG.clientareaviewaddons}</a></li>
											</ul>
										</li>
										{if $condlinks.domainreg || $condlinks.domaintrans}
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.navdomains}">{$LANG.navdomains}<b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="clientarea.php?action=domains" title="{$LANG.clientareanavdomains}">{$LANG.clientareanavdomains}</a></li>
												
												<li><a href="cart.php?gid=renewals" title="{$LANG.navrenewdomains}">{$LANG.navrenewdomains}</a></li>
												{if $condlinks.domainreg}<li><a href="cart.php?a=add&amp;domain=register" title="{$LANG.navregisterdomain}">{$LANG.navregisterdomain}</a></li>{/if}
												{if $condlinks.domaintrans}<li><a href="cart.php?a=add&amp;domain=transfer" title="{$LANG.navtransferdomain}">{$LANG.navtransferdomain}</a></li>{/if}
												{if $enomnewtldsenabled}<li><a href="{$enomnewtldslink}" title="Preregister New TLDs">Preregister New TLDs</a></li>{/if}
												
												<li><a href="domainchecker.php" title="{$LANG.navwhoislookup}">{$LANG.navwhoislookup}</a></li>
											</ul>
										</li>
										{/if}
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.navbilling}">{$LANG.navbilling}<b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="clientarea.php?action=invoices" title="{$LANG.invoices}">{$LANG.invoices}</a></li>
												<li><a href="clientarea.php?action=quotes" title="{$LANG.quotestitle}">{$LANG.quotestitle}</a></li>
												{if $condlinks.addfunds || $condlinks.masspay || $condlinks.updatecc}{/if}
												{if $condlinks.addfunds}<li><a href="clientarea.php?action=addfunds" title="{$LANG.addfunds}">{$LANG.addfunds}</a></li>{/if}
												{if $condlinks.masspay}<li><a href="clientarea.php?action=masspay&amp;all=true" title="{$LANG.masspaytitle}">{$LANG.masspaytitle}</a></li>{/if}
												{if $condlinks.updatecc}<li><a href="clientarea.php?action=creditcard" title="{$LANG.navmanagecc}">{$LANG.navmanagecc}</a></li>{/if}
											</ul>
										</li>
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.navsupport}">{$LANG.navsupport}<b class="caret"></b></a>
											 <ul class="dropdown-menu">
												<li><a href="submitticket.php" title="{$LANG.navopenticket}">{$LANG.navopenticket}</a></li>
												<li><a href="supporttickets.php" title="{$LANG.navtickets}">{$LANG.navtickets}</a></li>
												<li><a href="knowledgebase.php" title="{$LANG.knowledgebasetitle}">{$LANG.knowledgebasetitle}</a></li>
												<li><a href="downloads.php" title="{$LANG.downloadstitle}">{$LANG.downloadstitle}</a></li>
												<li><a href="serverstatus.php" title="{$LANG.networkstatustitle}">{$LANG.networkstatustitle}</a></li>
											</ul>
										</li>
										{if $condlinks.affiliates}
										<li><a href="affiliates.php" title="{$LANG.affiliatestitle}">{$LANG.affiliatestitle}</a></li>
										{/if}
									</ul>
									<ul class="nav navbar-nav navbar-right">
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{$LANG.hello}, {$loggedinuser.firstname}!">{$LANG.hello}, {$loggedinuser.firstname}!<b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="clientarea.php?action=details" title=">{$LANG.editaccountdetails}">{$LANG.editaccountdetails}</a></li>
												<li><a href="clientarea.php?action=contacts" title="{$LANG.clientareanavcontacts}">{$LANG.clientareanavcontacts}</a></li>
												<li><a href="clientarea.php?action=emails" title="{$LANG.navemailssent}">{$LANG.navemailssent}</a></li>
												<li><a href="clientarea.php?action=changepw" title="{$LANG.clientareanavchangepw}">{$LANG.clientareanavchangepw}</a></li>
												
												<li><a href="logout.php" title="{$LANG.logouttitle}">{$LANG.logouttitle}</a></li>
											</ul>
										</li>
									</ul>
		{else}
									<ul class="nav navbar-nav">
										<li><a href="index.php" title="{$LANG.hometitle}">{$LANG.hometitle}</a></li>
										<li><a href="announcements.php">{$LANG.announcementstitle}</a></li>
										<li><a href="knowledgebase.php">{$LANG.knowledgebasetitle}</a></li>
										<li><a href="serverstatus.php">{$LANG.networkstatustitle}</a></li>
										<li><a href="affiliates.php">{$LANG.affiliatestitle}</a></li>
										<li><a href="contact.php">{$LANG.contactus}</a></li>
									</ul>
									<ul class="nav navbar-nav navbar-right">
										<li class="dropdown">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">{$LANG.account} <b class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a href="clientarea.php">{$LANG.login}</a></li>
												<li><a href="register.php">{$LANG.register}</a></li>
												
												<li><a href="pwreset.php">{$LANG.forgotpw}</a></li>
											</ul>
										</li>
									</ul>
		{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div id="whmcsbody" class="container">
