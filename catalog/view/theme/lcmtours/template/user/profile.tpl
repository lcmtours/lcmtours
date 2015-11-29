<?php echo $header; ?>
<script>
imagePage=true;
</script>

<!-- Intro Header -->
<header class="intro" style="">
	<div class="intro-body">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<img src="<?php echo $image; ?>" />
					<h1 class="brand-heading"><?php echo "$firstname $lastname"; ?></h1>
					
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
		<pre> <?php print_r($user_info); ?> </pre>
	</div>
</section>

<?php echo $content_bottom; ?>

<?php echo $footer; ?>