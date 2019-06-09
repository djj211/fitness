<?php
// src/Model/Table/ExercisesTable.php
namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class ExercisesTable extends Table {

	public function initialize(array $config) {
		$this->belongsTo('ExerciseTypes');
		$this->belongsToMany('Workouts');
		$this->hasMany('Workouts');
	}

    public function validationDefault(Validator $validator)
    {
        return $validator
			->notEmpty('name', 'A name is required for the Exercise!')
			->notEmpty('exercise_type_id', 'A type is required for the Exercise!')
			->add('exercise_type_id', 'inList', [
                'rule' => ['inList', [1, 2, 3, 4]],
                'message' => 'Please choose a valid Type'
            ]);

	}

}
