<cfoutput>
<header class="site-header clearfix">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light main-navigation pl-0 pr-0">
			<cfif cb.themeSetting( 'headerLogo' ) is "">
				<a href="#cb.linkHome()#" class="navbar-brand" title="#cb.siteTagLine()#" data-toggle="tooltip"><strong>#cb.siteName()#</strong></a>
			<cfelse>
				<a href="#cb.linkHome()#" class="navbar-brand brand-img" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#"></a>
			</cfif>

			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse main-nav" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<cfset menuData = cb.rootMenu( type="data", levels="2" )>
					<!--- Iterate and build pages --->
					<cfloop array="#menuData#" index="menuItem">
						<cfif structKeyExists( menuItem, "subPageMenu" )>
							<li class="dropdown">
								<a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <i class="fa fa-angle-down"></i></b></a>
								#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
							</li>
						<cfelse>
							<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
								<li class="active">
							<cfelseif cb.isHomePage() AND menuItem.title eq 'Home'>
								<li class="active">
							<cfelse>
								<li>
							</cfif>
								<a href="#menuItem.link#">#menuItem.title#</a>
							</li>
						</cfif>
					</cfloop>

					<!--- Blog Link, verify active --->
					<cfif (!structKeyExists(prc.cbSettings, "cb_site_disable_blog"))>
						<cfif cb.isBlogView()><li class="active"><cfelse><li></cfif>
							<a href="#cb.linkBlog()#">Blog</a>
						</li>
					</cfif>
				</ul>
		  	</div>
		</nav>
	</div>
</header>

<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu">';

	// Parent
	menu &= '<li><a href="#parentLink#">#parentTitle#</a></li><li role="separator" class="divider"></li>';

	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>