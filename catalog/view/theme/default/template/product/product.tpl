<!-- Insert before < ?php echo $footer; ?> -->
<!-- REES46 Product Tracking -->
<script type="text/javascript">
  var REES46CurrentProductInfo = {
    item_id:      <?php echo $product_id; ?>,
    price:        <?php
      if ($special) {
        echo preg_replace('/[^0-9.+]/', '', $special);
      } else {
        echo preg_replace('/[^0-9.+]/', '', $price);
      }
    ?>,
    is_available: <?php if (isset($rees46_is_available) && $rees46_is_available>0) { echo 'true'; } else { echo 'false'; }; ?>,
    categories:   <?php
      $categories = array();

      $product_categories = $this->model_catalog_product->getCategories($product_id);

      foreach ($product_categories as $product_category) {
        array_push($categories, $product_category['category_id']);
      }

      echo ('['.implode(',', $categories).']');
    ?>,
    name:        '<?php echo trim(preg_replace('/\s+/', ' ', strip_tags(html_entity_decode($heading_title, ENT_QUOTES, 'UTF-8')))); ?>',
    url:         '<?php echo $this->$data['product']['href']; ?>',
    image_url:   '<?php echo $popup; ?>'
  };
</script>
<!-- REES46 Product Tracking End -->
