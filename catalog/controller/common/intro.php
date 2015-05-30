<?php
class ControllerCommonIntro extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		
		$intro_product_ids = array(50,51);
		$data['intro_images'] = array();
		foreach( $intro_product_ids as $product_id){
			$this->load->model('catalog/product');
			$product_info = $this->model_catalog_product->getProduct($product_id);
			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['intro_images'][] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			}
		}
		
		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/intro.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/intro.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/intro.tpl', $data));
		}
	}
}