<?php
class ControllerCommonRees46Recommend extends Controller {
  public function index() {
    $products = array();

    if (isset($this->request->get['ids'])) {
      $recommended_ids = explode(',', $this->request->get['ids']);

      $this->load->model('catalog/product');
      $this->load->model('tool/image');
      foreach ($recommended_ids as $product_id) {
        $product = $this->model_catalog_product->getProduct($product_id);

        if ($product) {
          if ($product['image']) {
            $image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
          } else {
            $image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
          }

          $price = null;
          if (($product['special']) && ($product['special'] != '')) {
            $price = $product['special'];
          } else {
            $price = $product['price'];
          }

          $rees46_product = array(
            'name' => $product['name'],
            'price' => $this->currency->format($this->tax->calculate($price, $product['tax_class_id'], $this->config->get('config_tax'))),
            'url' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
            'image_url' => $image
          );

          array_push($products, $rees46_product);
        }
      }
    }

    header('Content-Type: application/json');
    $this->response->setOutput(json_encode($products));
  }
}
?>
