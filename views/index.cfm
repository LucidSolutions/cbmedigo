<cfoutput>
<div class="first-widget parallax" id="blog">
	<div class="parallax-overlay">
		<div class="container pageTitle" style="background-position: 50% 32px;">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<h2 class="page-title">Blog</h2>
				</div>
			</div>
		</div>
	</div>
</div>

<!--- Body Main --->
<section id="body-main">
	<div class="container">	
		<div class="row">
			<!--- Content --->
			<div class="col-md-8 blog-posts">
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preIndexDisplay" )#
					
				<!--- Are we filtering by category? --->
				<cfif len( rc.category )>
					<p class="infoBar h2 mb-3"><strong>Category Filtering: '#rc.category#'</strong></p>
					<p class="buttonBar"><a href="#cb.linkBlog()#" class="mainBtn" title="Remove filter and view all entries">Remove Filter</a></p>
					<br/>
				</cfif>
		
				<!--- Are we searching --->
				<cfif len( rc.q )>
					<p class="infoBar h2 mb-3"><strong>Searching by: '#rc.q#'</strong></p>
					<p class="buttonBar"><a href="#cb.linkBlog()#" class="mainBtn" title="Clear search and view all entries">Clear Search</a></p>
					<br/>
				</cfif>
		
				<!--- Entries displayed here --->
				<div class="row">#cb.quickEntries()#</div>
		
				<!--- Pagination --->
				<cfif prc.entriesCount>
					<div class="contentBar">
						#cb.quickPaging()#
					</div>
				</cfif>
		
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postIndexDisplay" )#
			</div>
		
			<!--- SideBar --->
			<cfif args.sidebar>
			<div class="col-md-4">
				<div class="sidebar">
					#cb.quickView( view='_blogsidebar', args=args )#
				</div>
			</div>
			</cfif>
		
		</div>
	</div>
</section>		
</cfoutput>