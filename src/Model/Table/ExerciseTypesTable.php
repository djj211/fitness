<?php
// src/Model/Table/ExerciseTypesTable.php
namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class ExerciseTypesTable extends Table {

	public function initialize(array $config) {
		$this->hasMany('Exercises');
	}

	public function validationDefault(Validator $validator)
    {
        return $validator
			->notEmpty('name', "A type is required for the Exercise!");
	}
}
