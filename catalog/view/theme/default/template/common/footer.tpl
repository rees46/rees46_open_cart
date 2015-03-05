<!-- Insert before </body> -->
<!-- REES46 Init Begin -->
<script src="//cdn.rees46.com/rees46_script2.js"></script>
<script type="text/javascript">
  var REES46Info = {
    shopId: 'КОД_ВАШЕГО_МАГАЗИНА_В_REES46',
    currentUserId: <?php
      $current_user_id = $this->customer->getId();
      if (!$current_user_id) {
        $current_user_id = 'null';
      }
      echo $current_user_id;
    ?>,
    currentUserEmail: <?php
      $current_user_email = $this->customer->getEmail();
      if (!$current_user_email) {
        $current_user_email = 'null';
      }
      echo $current_user_email;
    ?>
  };

  if (!String.prototype.format) {
    String.prototype.format = function() {
      var args = arguments;
      return this.replace(/\[(\d+)\]/g, function(match, number) {
        return typeof args[number] != 'undefined'
          ? args[number]
          : match
          ;
      });
    };
  }

  var REES46CurrentCart = <?php
    $cart_ids = array();
    foreach ($this->cart->getProducts() as $product) {
      array_push($cart_ids, $product['product_id']);
    }
    echo "[".implode(',', $cart_ids)."]";
  ?>;

  REES46.init(REES46Info.shopId, { id: REES46Info.currentUserId, email: REES46Info.currentUserEmail }, function() {
    REES46.addStyleToPage();

    if (typeof(REES46CurrentProductInfo) != 'undefined') {
      REES46.pushData('view', REES46CurrentProductInfo);
    }

    $('.rees46-recommend').each(function() {
      var recommender = $(this),
          recommenderType = recommender.attr('data-type'),
          limit = recommender.attr('data-limit'),
          title = recommender.attr('data-title');

      var currentItem = null;
      if (typeof(REES46CurrentProductInfo) != 'undefined') {
        currentItem = REES46CurrentProductInfo.item_id;
      }

      var currentCart = [];
      if (typeof(REES46CurrentCart) != 'undefined') {
        currentCart = REES46CurrentCart;
      }

      var currentCategory = null;
      if (typeof(REES46CurrentCategory) != 'undefined') {
        currentCategory = REES46CurrentCategory;
      }

      REES46.recommend({
        recommender_type: recommenderType,
        limit: limit,
        item: currentItem,
        category: currentCategory,
        cart: currentCart
      }, function(items) {
        if (items.length == 0) {
          return;
        }
        $.get('/index.php?route=common/rees46_recommend&type=' + recommenderType + '&ids=' + items.join(','), function(response) {
          var tplItems = '<div class="recommender-block-title">[1]</div><div class="recommended-items">[0]</div>';
          var tplItem  = '<div class="recommended-item">'+
                          '<div class="recommended-item-photo">'+
                              '<a href="[0]"><img src="[2]" class="item_img" /></a>'+
                          '</div>'+
                          '<div class="recommended-item-title">'+
                              '<a href="[0]">[1]</a>'+
                          '</div>'+
                          '<div class="recommended-item-price">'+
                              '[3]'+
                          '</div>'+
                          '<div class="recommended-item-action">'+
                              '<a href="[0]">Подробнее</a>'+
                          '</div>'+
                     '</div>';

          var productsBlock = '';

          response = JSON.parse(response);

          $(response).each(function() {
            if (this.name != '') {
              var linkToItem = this.url;
              if (linkToItem.indexOf('?') >= 0) {
                linkToItem = linkToItem + '&';
              } else {
                linkToItem = linkToItem + '?';
              }
              linkToItem = linkToItem + 'recommended_by=' + recommenderType;

              productsBlock += tplItem.format(
                linkToItem,
                this.name,
                this.image_url,
                this.price
              );
            }
          });

          var recommender_titles = {
              interesting: 'Вам это будет интересно',
              also_bought: 'С этим также покупают',
              similar: 'Похожие товары',
              popular: 'Популярные товары',
              see_also: 'Посмотрите также',
              recently_viewed: 'Вы недавно смотрели'
          };

          if (productsBlock != '') {
            items = tplItems.format(productsBlock, (title || recommender_titles[recommenderType]));

            if (REES46.showPromotion) {
                items = items + REES46.getPromotionBlock();
            }

            recommender.html(items);
          }
        });
      });
    });
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
