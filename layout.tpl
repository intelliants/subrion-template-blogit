<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
	<head>
		{ia_hooker name='smartyFrontBeforeHeadSection'}

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>{ia_print_title}</title>
		<meta name="description" content="{$core.page['meta-description']}">
		<meta name="keywords" content="{$core.page['meta-keywords']}">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="generator" content="Subrion CMS - Open Source Content Management System">
		<meta name="robots" content="index">
		<meta name="robots" content="follow">
		<meta name="revisit-after" content="1 day">
		<base href="{$smarty.const.IA_URL}">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

		{ia_add_media files='jquery, subrion, bootstrap' order=0}
		{ia_print_js files='_IA_TPL_app' order=999}

		{ia_hooker name='smartyFrontAfterHeadSection'}

		{ia_print_css display='on'}

		{ia_add_js}
			intelli.pageName = '{$core.page.name}';

			{foreach $core.customConfig as $key => $value}
				intelli.config.{$key} = '{$value}';
			{/foreach}
		{/ia_add_js}
	</head>

	<body class="page-{$core.page.name}">
		<header class="header"{if $core.config.website_bg} style="background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.website_bg}');"{/if}>
			<nav class="navbar navbar-default">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<a class="navbar-brand{if !$core.config.enable_text_logo} navbar-brand--img{/if}" href="{$smarty.const.IA_URL}">
							{if $core.config.enable_text_logo}
								{$core.config.logo_text}
							{else}
								{if !empty($core.config.site_logo)}
									<img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
								{else}
									<img src="{$img}logo.png" alt="{$core.config.site}">
								{/if}
							{/if}
						</a>
					</div>
				</div>
			</nav>
			
			{ia_blocks block='teaser'}

			<div class="header__nav">{ia_blocks block='mainmenu'}</div>

		</header>

		{ia_hooker name='smartyFrontBeforeBreadcrumb'}
		{include 'breadcrumb.tpl'}

		<div class="content">
			<div class="content__wrap">

				{ia_blocks block='top'}

				{if 'index' != $core.page.name}
					{ia_hooker name='smartyFrontBeforeNotifications'}
					{include 'notification.tpl'}

					{ia_hooker name='smartyFrontBeforeMainContent'}

					<div class="content__body">
						{$_content_}
					</div>

					{ia_hooker name='smartyFrontAfterMainContent'}
				{/if }

				{ia_blocks block='bottom'}
			</div>
		</div>

		<footer class="footer">
			<div class="container">
				{if $core.config.website_social}
					<div class="social">
						{if $core.config.website_social_t}<a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a>{/if}
						{if $core.config.website_social_f}<a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a>{/if}
						{if $core.config.website_social_g}<a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a>{/if}
						{if $core.config.website_social_i}<a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin"></span></a>{/if}
						{if $core.config.website_social_p}<a href="{$core.config.website_social_p}" class="pinterest"><span class="fa fa-pinterest"></i></a>{/if}
					</div>
				{/if}

				<p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}.</p>
				<p>{lang key='footer_text'}</p>
			</div>
		</footer>

		<!-- SYSTEM STUFF -->

		{if $core.config.cron}
			<div style="display: none;">
				<img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
			</div>
		{/if}

		{if isset($manageMode)}
			{include 'visual-mode.tpl'}
		{/if}

		{if isset($previewMode)}
			<p>{lang key='youre_in_preview_mode'}</p>
		{/if}

		{ia_print_js display='on'}

		{ia_hooker name='smartyFrontFinalize'}
	</body>
</html>