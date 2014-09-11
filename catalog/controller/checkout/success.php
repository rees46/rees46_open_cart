// Insert before $this->cart->clear();

// REES46 Purchase Begin
$rees46_cookie_content = array('items' => array(), 'order_id' => $this->session->data['order_id']);
$current_cart = $this->cart->getProducts();
foreach ($current_cart as $cart_item) {
  array_push($rees46_cookie_content['items'], array('item_id' => $cart_item['product_id'], 'price' => $cart_item['price'], 'amount' => $cart_item['quantity']));
}
setcookie('rees46_track_purchase', json_encode($rees46_cookie_content));
// REES46 Purchase End
