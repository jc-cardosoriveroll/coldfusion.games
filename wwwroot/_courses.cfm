<cfoutput>
    <!--==================================================-->
	<!-- Start Course  Area -->
	<!--==================================================-->
	<div class="course-area inner-page">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-12">
					<div class="section-title wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1s">
						<div class="section-main-title">
							<h2>Learn to Code</h2>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12">
                    <ul class="course-menu d-flex justify-content-center wow fadeInUp" data-wow-delay="0.4s" data-wow-duration="1s">
                        <li class=""><a href="##!" data-mixitup-control="" data-filter=".Bas" class="">Basic</a></li>
                        <li class=""><a href="##!" data-mixitup-control="" data-filter=".Int" class="">Intermediate</a></li>
                        <li class=""><a href="##!" data-mixitup-control="" data-filter=".Adv" class="">Advanced</a></li>
                    </ul>
                </div>
			</div>
			<div class="row filters" id="MixItUp7324BF">
                <!--- Loop Courses --->
                <cfloop from="1" to="#arraylen(items)#" index="c">
                    <cfset item = items[c]>
                    <div class="col-lg-4 col-md-6 mix #left(item.level,3)#">
                        <div class="course-single-box wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1s">
                            <div class="course-thumb">
                                <img src="#item.cover#" alt="#item.name#">
                                <img src="#item.cover#" alt="#item.name#">
                                <div class="course-rating">
                                    <div class="course-star float-end text-right">
                                        <span>#item.name#</span>
                                    </div>
                                </div>
                            </div>
                            <div class="course-content">
                                <div class="course-meta">
                                    <span><i class="bi bi-book"></i> <a href="javascript:view(#item.id#);">TUTORIAL</a></span>
                                    <span><i class="bi bi-clock"></i>  <a href="javascript:view(#item.id#);">DEMO</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </cfloop>
			</div>
		</div>
	</div>
	<!--==================================================-->
	<!-- End Course  Area -->
	<!--==================================================-->
</cfoutput>