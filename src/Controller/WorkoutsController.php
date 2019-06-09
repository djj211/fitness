<?php
// src/Controller/WorkoutsController.php

namespace App\Controller;

use Cake\Utility\Hash;

class WorkoutsController extends AppController {
        public function index() {
		parent::loadTemplate();
                $this->loadComponent('Paginator');
                $workouts = $this->Paginator->paginate($this->Workouts->find('all'),
			[
                        	'limit' => 10,
                        	'order' => [
                        	        'Workouts.created' => 'desc'
	                        ],
			]
		);

                $this->set(compact('workouts'));
        }

	public function generate() {
		parent::loadTemplate();
                $workout = $this->Workouts->newEntity();

                $todays = $this->Workouts->find('all', array(
                        'conditions' => array('DATE(created)' => date('Y-m-d')),
                        'limit' => 1
                ));

                if ($todays->count() > 0)
                {
                        return $this->redirect(['controller' => 'Workouts', 'action' => 'view', $todays->first()->id]);
                }
                else
                {
                        $this->loadModel('ExercisesWorkouts');

                        $lastWorkout = $this->Workouts->find('all', array(
                                'fields' => ['id'],
                                'conditions' => array(
                                        'Workouts.created >=' => date('Y-m-d H:i:s', strtotime('-34 hour'))
                                 )
                        ));

                        $lastExercises = $this->ExercisesWorkouts->find('all', [
                                'fields' => ['exercise_id'],
                                'conditions' => ['workout_id IN' => $lastWorkout]
                        ]);
			
			$weights = null;

			if ($this->request->is('post'))
			{
                        	$exerciseType = $this->request->getData("WorkoutType");

				if ($exerciseType == "1" || $exerciseType == "4")
				{
	                       	 	$weights = $this->Workouts->Exercises->find('all', [
                        	        	'conditions' => [
                        	        	        'exercise_type_id' => $exerciseType,
                	        	                'Exercises.id NOT IN' => $lastExercises
        	        	                ],
	        	                        'order' => 'rand()',
        	                        		'limit' => 3,
	                		                'contain' => ['ExerciseTypes']
		                        ]);
				}
				else
				{
					$allWeights = [1, 4];
	                                $weights = $this->Workouts->Exercises->find('all', [
        	                                'conditions' => [
                	                                'exercise_type_id IN' => $allWeights,
                        	                        'Exercises.id NOT IN' => $lastExercises
                                	        ],
                                        	'order' => 'rand()',
      	                                  'limit' => 3,
        	                                'contain' => ['ExerciseTypes']
               		                ]);
				}
			}
			else
			{
				$allWeights = [1, 4];
				$weights = $this->Workouts->Exercises->find('all', [
                               		'conditions' => [
                                	        'exercise_type_id IN' => $allWeights,
                        	                'Exercises.id NOT IN' => $lastExercises
                	                ],
        	                        'order' => 'rand()',
	                                'limit' => 3,
                                	'contain' => ['ExerciseTypes']
                        	]);
			}

                        $cals = $this->Workouts->Exercises->find('all', [
                                'conditions' => [
                                        'exercise_type_id' => 2,
                                        'Exercises.id NOT IN' => $lastExercises
                                ],
                                'order' => 'rand()',
                                'limit' => 2,
                                'contain' => ['ExerciseTypes']
                        ]);

                        $toning  = $this->Workouts->Exercises->find('all', [
                                'conditions' => [
                                        'exercise_type_id' => 3,
                                        'Exercises.id NOT IN' => $lastExercises
                                ],
                                'order' => 'rand()',
                                'limit' => 1,
                                'contain' => ['ExerciseTypes']
                        ]);

                        $all = $weights->append($cals);
                        $all = $all->append($toning);
                        $exArr = array_merge($weights->toList(), $cals->toList(), $toning->toList());

                        $shuffled_ex = array();

                        $keys = array_keys($exArr);
                        shuffle($keys);

                        foreach ($keys as $key)
                        {
                                $shuffled_ex[$key] = $exArr[$key];
                        }

                        $this->set('workout', $workout);
                        $this->set('all', $shuffled_ex);
                }


	}

	public function add() {
		parent::loadTemplate();
		$workout = $this->Workouts->newEntity();

		$todays = $this->Workouts->find('all', array(
                        'conditions' => array('DATE(created)' => date('Y-m-d')),
			'limit' => 1
		));

		if ($todays->count() > 0)
		{
			return $this->redirect(['controller' => 'Workouts', 'action' => 'view', $todays->first()->id]);
		}
		else
		{

			$this->loadModel('ExercisesWorkouts');

			if ($this->request->is('post'))
			{
				$emptyArr = array();
				$workout = $this->Workouts->patchEntity($workout, $emptyArr);
				
				if ($this->Workouts->save($workout))
				{
					$sucess = true;
					
					$exerciseVals = $this->request->getData("exercises._ids");
					
					foreach ($exerciseVals as $single)
					{
						$exW = $this->ExercisesWorkouts->newEntity();
						$exW->exercise_id = $single;
						$exW->workout_id = $workout->id;
						
						if (!$this->ExercisesWorkouts->save($exW))
						{
							$sucess = false;
							break;
						}
					}

					if ($sucess)
					{
						$this->Flash->success(__('Congrats, You have Succesfully Committed to a Workout for Today'));
					
						return $this->redirect(['controller' => 'Workouts', 'action' => 'view', $workout->id]);
					}
				}
				
				$this->Flash->error(__('Unable to commit your workout. Please try again.'));
				return $this->redirect(['controller' => 'Workouts', 'action' => 'generate']);
			}
			else
			{
                        	return $this->redirect('/');
			}
		}
	}

	public function view($id) {
		parent::loadTemplate();
		$this->loadModel('ExercisesWorkouts');

		$committed = false;

                $todays = $this->Workouts->find('all', array(
                        'conditions' => array('DATE(created)' => date('Y-m-d')),
                        'limit' => 1
                ));

		if ($todays->count() > 0)
                {
			$committed = true;
		}

		$workout = $this->Workouts->get($id,
			[
				'contain' => ['Exercises']
			]
		);

		$exW = $this->ExercisesWorkouts->find('all',
			[
				'contain' => ['Exercises'],
				'conditions' => ['workout_id' => $id],
				'order' => ['ExercisesWorkouts.id' => 'ASC']
			]
		);
		
		$exercises = Hash::combine($exW->toList(), '{n}.exercise_id', '{n}.exercise.name');
		
		$this->set('todays', $todays->first());
		$this->set('committed', $committed);
		$this->set('workout', $workout);
		$this->set('exercises', $exercises);
		$this->set('all', $exW);
	}

}
