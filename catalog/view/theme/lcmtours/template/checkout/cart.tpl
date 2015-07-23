<?php echo $header; ?>
<section id="cart" class="container content-section"  style="padding-top:100px">

  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
		<h1 style="margin-bottom:15px" ><?php echo $heading_title; ?>
		</h1>
  </div>
 

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
			<div class="container">
                <div class="row">
					<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3" style="border-right:solid #AAA 1px;">
						  

	  
						<div class="form-group required">
							<label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
							<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
						</div>
						<div class="form-group required">
							<label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
							<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
						</div>
						<div class="form-group required">
							<label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
							<input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
						</div>
						<p><strong><?php echo $text_comments; ?></strong><br />
							<textarea name="comment" rows="5" class="form-control"><?php echo $comment; ?></textarea>
						</p>	
						<div class="buttons">
							<div class="pull-right">
								<input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-8 col-lg-9">
						
						<div class="row">
							<div class="col-xs-12 col-sm-8 col-md-6 col-lg-5">
								<label># of people</label>
								<span class="input-group" style="max-width:350px;">		
									<input id="num-people" type="number" name="num-people" value="3" size="1" class="form-control" />
									<span class="input-group-btn">
										<button id="update-button" class="btn btn-default" type="button">Update</button>
									</span>
								</span>
							</div>
						</div>
						<div class="row">
							<?php foreach ($products as $product) { ?>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 text-center destination-card ">
									<div class="destination-card-content">
										<div class="destination-card-image" style="<?php if ($product['thumb']) { ?>background:url(<?php echo $product['thumb']; ?>); <?php } ?>; background-repeat:no-repeat;background-size:100%; background-position:center; " >
											<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="" onclick="cart.remove('<?php echo $product['key']; ?>');" style="position:absolute; top:0px; right:0px; border-radius:20px;" ><i class="fa fa-times-circle"></i></button>
											<div class="destination-card-header">
												<h3 style="margin-bottom:5px" ><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
											</div>
										</div>
										<div class="destination-card-text" >
									
											<input type="hidden" id="quantity-<?php echo $product['product_id']; ?>" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />


											Total Estimated Price: <br /><b><span id="price-<?php echo $product['product_id']; ?>">-</span></b>
										</div>
									</div>
								</div>
							<?php } ?>
							
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 text-center destination-card">
								<a href="<?php echo $explore_url; ?>">
									<div class="destination-card-content" style="border-style:dashed;background-color:#EEE;"><h3 style="margin-bottom:5px;margin-top:100px" >Add another destination</h3></div>
								</a>
							</div>
						</div>
						<div>
							<i>Your estimated total is: <?php echo $total; ?></i>
						</div>
					</div>
					
				</div>

        </div>
      </form>
  
      <br />

      
	  
	  
	  
	
</div>
<script type="text/javascript">
<!--

function confirm_order(){
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/cod/confirm',
		cache: false,
		beforeSend: function() {
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},		
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});

}

$('#button-confirm').on('click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest/save',
        type: 'post',
        data: $('input[type=\'text\'], input[type=\'hidden\'], textarea'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-confirm').button('loading');
	    },  
        complete: function() {
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
			confirm_order();
		}
	});
});



	//--></script> 
	  
	  
	  
	  
	  
	  
	  
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</section>
<?php echo $footer; ?> 


<script>
function updateQuantities(){
	var data = new Array();
	<?php foreach ($products as $product) { ?>
		$("#quantity-<?php echo $product['product_id']; ?>").val( $("#num-people" ).val());
		data[data.length]  = {'key':'<?php echo $product['key']; ?>', 'quantity':$("#quantity-<?php echo $product['product_id']; ?>").val()};
	<?php } ?>
	
	cart.update( data );
}

var count=1;
<?php foreach ($products as $product) { ?>
	if(<?php echo $product['quantity']; ?> > count){
		count = <?php echo $product['quantity']; ?>;
	}
<?php } ?>

$("#num-people" ).val(count);
updateQuantities();

$( "#update-button" ).on( 'click', updateQuantities);

</script>
