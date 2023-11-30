<cfoutput>
<footer class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<nav class="footer-nav clearfix">
					<ul class="footer-menu">
                        <cfset menuData = cb.rootMenu( type="data", levels="2" )>
                        <cfloop array="#menuData#" index="menuItem">
                            <cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
                                <li>
                            <cfelse>
                                <li> 
                            </cfif>
                                <a href="#menuItem.link#">#menuItem.title#</a>
                            </li>
                        </cfloop>

                        <!--- Blog Link, verify active --->
                        <cfif (!structKeyExists(prc.cbSettings, "cb_site_disable_blog"))>
                            <cfif cb.isBlogView()><li><cfelse><li></cfif>
                                <a href="#cb.linkBlog()#">Blog</a>
                            </li>
                        </cfif>
                    </ul>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<p class="copyright-text">Theme Developed By <a href="https://lucidoutsourcing.com/">Lucid Outsourcing Solutions Pvt. Ltd.</a></p>
                <div>#cb.themeSetting( 'footerBox' )#</div>
			</div>
		</div>
	</div>
	<!--- contentboxEvent --->
	#cb.event( "cbui_footer" )#
</footer>
</cfoutput>