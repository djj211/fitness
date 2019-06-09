<!-- File: src/Template/Exercises/edit.ctp -->
<style>
	#name {
		width: 300px;
		margin: auto;
	}
	select {
		width: 300px;
	}
</style>
<h1>Edit Exercise</h1>
<?php
        echo $this->Form->create($exercise);
        echo $this->Form->control('name', ['id' => 'name']);
	echo "<br />";
        echo $this->Form->control('exercise_type_id', [
                'options' => [1 => 'Weights Arms', 4 => 'Weights Legs', 2 => 'Toning', 3 => 'Calisthenics']
        ]);
        echo $this->Form->button(__("Update Exercise"));
        echo $this->Form->end();
?>

