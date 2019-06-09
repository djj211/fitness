<!-- File src/Template/Workouts/view.ctp -->

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
        $(document).ready(function() {
                $('#exercises-ids option').prop('selected', true);
                $( "#sortable" ).sortable({
                        update: function( event, ui ) {
                                $( '#exercises-ids' ).html("");
                                $( "#sortable li" ).each(function() {
                                        refreshMulti();
                                });
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
		padding-top: 10px;
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

</style>


<h1>Workout</h1>
<?php
	echo $workout->created;
?>
<ul id="sortable">
        <?php foreach ($all as $exercise): ?>
                <li class="ui-state-default" data-id="<?=$exercise->exercise_id ?>"><?= $exercise->exercise->name ?></li>
        <?php endforeach; ?>
</ul>
<?php
echo $this->Form->create($workout, ['url' => '/workouts/add', 'type' => 'post']);
echo $this->Form->control('exercises._ids', ['options' => $exercises, 'label' => false]);

if (!$committed)
{
	echo $this->Form->button(__("Commit"), ['class' => 'submitBtn']);
}
else
{
	if ($workout->id == $todays->id)
	{
		echo "This is you committed workout for today. Good Luck!";
	}
	else
	{
		echo "You have Already Committed to a workout for today. You cannot use this one!";
		echo "<p>";
		echo $this->Html->link('Go To Todays Workout', ['controller' => 'Workouts', 'action' => 'view', $todays->id]);
		echo "</p>";
	}
}
echo $this->Form->end();
?>
