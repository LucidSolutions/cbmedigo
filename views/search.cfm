<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_prePageDisplay" )#

	<section id="body-main" class="search-section">

		<!--- search Results --->
		<div class="container">
			<h2 class="mb-3"><strong>Search Results</strong></h2>

			<!--- Search Results --->
			#cb.getSearchResultsContent()#

			<!--- Search paging --->
			#cb.quickSearchPaging()#
		</div>

	</section>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postPageDisplay" )#
</cfoutput>