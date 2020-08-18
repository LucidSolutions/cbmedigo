<cfoutput>
<title>#cb.getContentTitle()#</title>

<!--- ********************************************************************************* --->
<!--- 					META TAGS														--->
<!--- ********************************************************************************* --->
<meta charset="utf-8" /> 
<meta name="generator" 	 	content="ContentBox powered by ColdBox" />
<meta name="robots" 	 	content="index,follow" />
<meta name="viewport" 		content="width=device-width, initial-scale=1">
<meta name="description" 	content="#cb.getContentDescription()#" />
<meta name="keywords" 	 	content="#cb.getContentKeywords()#" />

#cb.getOpenGraphMeta()#

<!--- Base HREF for SES enabled URLs --->
<base href="#cb.siteBaseURL()#" />

<!--- ********************************************************************************* --->
<!--- 					RSS DISCOVERY													--->
<!--- ********************************************************************************* --->
<cfif cb.themeSetting( "rssDiscovery", true )>
	<link rel="alternate" type="application/rss+xml" title="Recent Page Updates" href="#cb.linkPageRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Page Comment Updates" href="#cb.linkPageRSS(comments=true)#" />	
	<link rel="alternate" type="application/rss+xml" title="Recent Content Updates" href="#cb.linkSiteRSS()#" />
	<link rel="alternate" type="application/rss+xml" title="Recent Content Comment Updates" href="#cb.linkSiteRSS(comments=true)#" />
	<!--- RSS Discovery If In View Mode --->
	<cfif cb.isPageView() and cb.getCurrentPage().getAllowComments()>
		<link rel="alternate" type="application/rss+xml" title="Pages's Recent Comments" href="#cb.linkPageRSS( comments=true, page=cb.getCurrentPage() )#" />
	</cfif>
</cfif>

<!--- ********************************************************************************* --->
<!--- 					GOOGLE FONTS													--->
<!--- ********************************************************************************* --->

<link href="http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700itali" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Raleway:400,900,800,700,500,200,100,600" rel="stylesheet">

<!--- ********************************************************************************* --->
<!--- 					CSS 															--->
<!--- ********************************************************************************* --->

<!-- injector:css -->
<link rel="stylesheet" href="#cb.themeRoot()#/includes/css/01464828.theme.min.css">
<!-- endinjector -->

</cfoutput>