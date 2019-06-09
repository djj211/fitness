<!-- File src/Template/Exercises/workout.ctp -->

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<?php
	echo $this->Html->script('jquery.ui.touch-punch.min.js');
?>

<script>
	$(document).ready(function() {
		refreshMulti();
		$('#exercises-ids option').prop('selected', true);
		$( "#sortable" ).sortable({
			update: function( event, ui ) {
				refreshMulti();
			}	
		});
		$( "#sortable" ).disableSelection();

		$( ".submitBtn" ).click(function() {
			refreshMulti();
		});
	});

	function refreshMulti() {
		$( '#exercises-ids' ).html("");
                $( "#sortable li" ).each(function() {
        	        $( '#exercises-ids' ).append("<option value=" + $( this ).attr('data-id') + " selected>" + $( this ).text().trim() + "</option>");
                });

	}
</script>

<style>
	#exercises-ids {
		display: none;
	}
	#sortable {
		list-style-type: none; 
		text-align: center;
		margin: auto;
		width: 300px;
		padding-bottom: 20px;
	}
	#sortable li {
		margin: 0 3px 3px 3px;
		padding: 0.4em;
		font-size: 1.4em;
		cursor: move;
	}
	#sortable li span {
		position: absolute;		
		margin-left: -1.3em;
	}
	.ui-draggable, .ui-droppable {
		background-position: top;
	}
	#workouttype {
		width: 300px;
	}
</style>

<h1>Workout Generator</h1>
<label>Exercises</label>
<ul id="sortable">
	<?php
		foreach ($all as $single) {
			echo '<li class="ui-state-default" data-id="' . $single->id . '">' . $single->name . '</li>';
		};
        ?>
</ul>
<?php
echo $this->Form->create($workout, ['url' => ['controller' => '', 'action' => 'add']]);
echo $this->Form->control('exercises._ids', ['label' => false]);
echo $this->Form->button(__("Commit"), ['class' => 'submitBtn']);
echo $this->Form->end();
echo $this->Form->create(null, ['url' => '/']);
echo "<label>Don't Like The Suggestion? Select A Weight Workout Type and Click Refresh</label>";
echo $this->Form->control('WorkoutType', ['type' => 'select', 'label' => false, 'options' => [
		'0' => 'Misc',
		'1' => 'Arms',
		'4' => 'Legs'
	]
]);
echo $this->Form->button(__("Refresh"));
echo $this->Form->end();
?>
