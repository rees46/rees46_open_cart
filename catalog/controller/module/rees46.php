<?php
################################################################################################
#  DIY Module Builder for Opencart 1.5.1.x From HostJars http://opencart.hostjars.com    	   #
################################################################################################
?><?php

class ControllerModuleMyModule extends Controller {
	protected function index() {
		//Load the language file for this module - catalog/language/module/rees46.php
		$this->language->load('module/rees46');

		//Get the title from the language file
      	$this->data['heading_title'] = $this->language->get('heading_title');

		//Load any required model files - catalog/product is a common one, or you can make your own DB access
		//methods in catalog/model/module/rees46.php
		$this->load->model('module/rees46');

		//Example functionality: pull through customer firstnames and make them available to the view.
		$this->data['customers'] = $this->model_module_rees46->getCustomerFirstnames();

		//Choose which template to display this module with
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/rees46.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/rees46.tpl';
		} else {
			$this->template = 'default/template/module/rees46.tpl';
		}

		//Render the page with the chosen template
		$this->render();
	}
}
?>