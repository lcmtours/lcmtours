<?php
class ControllerUserProfile extends Controller {
	private $error = array();

	public function index() {
		// $this->load->language('product/product');

		
		$this->load->model('user/user');

		if (isset($this->request->get['user_id'])) {
			$user_info = $this->model_user_user->getUser($this->request->get['user_id']);
		} else {
			$user_id = 0;
		}

		//$product_info = $this->model_catalog_product->getProduct($product_id);
		

		if ($user_info) {

			$data['username'] = $user_info['username'];
			$data['firstname'] = $user_info['firstname'];
			$data['lastname'] = $user_info['lastname'];
			$data['user_info'] = $user_info;
			
			
			$this->load->model('tool/image');

			if (isset($user_info['image'])) {
				$data['image'] = $this->model_tool_image->resize($user_info['image'], 200, 200);
			} else {
				$data['image'] = $this->model_tool_image->resize('no_image.png', 200, 200);
			}
			

			
			
			
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/user/profile.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/user/profile.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/user/profile.tpl', $data));
			}
		} else {
			
			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}

}
