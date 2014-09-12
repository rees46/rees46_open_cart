"Модуль" REES46 для OpenCart
======
Инициализация
------
Установить код `catalog/view/theme/НАЗВАНИЕ_ТЕМЫ/template/common/footer.tpl` перед `</body>`.

Не забыть вставить в двух местах код магазина.

Трекинг
------
Установить код `catalog/view/theme/НАЗВАНИЕ_ТЕМЫ/template/product/product.tpl` перед `<?php echo $footer; ?>`.

Вставить код из `catalog/controller/checkout/success.php` перед `$this->cart->clear();`.

Установить код `catalog/view/theme/НАЗВАНИЕ_ТЕМЫ/template/product/category.tpl` перед `<?php echo $footer; ?>`.

Рекомендации
------
Создать файл с с содержимым `catalog/controller/common/rees46_recommend.php`.

Далее можно вставлять рекомендеры в нужные шаблоны, в нужных местах.

`<div class="rees46 rees46-recommend" data-type="see_also" data-limit="4" data-tile="Не забудьте также"></div>`
