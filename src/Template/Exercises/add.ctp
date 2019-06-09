<!-- File: src/Template/Exercises/add.ctp -->

<style>
        #name {
                width: 300px;
                margin: auto;
        }
        select {
                width: 300px;
        }
</style>


<h1>Add Exercise</h1>
<?php
	echo $this->Form->create($exercise);
	echo $this->Form->control('name', ['id' => 'name']);
	echo "<br />";
	echo $this->Form->control('exercise_type_id', [
		'options' => [1 => 'Weights Arms', 2 => 'Toning', 3 => 'Calisthenics', 4 => 'Weights Legs'] 
	]);
	echo $this->Form->button(__("Add Exercise"));
	echo $this->Form->end();
?>
