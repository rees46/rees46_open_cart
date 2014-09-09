#! /bin/bash

echo "Uninstalling old files"

# Admin
rm ~/Sites/admin/model/module/rees46.php
rm ~/Sites/admin/view/template/module/rees46.tpl
rm ~/Sites/admin/controller/module/rees46.php
rm ~/Sites/admin/language/english/module/rees46.php
rm ~/Sites/admin/language/russian/module/rees46.php

# Catalog
rm ~/Sites/catalog/model/module/rees46.php
rm ~/Sites/catalog/view/theme/default/template/module/rees46.tpl
rm ~/Sites/catalog/controller/module/rees46.php
rm ~/Sites/catalog/language/english/module/rees46.php
rm ~/Sites/catalog/language/russian/module/rees46.php

echo "Installing new files"

# Admin
cp admin/model/module/rees46.php ~/Sites/admin/model/module/rees46.php
cp admin/view/template/module/rees46.tpl ~/Sites/admin/view/template/module/rees46.tpl
cp admin/controller/module/rees46.php ~/Sites/admin/controller/module/rees46.php
cp admin/language/english/module/rees46.php ~/Sites/admin/language/english/module/rees46.php
cp admin/language/russian/module/rees46.php ~/Sites/admin/language/russian/module/rees46.php

# Catalog
cp catalog/model/module/rees46.php ~/Sites/catalog/model/module/rees46.php
cp catalog/view/theme/default/template/module/rees46.tpl ~/Sites/catalog/view/theme/default/template/module/rees46.tpl
cp catalog/controller/module/rees46.php ~/Sites/catalog/controller/module/rees46.php
cp catalog/language/english/module/rees46.php ~/Sites/catalog/language/english/module/rees46.php
cp catalog/language/russian/module/rees46.php ~/Sites/catalog/language/russian/module/rees46.php

echo "Finished"
