<?php
// src/Model/Table/WorkoutsTable.php
namespace App\Model\Table;

use Cake\ORM\Table;

class WorkoutsTable extends Table {

	public function initialize(array $config) {
		$this->addBehavior('Timestamp');
		$this->belongsToMany('Exercises');
		$this->hasMany('Workouts');
	}

}
