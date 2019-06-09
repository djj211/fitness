<br />
<?php echo $this->Html->link('Add New User', '/users/add', ['class' => 'modern-link', 'id' => 'usr_add']); ?>
<table>
	<tr>
		<th>User</th>
		<th>Email</th>
		<th>Role</th>
		<th>Modified</th>
		<th>Created</th>
		<th></th>
		<th></th>
	</tr>
	<?php if(!empty($users)): foreach($users as $user): ?>
		<tr>
			<td><?php echo $user->username; ?></td>
			<td><?php echo $user->email; ?></td>
			<td><?php echo $user->role; ?></td>
			<td><?php echo $user->modified->format('m-d-Y h:i:sA'); ?></td>
			<td><?php echo $user->created->format('m-d-Y h:i:sA'); ?></td>
			<td>
				<?php echo $this->Html->link('Edit', '/users/edit/' . $user->id, ['id' => 'user_edit']); ?>
			</td>
			<td>			
				<?php echo $this->Html->link('Del', '#users/delete/' . $user->id, ['id' => 'user_del']); ?>
			</td>
		</tr>
	<?php endforeach; else: ?>
		<tr><td>No Users Found</td><td></td><td></td><td></td><td></td><td></td></tr>
	<?php endif; ?>
</table>