<?php echo $header; ?>
<script>
imagePage=false;
</script>




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