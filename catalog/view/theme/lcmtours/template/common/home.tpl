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
					<a href="#about" class="btn btn-danger page-scroll btn-secondary">How it works</a><br /><br />
					
					<div style="margin-top:30px;">
					<?php echo $search; ?>
					</div>
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
		
		<?php echo $column_right; ?>
	</div>
</div>


<section id="about" class="container content-section" >
	<div class="row">
		<?php echo $content_top; ?>
	</div>
</section>

<?php echo $content_bottom; ?>

<?php echo $footer; ?>