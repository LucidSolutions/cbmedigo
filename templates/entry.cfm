<cfoutput>
<cfif len( cb.themeSetting( 'blogLayout' ) )>
	<cfif cb.themeSetting( 'blogLayout' ) eq 'Two Column'>
		<div class="col-md-12 col-lg-6">
	<cfelse>
		<div class="col-md-12 col-lg-12">
	</cfif>
		<div class="post-blog" id="post_#entry.getContentID()#">
			<cfif entry.getFeaturedImageURL() NEQ "">
				<div class="blog-image"><a href="#cb.linkEntry(entry)#" title="#entry.getTitle()#"><img class="img-fluid" src="#entry.getFeaturedImageURL()#" alt="#entry.getTitle()#"></a></div>
			</cfif>

			<div class="blog-content">
				<span class="meta-date"><a href="#cb.linkEntry(entry)#">#entry.getDisplayPublishedDate()#</a></span>
				<cfif entry.getNumberOfApprovedComments() GT 0>

					<span class="meta-comments"><a href="#cb.linkEntry(entry)#">#entry.getNumberOfApprovedComments()# Comments</a></span>
				</cfif>
				<span class="meta-author"><a href="#cb.linkEntry(entry)#">#entry.getAuthorName()#</a></span>
				<h3><a href="#cb.linkEntry(entry)#">#entry.getTitle()#</a></h3>
				<p class="light-text"> #left(ReReplaceNoCase(entry.renderContent(),"<[^>]*>","","ALL"),200)# <a href="#cb.linkEntry(entry)#">Continue Reading...</a></p>
			</div>
		</div>
	</div>
</cfif>
</cfoutput>