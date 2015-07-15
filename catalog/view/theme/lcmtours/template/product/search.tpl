<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

	<?php 
	/*
      <div class="row">
        <div class="col-xs-offset-3 col-xs-6">
          <?php echo $search_box; ?>
        </div>
    </div>    
          
    <div class="row">       
		<?php foreach ($categories as $category_1) { ?>
			<div class="col-sm-3">
				<h4>
					<?php echo $category_1['name']; ?>
				</h4>
				<?php foreach ($category_1['children'] as $category_2) { ?>
					<label class="checkbox-inline">
						<input type="checkbox" name="category_id" value="<?php echo $category_2['category_id']; ?>" checked="checked" />
						<?php echo $category_2['name']; ?>
					</label>
				
					<?php foreach ($category_2['children'] as $category_3) { ?>
						 <label class="checkbox-inline">
							<input type="checkbox" name="category_id" value="<?php echo $category_3['category_id']; ?>" checked="checked" />
							<?php echo $category_3['name']; ?>
						</label>
				   
					<?php } ?>
				<?php } ?>
			</div>
		<?php } ?>
          


      </div>
      
      */ 
	  ?>
    
      <?php if ($products) { ?>

      <br />
      <div class="row feature-container" >
        <?php foreach ($products as $product) { ?>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
			<div class="" style="" >
				<a href="<?php echo $product['href']; ?>">
					<div class="image" style="background-image:url('<?php echo $product['thumb']; ?>');background-repeat:  no-repeat; background-position: center;height:300px; padding-top:50px; margin-bottom:30px; text-align:center;"  >
				
				
						<div class="button-group">
							<button type="button" class="btn btn-primary" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span class=""><?php echo $button_cart; ?></span></button>
						</div>	
				
						<div class="caption" style=" text-align:center;font-size:32px;color:#FFF;font-weight: bold; padding-top:10px">
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
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}

	url += '&description=true';
	

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 
<?php echo $footer; ?> 