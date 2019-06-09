<div class="users center">
<?= $this->Flash->render('auth') ?>
<?= $this->Form->create() ?>
    <fieldset class="login-form">
        <div class="login-form">
        	<div class="login-info">
        	Enter User And Password:
        	<div class="login-field">
	        	<?= $this->Form->control('username') ?>
	        </div>
	        <div class="login-field">
	        	<?= $this->Form->control('password') ?>
	        </div>
	        <div class="login-field">
	        	<?= $this->Form->control('keep_me_logged_id', ['type' => 'checkbox']) ?>
	        </div>
	        <?= $this->Form->button('Login', ['type' => 'submit', 'id' => 'login']); ?>
			<div class="login-field forgot_pw_link">
			<?= $this->Html->link('Forgot Password', '/users/forgot') ?>
			</div>
       		</div>
       </div>
    </fieldset>
<?= $this->Form->end() ?>
</div>
