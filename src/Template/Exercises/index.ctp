<!-- File src/Template/Exercises/index.ctp -->

<h1>Exercises</h1>
<p><?= $this->Html->link("Add Exercise", ['action' => 'add']) ?></p>
<table>
	<tr>
		<th><?= $this->Paginator->sort('Exercises.name', 'Name') ?></th>
		<th><?= $this->Paginator->sort('ExerciseTypes.name', 'Type') ?></th>
		<th></th>
	</tr>
	<?php foreach ($exercises as $exercise): ?>
	<tr>
		<td>
			<?= $exercise->name ?>
		</td>
		<td>
			<?= $exercise->exercise_type->name ?>
		</td>
        	<td>
            		<?= $this->Html->link('Edit', ['action' => 'edit', $exercise->id]) ?>
        	</td>
	</tr>
	<?php endforeach; ?>
</table>
<div class="container">
<ul id="paginate">
	<?= $this->Paginator->prev('« Previous') ?>
	<?= $this->Paginator->numbers() ?>
	<?= $this->Paginator->next('Next »') ?>
</ul>
<?= $this->Paginator->counter([
    'format' => 'Page {{page}} of {{pages}}, showing {{current}} records out of
             {{count}} total, starting on record {{start}}, ending on {{end}}'
]) ?>
</div>
