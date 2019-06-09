<?php
//src/Controller/ExercisesController.php

namespace App\Controller;

class ExercisesController extends AppController {
	public function index() {
		parent::loadTemplate();
		$this->loadComponent('Paginator');
		$exercises = $this->Paginator->paginate($this->Exercises->find('all',
		[
			'contain' => ['ExerciseTypes']
		]		
		),[
			'limit' => 10,
			'order' => [
				'Exercises.name' => 'asc'
			],
			'sortWhitelist' => [
				'Exercises.name',
				'ExerciseTypes.name'
		  ]
		]);

		$this->set(compact('exercises'));
	}

	public function add() {
		parent::loadTemplate();
		$exercise = $this->Exercises->newEntity();
		if($this->request->is('post'))
		{
			$exercise = $this->Exercises->patchEntity($exercise, $this->request->getData(),
			[
				'associated' => 'ExerciseTypes'
			]);

			if ($this->Exercises->save($exercise))
			{
				$this->Flash->success(__('Sucessfully Added Exercise!'));
				return $this->redirect(['action' => 'index']);
			}

			$this->Flash->error(__('Unable to add new exercise!'));
		}

		$this->set('exercise', $exercise);
	}

	public function edit($id) {
		parent::loadTemplate();
		$exercise = $this->Exercises->get($id,
			[
				'contains' => ['ExerciseTypes']
			]
		);

		if($this->request->is(['post', 'put']))
		{
			$this->Exercises->patchEntity($exercise, $this->request->getData(),
				[
					'associated' => 'ExerciseTypes'
				]
			);

			if ($this->Exercises->save($exercise))
			{
				$this->Flash->success(__('Succesfully Updated Exercise!'));
				return $this->redirect(['action' => 'index']);
			}

			$this->Flash->error(__('Unable to Update Exercise!'));
		}

		$this->set('exercise', $exercise);
	}
}
