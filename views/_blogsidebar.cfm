<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#

<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
<div class="sidebar-widget">
	#cb.widget( "BlogSearchForm" )#
</div>
</cfif>

<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
<div class="sidebar-widget">
	<h5 class="widget-title">Recent Posts</h5>
	#cb.widget( 'RecentPosts' )#
</div>
</cfif>

<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
<div class="sidebar-widget categories">
	<h5 class="widget-title">Categories</h5>
	<!---
	Display Categories using ContentBox collection template rendering
	the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.
	--->
	<ul>
		#cb.quickCategories()#
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
<!--- RSS Buttons --->
<div class="sidebar-widget">
	<h5 class="widget-title">Site Updates</h5>
	<ul>
		<li><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fa fa-rss"></i> RSS Feed</a></li>
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showArchivesBlogSide", true )>
<div class="sidebar-widget">
	<h5 class="widget-title">Archives</h5>
	#cb.widget( "Archives" )#
</div>
</cfif>
<!---#cb.widget("Meta",{titleLevel="4"})#--->

<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>