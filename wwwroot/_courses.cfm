<cfoutput>
    <!--==================================================-->
	<!-- Start Course  Area -->
	<!--==================================================-->
	<div class="course-area inner-page">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-12">
					<div class="section-title wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1s">
						<div class="section-title-shape">
							<img src="estudy/assets/images/resource/section-shape.png" alt="">
						</div>
						<div class="section-sub-title">
							<h4>Browse Categories</h4>
						</div>
						<div class="section-main-title">
							<h2>Top Courses Caterories</h2>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12">
                    <ul class="course-menu d-flex justify-content-center wow fadeInUp" data-wow-delay="0.4s" data-wow-duration="1s">
                        <li class=""><a href="##!" data-mixitup-control="" data-filter=".ios" class="">Engineering</a></li>
                        <li class=""><a href="##!" data-mixitup-control="" data-filter=".and" class=""> Data science</a></li>
                        <li class=""><a href="##!" data-mixitup-control="" data-filter=".mar" class="">Graphic Design</a></li>
                        <li><a href="##!" data-mixitup-control="" data-filter=".des">Business</a></li>
                    </ul>
                </div>
			</div>
			<div class="row filters" id="MixItUp7324BF">
                <!--- Loop Courses --->
                <cfloop from="1" to="#arraylen(items)#" index="c">
                    <cfset item = items[c]>
                    <div class="col-lg-4 col-md-6 mix ios des">
                        <div class="course-single-box wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1s">
                            <div class="course-thumb">
                                <img src="#item.cover#" alt="#item.name#">
                                <img src="#item.cover#" alt="#item.name#">
                                <div class="course-icon">
                                    <!--- <i class="bi bi-heart"></i> --->
                                </div>
                                <div class="course-admin">
                                    &nbsp;
                                </div>
                                <div class="course-rating">
                                    <div class="course-star float-end text-right">
                                        <span>#item.name#</span>
                                    </div>
                                </div>
                            </div>
                            <div class="course-content">
                                <div class="course-meta">
                                    <span><i class="bi bi-book"></i> TUTORIAL</span>
                                    <span><i class="bi bi-clock"></i> DEMO</span>
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