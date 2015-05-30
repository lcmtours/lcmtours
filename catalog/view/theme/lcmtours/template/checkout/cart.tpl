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
  <div class="row">
		<div class="col-md-3">
			<span class="" ># of people</span>
			<div class="input-group" >
				
				<input id="num-people" type="number" name="num-people" value="3" size="1" class="form-control" />
				<span class="input-group-btn">
					<button id="update-button" class="btn btn-default" type="button">Update</button>
				</span>
			</div>
		</div>	
    </div>
	<br/><br/>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
			<div class="container">
                <div class="row">
					<?php foreach ($products as $product) { ?>
						<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 text-center destination-card "><div class="destination-card-content">
							<div class="destination-card-image" style="<?php if ($product['thumb']) { ?>background:url(<?php echo $product['thumb']; ?>); <?php } ?>; background-repeat:no-repeat;background-size:100%; background-position:center; " >
							<button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="" onclick="cart.remove('<?php echo $product['key']; ?>');" style="position:absolute; top:0px; right:0px; border-radius:20px;" ><i class="fa fa-times-circle"></i></button>
							<div class="destination-card-header">
								<h3 style="margin-bottom:5px" ><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
							</div>
							</div>
							<div class="destination-card-text" >

							<?php if ($product['option']) { ?>
								<?php foreach ($product['option'] as $option) { ?>
									<br />
									<small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
								<?php } ?>
							<?php } ?>
							
							
							<input type="hidden" id="quantity-<?php echo $product['product_id']; ?>" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />


							Total Estimated Price: <br /><b><span id="price-<?php echo $product['product_id']; ?>">-</span></b>
							</div>
							</div>
						</div>
					<?php } ?>
					<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 text-center destination-card">
						<a href="<?php echo $continue; ?>">
							<div class="destination-card-content" style="border-style:dashed;background-color:#EEE;"><h3 style="margin-bottom:5px;margin-top:100px" >Add another destination</h3></div>
						</a>
					</div>
				</div>

			<table>
			  <tbody>
			  <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
  
      <br />
      <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><span id="<?php echo $total['title']; ?>" >-</span></td>
            </tr>
            <?php } ?>
          </table>
        </div>
      </div>
      <div class="buttons">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary"><?php echo $button_checkout; ?></a></div>
      </div>
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
