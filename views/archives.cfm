<cfoutput>
	
<div class="first-widget parallax" id="blog">
	<div class="parallax-overlay">
		<div class="container pageTitle" style="background-position: 50% 32px;">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<h2 class="page-title">Blog Detail</h2>
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
				#cb.event( "cbui_preArchivesDisplay" )#

				<!--- Archives --->
				<cfif rc.year NEQ 0>
					<p class="infoBar h2 mb-3"><strong>Blog Archives - #prc.entriesCount# Record(s)</strong></p>
					<p class="buttonBar"><a href="#cb.linkBlog()#" class="mainBtn" title="Remove filter and view all entries">Remove Filter</a></p>
					<div class="alert alert-info">
						Year: '#rc.year#' <cfif rc.month NEQ 0>- Month: '#rc.month#'</cfif> <cfif rc.day NEQ 0>- Day: '#rc.day#'</cfif>
					</div>
					<br/>
				</cfif>

				<!---
					Display Entries using ContentBox collection template rendering
					The default convention for the template is "entry.cfm" you can change it via the quickEntries() 'template' argument.
					I could have done it manually, but why?
				 --->
				<div class="row">#cb.quickEntries()#</div>

				<!--- Paging via ContentBox via quick HTML, again I could have done it manually, but why? --->
				<cfif prc.entriesCount>
					<div class="contentBar">
						#cb.quickPaging()#
					</div>
				</cfif>

				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postArchivesDisplay" )#
			</div>

			<!--- SideBar: That's right, I can render any layout views by using quickView() or coldbox render methods --->
			<cfif args.sidebar>
				<div class="col-md-4" id="blog-sidenav">
					<div class="sidebar">
						#cb.quickView(view='_blogsidebar', args=args)#
					</div>
				</div>
			</cfif>
		</div>
	</div>
</section>		
</cfoutput>