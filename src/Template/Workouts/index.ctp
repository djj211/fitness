<!-- File src/Template/Workouts/index.ctp -->

<style>
	.workouts {
		max-width: 700px;
		margin: auto;
	}
</style>

<h1>Workout History</h1>
<table class="workouts">
        <tr>
		<th><?= $this->Paginator->sort('Workouts.created', 'Day') ?></th>
                <th></th>
        </tr>
        <?php foreach ($workouts as $workout): ?>
        <tr>
                <td>
                        <?= $workout->created ?>
                </td>
                <td>
                        <?= $this->Html->link('View', ['action' => 'view', $workout->id]) ?>
                </td>
        </tr>
        <?php endforeach; ?>
</table>
<br />
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

