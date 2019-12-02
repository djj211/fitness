<div class="users center">
<?= $this->Form->create($user) ?>
    <fieldset>
        <div class="login-form">
        	<div class="login-info">
        	Edit Your Username, Password or Email:
        	<div class="login-field">
	        	<?= $this->Form->control('username', ['class' => 'glowing-border']) ?>
	        </div>
	        <div class="login-field">
	        	<?= $this->Form->control('password', ['class' => 'glowing-border', 'value' => '']) ?>
	        </div>
	        <div class="login-field">
	        	<?= $this->Form->control('confirm_password', ['type' => 'password', 'class' => 'glowing-border', 'value' => '']) ?>
	        </div>
	        <div class="login-field">
	        	<?= $this->Form->control('email', ['class' => 'glowing-border']) ?>
	        </div>
	        <div class="login-field">
        		<?= $this->Form->control('users_preference.theme', [
		            'options' => ['Default' => 'Default', 'Fire' => 'Fire', 'Forest' => 'Forest', 'Ice' => 'Ice', 'Midnight' => 'Midnight'],
		             'class' => 'glowing-border'
       			]) ?>
       		</div>
	        <?= $this->Form->button('Apply', ['type' => 'submit', 'class' => 'usrs-btns', 'id' => 'usr_acct']); ?>
       		</div>
       </div>
    </fieldset>
<?= $this->Form->end() ?>
</div>