<cfoutput>
<div class="media" id="comment_#comment.getCommentID()#">
    #cb.quickAvatar( author=comment.getAuthorEmail(), size=60 )#
    <div class="media-body ml-3">
        <div class="media-heading">
        	<h4>
        		<cfif len( comment.getAuthorURL() )>
					<a href="<cfif NOT findnocase( "http", comment.getAuthorURL() )>http://</cfif>#comment.getAuthorURL()#" title="Open #comment.getAuthorURL()#"><i class="icon-link"></i>
						<strong>#comment.getAuthor()#</strong>
					</a>
				</cfif>
        	</h4> 
        	<span>#dateFormat(comment.getDisplayCreatedDate(),"dd mmmm yyyy" )#</span>
        </div>
        <p>#comment.getDisplayContent()#</p>
    </div>
</div>
</cfoutput>