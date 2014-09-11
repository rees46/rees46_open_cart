<!-- Insert before </body> -->
<!-- REES46 Init Begin -->
<script src="//cdn.rees46.com/rees46_script2.js"></script>
<link href="//rees46.com/shop_css/ac61a375059f03dca081f4632cad4f" media="all" rel="stylesheet" />
<script type="text/javascript">
  var REES46Info = {
    shopId: 'ac61a375059f03dca081f4632cad4f',
    currentUserId: <?php
      $current_user_id = $this->customer->getId();
      if (!$current_user_id) {
        $current_user_id = 'null';
      }
      echo $current_user_id;
    ?>
  };

  REES46.init(REES46Info.shopId, REES46Info.currentUserId, function() {
    if (typeof(REES46CurrentProductInfo) != 'undefined') {
      REES46.pushData('view', REES46CurrentProductInfo);
    }
  });

  $(function() {
    $(document).ajaxSend(function(event, jqxhr, settings) {
      if (/index.php\?route\=checkout\/cart\/add/.test(settings.url)) {
        settings.data.split('&').forEach(function(pair) {
          var parts = pair.split('=');
          if (parts[0] == 'product_id') {
            REES46.pushData('cart', { item_id: parts[1] });
          }
        });
      }

      if (/index.php\?route\=module\/cart\&remove\=\d+/.test(settings.url)) {
        var removedId = settings.url.split('remove=')[1];

        REES46.pushData('remove_from_cart', { item_id: removedId });
      }
    });
  });
</script>
<!-- REES46 Init End -->
