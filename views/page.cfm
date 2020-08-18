<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">

<!--- If homepage, present homepage jumbotron --->
<cfif cb.isHomePage()>
	<section id="homeIntro" class="parallax first-widget" style="background-position: 50% -31px;">
	    <div class="parallax-overlay">
		    <div class="container home-intro-content">
		        <div class="row">
		        	<div class="col-md-12">
		        		#prc.page.getExcerpt()#
		        	</div>
		        </div>
		    </div>
	    </div>
	</section>
<cfelse>
	<div class="first-widget parallax" id="#listfirst(cb.getCurrentPage().getSlug(),'/')#">
		<div class="parallax-overlay">
			<div class="container pageTitle" style="background-position: 50% 32px;">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<h2 class="page-title">#prc.page.getTitle()#</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</cfif>

<!--- ContentBoxEvent --->
#cb.event( "cbui_prePageDisplay" )#

<!--- Body Main --->
<section id="body-main">
	<div class="container">
		<div class="col-md-12">
			<!--- Render Content --->
			#prc.page.renderContent()#
    	</div>
	</div>
</section>

<!--- ContentBoxEvent --->
#cb.event("cbui_postPageDisplay")#
</cfoutput>