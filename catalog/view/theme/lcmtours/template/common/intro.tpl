<?php echo $header; ?>
<script>
imagePage=true;
</script>

<!-- Intro Header -->
<header class="intro" style="background-image:url('<?php echo $intro_images[0]; ?>')">
	<div class="intro-body">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h1 class="brand-heading">LCM Tours</h1>
					<p class="intro-text">Connecting Tourist and Tour Guides in Cameroon.</p>
					<a href="#about" class="btn btn-primary page-scroll">How It Works</a><br /><br />
					
				</div>
			</div>
		</div>
	</div>
</header>


<div class="container">
	<div class="row"><?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
			<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
			<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
			<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		
		<div id="content" class="<?php echo $class; ?>">

			<section id="about" class="container content-section" >
			<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
			<?php echo $content_top; ?>
			</div>
			</div>
			</section>

			<!-- How it works Section -->
			<section id="howitworks" class="content-section ">
			<div class="howitworks-section">
			<div class="container">
			<?php echo $content_bottom; ?></div>
			</div>
			</div>
			</section>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>