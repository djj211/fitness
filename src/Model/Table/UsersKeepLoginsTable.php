<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class UsersKeepLoginsTable extends Table
{
	public function initialize(array $config)
	{
		$this->belongsTo('Users');	
	}
	
}
?>
