<div class="users center">
<?= $this->Form->create() ?>
    <fieldset class="login-form">
        <div class="login-form">
        	<div class="login-info">
        		Enter Your Username and we will send you an email with instructions:
        	<div class="login-field">
        		<?= $this->Form->control('username') ?>
        	</div>
       		<?= $this->Form->button('Apply', ['type' => 'submit', 'class' => 'usrs-btns', 'id' => 'add_usr']); ?>
       		</div>
       	</div>
   </fieldset>
<?= $this->Form->end() ?>
</div>
