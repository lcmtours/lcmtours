<?php
class ModelCatalogGuide extends Model {
	public function addGuide($data) {
		$this->event->trigger('pre.admin.guide.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "guide SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");

		$guide_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "guide SET image = '" . $this->db->escape($data['image']) . "' WHERE guide_id = '" . (int)$guide_id . "'");
		}

		foreach ($data['guide_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "guide_description SET guide_id = '" . (int)$guide_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		// MySQL Hierarchical Data Closure Table Pattern
		$level = 0;

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$data['parent_id'] . "' ORDER BY `level` ASC");

		foreach ($query->rows as $result) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "guide_path` SET `guide_id` = '" . (int)$guide_id . "', `path_id` = '" . (int)$result['path_id'] . "', `level` = '" . (int)$level . "'");

			$level++;
		}

		$this->db->query("INSERT INTO `" . DB_PREFIX . "guide_path` SET `guide_id` = '" . (int)$guide_id . "', `path_id` = '" . (int)$guide_id . "', `level` = '" . (int)$level . "'");

		if (isset($data['guide_filter'])) {
			foreach ($data['guide_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "guide_filter SET guide_id = '" . (int)$guide_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['guide_store'])) {
			foreach ($data['guide_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "guide_to_store SET guide_id = '" . (int)$guide_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// Set which layout to use with this guide
		if (isset($data['guide_layout'])) {
			foreach ($data['guide_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "guide_to_layout SET guide_id = '" . (int)$guide_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'guide_id=" . (int)$guide_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('guide');

		$this->event->trigger('post.admin.guide.add', $guide_id);

		return $guide_id;
	}

	public function editGuide($guide_id, $data) {
		$this->event->trigger('pre.admin.guide.edit', $data);

		$this->db->query("UPDATE " . DB_PREFIX . "guide SET parent_id = '" . (int)$data['parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE guide_id = '" . (int)$guide_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "guide SET image = '" . $this->db->escape($data['image']) . "' WHERE guide_id = '" . (int)$guide_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_description WHERE guide_id = '" . (int)$guide_id . "'");

		foreach ($data['guide_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "guide_description SET guide_id = '" . (int)$guide_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		// MySQL Hierarchical Data Closure Table Pattern
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "guide_path` WHERE path_id = '" . (int)$guide_id . "' ORDER BY level ASC");

		if ($query->rows) {
			foreach ($query->rows as $guide_path) {
				// Delete the path below the current one
				$this->db->query("DELETE FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$guide_path['guide_id'] . "' AND level < '" . (int)$guide_path['level'] . "'");

				$path = array();

				// Get the nodes new parents
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");

				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}

				// Get whats left of the nodes current path
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$guide_path['guide_id'] . "' ORDER BY level ASC");

				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}

				// Combine the paths with a new level
				$level = 0;

				foreach ($path as $path_id) {
					$this->db->query("REPLACE INTO `" . DB_PREFIX . "guide_path` SET guide_id = '" . (int)$guide_path['guide_id'] . "', `path_id` = '" . (int)$path_id . "', level = '" . (int)$level . "'");

					$level++;
				}
			}
		} else {
			// Delete the path below the current one
			$this->db->query("DELETE FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$guide_id . "'");

			// Fix for records with no paths
			$level = 0;

			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");

			foreach ($query->rows as $result) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "guide_path` SET guide_id = '" . (int)$guide_id . "', `path_id` = '" . (int)$result['path_id'] . "', level = '" . (int)$level . "'");

				$level++;
			}

			$this->db->query("REPLACE INTO `" . DB_PREFIX . "guide_path` SET guide_id = '" . (int)$guide_id . "', `path_id` = '" . (int)$guide_id . "', level = '" . (int)$level . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_filter WHERE guide_id = '" . (int)$guide_id . "'");

		if (isset($data['guide_filter'])) {
			foreach ($data['guide_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "guide_filter SET guide_id = '" . (int)$guide_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_to_store WHERE guide_id = '" . (int)$guide_id . "'");

		if (isset($data['guide_store'])) {
			foreach ($data['guide_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "guide_to_store SET guide_id = '" . (int)$guide_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_to_layout WHERE guide_id = '" . (int)$guide_id . "'");

		if (isset($data['guide_layout'])) {
			foreach ($data['guide_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "guide_to_layout SET guide_id = '" . (int)$guide_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'guide_id=" . (int)$guide_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'guide_id=" . (int)$guide_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('guide');

		$this->event->trigger('post.admin.guide.edit', $guide_id);
	}

	public function deleteGuide($guide_id) {
		$this->event->trigger('pre.admin.guide.delete', $guide_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_path WHERE guide_id = '" . (int)$guide_id . "'");

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "guide_path WHERE path_id = '" . (int)$guide_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteGuide($result['guide_id']);
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "guide WHERE guide_id = '" . (int)$guide_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_description WHERE guide_id = '" . (int)$guide_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_filter WHERE guide_id = '" . (int)$guide_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_to_store WHERE guide_id = '" . (int)$guide_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "guide_to_layout WHERE guide_id = '" . (int)$guide_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_guide WHERE guide_id = '" . (int)$guide_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'guide_id=" . (int)$guide_id . "'");

		$this->cache->delete('guide');

		$this->event->trigger('post.admin.guide.delete', $guide_id);
	}

	public function repairGuides($parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "guide WHERE parent_id = '" . (int)$parent_id . "'");

		foreach ($query->rows as $guide) {
			// Delete the path below the current one
			$this->db->query("DELETE FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$guide['guide_id'] . "'");

			// Fix for records with no paths
			$level = 0;

			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "guide_path` WHERE guide_id = '" . (int)$parent_id . "' ORDER BY level ASC");

			foreach ($query->rows as $result) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "guide_path` SET guide_id = '" . (int)$guide['guide_id'] . "', `path_id` = '" . (int)$result['path_id'] . "', level = '" . (int)$level . "'");

				$level++;
			}

			$this->db->query("REPLACE INTO `" . DB_PREFIX . "guide_path` SET guide_id = '" . (int)$guide['guide_id'] . "', `path_id` = '" . (int)$guide['guide_id'] . "', level = '" . (int)$level . "'");

			$this->repairGuides($guide['guide_id']);
		}
	}

	public function getGuide($guide_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') FROM " . DB_PREFIX . "guide_path cp LEFT JOIN " . DB_PREFIX . "guide_description cd1 ON (cp.path_id = cd1.guide_id AND cp.guide_id != cp.path_id) WHERE cp.guide_id = c.guide_id AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY cp.guide_id) AS path, (SELECT DISTINCT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'guide_id=" . (int)$guide_id . "') AS keyword FROM " . DB_PREFIX . "guide c LEFT JOIN " . DB_PREFIX . "guide_description cd2 ON (c.guide_id = cd2.guide_id) WHERE c.guide_id = '" . (int)$guide_id . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getGuides($data = array()) {
		$sql = "SELECT cp.guide_id AS guide_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.parent_id, c1.sort_order FROM " . DB_PREFIX . "guide_path cp LEFT JOIN " . DB_PREFIX . "guide c1 ON (cp.guide_id = c1.guide_id) LEFT JOIN " . DB_PREFIX . "guide c2 ON (cp.path_id = c2.guide_id) LEFT JOIN " . DB_PREFIX . "guide_description cd1 ON (cp.path_id = cd1.guide_id) LEFT JOIN " . DB_PREFIX . "guide_description cd2 ON (cp.guide_id = cd2.guide_id) WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY cp.guide_id";

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getGuideDescriptions($guide_id) {
		$guide_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "guide_description WHERE guide_id = '" . (int)$guide_id . "'");

		foreach ($query->rows as $result) {
			$guide_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'description'      => $result['description']
			);
		}

		return $guide_description_data;
	}

	public function getGuideFilters($guide_id) {
		$guide_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "guide_filter WHERE guide_id = '" . (int)$guide_id . "'");

		foreach ($query->rows as $result) {
			$guide_filter_data[] = $result['filter_id'];
		}

		return $guide_filter_data;
	}

	public function getGuideStores($guide_id) {
		$guide_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "guide_to_store WHERE guide_id = '" . (int)$guide_id . "'");

		foreach ($query->rows as $result) {
			$guide_store_data[] = $result['store_id'];
		}

		return $guide_store_data;
	}

	public function getGuideLayouts($guide_id) {
		$guide_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "guide_to_layout WHERE guide_id = '" . (int)$guide_id . "'");

		foreach ($query->rows as $result) {
			$guide_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $guide_layout_data;
	}

	public function getTotalGuides() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "guide");

		return $query->row['total'];
	}
	
	public function getTotalGuidesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "guide_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
