<div id="search" class="input-group">
	<input type="text" name="search" id="search-box" value="<?php echo $search; ?>" placeholder="<?php echo $placeholder; ?>" class="form-control input-lg" />
	<span class="input-group-btn">
	<button type="button" class="btn btn-primary btn-lg"><?php echo $text_search; ?></button>
  </span>
</div>

<script>
messages = [];
messages[0] = 1; //first value used as index
messages[1] = 'I want to see... Lakes.';
messages[2] = 'I want to see... Caves.';
messages[3] = 'I want to see... Mountains.';
messages[4] = 'I want to see... Elephants.';
messages[5] = 'I want to see... Mt. Cameroon.';
messages[6] = 'I want to see... Bamenda.';
messages[7] = 'I want to see... Museums.';
messages[8] = 'I want to see... Festivals.';
messages[9] = 'I want to see... National Parks.';
messages[10] = 'I want to see... Gardens.';
messages[11] = 'I want to see... Palaces.';
messages[12] = 'I want to see... Waterfalls.';
messages[13] = 'I want to see... Bimbia.';
messages[14] = 'I want to see... Beaches.';
messages[15] = 'I want to see... Traditional Cuisine.';
messages[16] = 'I want to see... Lions.';
messages[17] = 'I want to see... Korup National Park.';
messages[18] = 'I want to see... Native Birds.';
messages[19] = 'I want to see... Cities.';
messages[20] = 'I want to see... Saddle Hill Range.';
messages[21] = 'I want to see... Foumban.';

function animate_search_box(){

    setInterval(function () {	
		$('#search-box').attr("placeholder", messages[messages[0]] );
		messages[0] = messages[0]+1<messages.length?messages[0]+1:1;
    },2000);
  }
  $(document).ready(function() {
    animate_search_box();
  });
  
</script>
