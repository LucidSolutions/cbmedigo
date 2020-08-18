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
			<div class="<cfif args.sidebar>col-md-8<cfelse>col-md-12</cfif> blog-posts">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_preEntryDisplay")#
				<div class="row">
					<div class="col-md-12">
						<div class="post-blog" id="post_#prc.entry.getContentID()#">
							<cfif prc.entry.getFeaturedImageURL() NEQ "">
								<div class="blog-image"><img class="img-fluid" src="#prc.entry.getFeaturedImageURL()#" alt="#prc.entry.getTitle()#"></div>
							</cfif>

							<div class="blog-content">
								<span class="meta-date"><a href="#cb.linkEntry(prc.entry)#">#prc.entry.getDisplayPublishedDate()#</a></span>

								<cfif prc.entry.getNumberOfApprovedComments() GT 0>
									<span class="meta-comments"><a href="#cb.linkEntry(prc.entry)#">#prc.entry.getNumberOfApprovedComments()# Comments</a></span>
								</cfif>
								<span class="meta-author"><a href="#cb.linkEntry(prc.entry)#">#prc.entry.getAuthorName()#</a></span>
								<h3><a href="#cb.linkEntry(prc.entry)#">#prc.entry.getTitle()#</a></h3>
								
								#prc.entry.renderContent()#
								
								<div class="tag-items">
		                            <span class="small-text">Tags:</span>
		                            #cb.quickCategoryLinks(prc.entry)#
		                        </div>
							</div>
						</div>
					</div>
				</div>

				<cfif prc.entry.getNumberOfApprovedComments() GT 0>
					<div class="row">
						<div class="col-md-12">
	                        <div id="blog-comments" class="blog-post-comments">
	                            <h3>#prc.entry.getNumberOfApprovedComments()# Comments</h3>
	                            <div class="blog-comments-content">
	                                #cb.quickComments()#
	                            </div>
	                        </div>
	                    </div>
					</div>
				</cfif>

				<cfif !args.print>
					<div class="row">
	                    <div class="col-md-12">
	                        <div class="comment-form">
	                            <h3>Leave a comment</h3>
	                            <div class="widget-inner">
	                            	#cb.quickCommentForm( prc.entry )#
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</cfif>
		
				<!--- ContentBoxEvent --->
				#cb.event("cbui_postEntryDisplay")#
		
			</div>
		
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