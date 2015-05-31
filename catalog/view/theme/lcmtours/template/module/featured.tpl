<h1 style="text-align:center;"><?php echo $heading_title; ?></h1>
<h4 style="text-align:center;"><?php echo $heading_subtitle; ?></h4>
<div class="feature-container" >
<div class="row">
	<?php 

	$classes = array(
	"col-lg-8 col-md-8 col-sm-12 col-xs-12",
	"col-lg-4 col-md-4 col-sm-6 col-xs-12",
	"col-lg-4 col-md-4 col-sm-6 col-xs-12",
	"col-lg-8 col-md-8 col-sm-12 col-xs-12"
	);
	$default_class = "col-lg-4 col-md-4 col-sm-12 col-xs-12";

	for( $i = 0; $i < count($products); $i++) { 
		$product = $products[$i];
		$class = $i<count($classes)?$classes[$i]:$default_class;

		?>
		<div class="<?php echo $class;?>">
			<a href="<?php echo $product['href']; ?>">
			<div class="image" style="background-image:url('<?php echo $product['thumb']; ?>'); background-repeat:  no-repeat; background-position: center;height:300px;margin-bottom:30px;">
				<div style="padding-top:140px; text-align:center;font-size:32px;color:#FFF;font-weight: bold;">
					<?php echo $product['name']; ?>


					<?php if ($product['price']) { ?>
						<p class="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
						<?php } ?>
						</p>
					<?php } ?>

				</div>
			</div>
			</a>
		</div>
	<?php } 
	?>
</div>
