<?php echo $header; ?>

<div class="sidemenu sidemenu-hidden" >

	<button type="button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary button-cart"><?php echo $button_cart_short; ?></button>
	<div class="sidemenu-details sidemenu-details-hidden">
		<div>
			<div id="product">
				
			Duration: <h4><?php echo $duration; ?></h4>
			Estimated price <h4 id="estimated-price" style="margin-bottom:5px;" ><?php if ($discounts) { echo $discounts[0]['price'];} else { echo $price;  } ?></h4>
			for <input id="quantity" type="number" name="quantity" value="1" size="2" id="input-quantity" class="form-control" style="width:75px;display:inline" /> people
			<input id="product_id" type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
				</div>

		</div>
	</div>
</div>

    <!-- Intro Header -->
    <header class="intro" style="background-image:url('<?php echo $intro; ?>')">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1"  style="background-color:rgba(0,0,0,.4); padding:20px;">
                        <h1 class="brand-heading"><?php echo $heading_title; ?></h1>
                        <p class="intro-text"><?php echo $meta_title; ?></p>
                        <div class="row" style="text-align:center" >
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
								Duration: <h4 style=" margin-bottom:5px;"><?php echo $duration; ?></h4>
							</div>
							<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
								Price / Person : <h4 id="estimated-price" style="margin-bottom:5px;" ><?php if ($discounts) { echo $discounts[0]['price'];} else { echo $price;  } ?></h4>
							</div>
							<div class="col-xs-12 col-sm-4 col-md-6 col-lg-6 hidden-xs">
								<div style="margin-top:top" ><a href="#about-product" class="btn btn-danger page-scroll hidden-xs" style="margins:auto;width:150px">Learn more <i class="fa fa-chevron-down"></i> </a> </div>
							</div>
						</div>
						
                        
                    </div>
				
                </div>
            </div>
        </div>
    </header>

    <!-- About Section -->
    <section id="about-product" class="container content-section" style="" >
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
			
			<h3><?php echo $tab_description; ?> </h3>
			
			<?php echo $description; ?>

			<a href="#slideshow" class="btn btn-danger page-scroll hidden-xs" style="margins:auto;width:150px">See more <i class="fa fa-chevron-down"></i> </a> </div>

            </div>
        </div>
    </section>

	
	<!-- Slide show -->
    <section id="slideshow" class="content-section ">
        <div class="slideshow-section">
            <div class="container">
                   <!-- Jssor Slider Begin -->
				<!-- You can move inline styles to css file or css block. -->
				<div id="slider1_container" style="position: relative; margin: 0 auto;
					top: 0px; left: 0px; width: 1300px; height: 600px; overflow: hidden;">
					<!-- Loading Screen -->
					<div u="loading" style="position: absolute; top: 0px; left: 0px;">
						<div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block;
							top: 0px; left: 0px; width: 100%; height: 100%;">
						</div>
						<div style="position: absolute; display: block; background: url(catalog/view/theme/lcmtours/image/jssor/loading.gif) no-repeat center center;
							top: 0px; left: 0px; width: 100%; height: 100%;">
						</div>
					</div>
					<!-- Slides Container -->
					<div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1300px;
						height: 600px; overflow: hidden;">
						<div>
							<img u="image" src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>" />
						</div>
						<?php if ($images) { ?>
						<?php foreach ($images as $image) { ?>
						<div>
							<img u="image" src="<?php echo $image['popup']; ?>"  alt="" />
						</div>
			
						<?php } ?>
						<?php } ?>
					</div>
							
					<!-- Bullet Navigator Skin Begin -->
					<style>
						/* jssor slider bullet navigator skin 21 css */
						/*
						.jssorb21 div           (normal)
						.jssorb21 div:hover     (normal mouseover)
						.jssorb21 .av           (active)
						.jssorb21 .av:hover     (active mouseover)
						.jssorb21 .dn           (mousedown)
						*/
						.jssorb21 div, .jssorb21 div:hover, .jssorb21 .av
						{
							background: url(catalog/view/theme/lcmtours/image/jssor/b21.png) no-repeat;
							overflow:hidden;
							cursor: pointer;
						}
						.jssorb21 div { background-position: -5px -5px; }
						.jssorb21 div:hover, .jssorb21 .av:hover { background-position: -35px -5px; }
						.jssorb21 .av { background-position: -65px -5px; }
						.jssorb21 .dn, .jssorb21 .dn:hover { background-position: -95px -5px; }
					</style>
					<!-- bullet navigator container -->
					<div u="navigator" class="jssorb21" style="position: absolute; bottom: 26px; left: 6px;">
						<!-- bullet navigator item prototype -->
						<div u="prototype" style="POSITION: absolute; WIDTH: 19px; HEIGHT: 19px; text-align:center; line-height:19px; color:White; font-size:12px;"></div>
					</div>
					<!-- Bullet Navigator Skin End -->

					<!-- Arrow Navigator Skin Begin -->
					<style>
						/* jssor slider arrow navigator skin 21 css */
						/*
						.jssora21l              (normal)
						.jssora21r              (normal)
						.jssora21l:hover        (normal mouseover)
						.jssora21r:hover        (normal mouseover)
						.jssora21ldn            (mousedown)
						.jssora21rdn            (mousedown)
						*/
						.jssora21l, .jssora21r, .jssora21ldn, .jssora21rdn
						{
							position: absolute;
							cursor: pointer;
							display: block;
							background: url(catalog/view/theme/lcmtours/image/jssor/a21.png) center center no-repeat;
							overflow: hidden;
						}
						.jssora21l { background-position: -3px -33px; }
						.jssora21r { background-position: -63px -33px; }
						.jssora21l:hover { background-position: -123px -33px; }
						.jssora21r:hover { background-position: -183px -33px; }
						.jssora21ldn { background-position: -243px -33px; }
						.jssora21rdn { background-position: -303px -33px; }
					</style>
					<!-- Arrow Left -->
					<span u="arrowleft" class="jssora21l" style="width: 55px; height: 55px; top: 123px; left: 8px;">
					</span>
					<!-- Arrow Right -->
					<span u="arrowright" class="jssora21r" style="width: 55px; height: 55px; top: 123px; right: 8px">
					</span>
					<!-- Arrow Navigator Skin End -->
					<a style="display: none" href="http://www.jssor.com">jQuery Carousel</a>
				</div>
				<!-- Jssor Slider End -->

			</div>
			
        </div>
		
		<div class="container" style="margin-top:-100px;">
			<div class="row" >
				<div class="col-md-2 col-md-offset-2" style="text-align:center;">
					<a href="#details" class="btn btn-danger page-scroll hidden-xs" style="margins:auto;width:150px"><?php echo $tab_attribute; ?> <i class="fa fa-chevron-down"></i> </a> 
				</div>
			</div>
		</div>
    </section>
	
	<section id="details" class="container content-section ">
		<h3><?php echo $tab_attribute; ?></h3>
		<div class="tab-pane" id="tab-specification">
			<table class="table table-bordered">
				<?php foreach ($attribute_groups as $attribute_group) { ?>
					<thead>
						<tr>
							<td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr>
								<td><?php echo $attribute['name']; ?></td>
								<td><?php echo $attribute['text']; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				<?php } ?>
			</table>
		</div>
		<div class="container">
			<div class="row" style="text-align:center;">
				<div class="col-md-2 col-md-offset-2"  style="text-align:center;">
					<a href="#map" class="btn btn-danger page-scroll hidden-xs" style="margins:auto;width:150px"> <i class="fa fa-chevron-down"></i> Map </a> 
				</div>
			</div>
		</div>
	</section>
	<div id="map"> <div id="mapArea"></div>
	</div>
	
<script>
		imagePage = true;
</script>


<?php echo $footer; ?>

<!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?&sensor=false"></script>

	<script type="text/javascript"><!--
$('.button-cart').on('click', function() {

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'number\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('.button-cart').button('loading');
		},
		complete: function() {
			$('.button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {

				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
				
				location = "<?php echo $shopping_cart; ?>";
			}
		}
	});
});
//--></script> 



    <script src="catalog/view/javascript/jssor.js"></script>
    <script src="catalog/view/javascript/jssor.slider.js"></script>
    <script>
        jQuery(document).ready(function ($) {

            var _CaptionTransitions = [];
            _CaptionTransitions["L"] = { $Duration: 900, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["R"] = { $Duration: 900, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["T"] = { $Duration: 900, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["B"] = { $Duration: 900, y: -0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
            _CaptionTransitions["ZMF|10"] = { $Duration: 900, $Zoom: 11, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 };
            _CaptionTransitions["RTT|10"] = { $Duration: 900, $Zoom: 11, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8} };
            _CaptionTransitions["RTT|2"] = { $Duration: 900, $Zoom: 3, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 0.5} };
            _CaptionTransitions["RTTL|BR"] = { $Duration: 900, x: -0.6, y: -0.6, $Zoom: 11, $Rotate: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.8} };
            _CaptionTransitions["CLIP|LR"] = { $Duration: 900, $Clip: 15, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
            _CaptionTransitions["MCLIP|L"] = { $Duration: 900, $Clip: 1, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic} };
            _CaptionTransitions["MCLIP|R"] = { $Duration: 900, $Clip: 2, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic} };

            var options = {
                $FillMode: 2,                                       //[Optional] The way to fill image in slide, 0 stretch, 1 contain (keep aspect ratio and put all inside slide), 2 cover (keep aspect ratio and cover whole slide), 4 actual size, 5 contain for large image, actual size for small image, default value is 0
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 800,                               //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $CaptionSliderOptions: {                            //[Optional] Options which specifies how to animate caption
                    $Class: $JssorCaptionSlider$,                   //[Required] Class to create instance to animate caption
                    $CaptionTransitions: _CaptionTransitions,       //[Required] An array of caption transitions to play caption, see caption transition section at jssor slideshow transition builder
                    $PlayInMode: 1,                                 //[Optional] 0 None (no play), 1 Chain (goes after main slide), 3 Chain Flatten (goes after main slide and flatten all caption animations), default value is 1
                    $PlayOutMode: 3                                 //[Optional] 0 None (no play), 1 Chain (goes before main slide), 3 Chain Flatten (goes before main slide and flatten all caption animations), default value is 1
                },

                $BulletNavigatorOptions: {                          //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                 //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 8,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 8,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                },

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                }
            };

            var jssor_slider1 = new $JssorSlider$("slider1_container", options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var bodyWidth = document.body.clientWidth;
                if (bodyWidth)
                    jssor_slider1.$ScaleWidth(Math.min(bodyWidth, 1920));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
</script>

		<script>
		function updatePrice() {
				var n = $( "#quantity" ).val();
				$("#estimated-price").html("$"  + $( "#quantity" ).val() * <?php echo $price_num ?>);
				if(n<1){
					$("#estimated-price").html( "no one's going? :(");
				}
			<?php if ($discounts) { ?>
			
				<?php for($n=sizeof($discounts)-1; $n>=0; $n--) { ?>
						else if(n >= <?php echo $discounts[$n]['quantity']; ?>){
					$("#estimated-price").html( "$" + n*<?php echo $discounts[$n]['price_num']; ?>);
				}
				<?php } ?>
			<?php } ?>
			}
			$( "#quantity" ).change(updatePrice);
			$( "#quantity" ).val(3);
			updatePrice();
		</script>

		<script>
		$(window).scroll(function() {
			if(
				($(window).scrollTop() < $("#about-product").offset().top-100 ) ||
				($(window).width()<767)
			){
				$(".sidemenu-details").addClass("sidemenu-details-hidden");
				$(".sidemenu").addClass("sidemenu-hidden");
			}else{
				$(".sidemenu").removeClass("sidemenu-hidden");
				$(".sidemenu-details").removeClass("sidemenu-details-hidden");
			}
		});
		

		</script>
		<script>
		    // Get the HTML DOM element that will contain your map 
			// We are using a div with id="map" seen below in the <body>
			var mapElement = document.getElementById('mapArea');

			    // Basic options for a simple Google Map
    // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
    var mapOptions = {
        // How zoomed in you want the map to start at (always required)
        zoom: 8,

        // The latitude and longitude to center the map (always required)
        center: new google.maps.LatLng(<?php echo $lat;?>,<?php echo $lng; ?>), // 

        scrollwheel: false,
		mapTypeId: google.maps.MapTypeId.HYBRID

    };
			
			// Create the Google Map using out element and options defined above
			var map = new google.maps.Map(mapElement, mapOptions);

			// Custom Map Marker Icon - Customize the map-marker.png file to customize your icon
			var myLatLng = new google.maps.LatLng(<?php echo $lat;?>,<?php echo $lng; ?>);
			var beachMarker = new google.maps.Marker({
				position: myLatLng,
				map: map,
				title: "<?php echo $heading_title; ?>"
    });
		</script>
		
		
		
</body></html>




