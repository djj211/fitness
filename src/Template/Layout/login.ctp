<?php
/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @since         0.10.0
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */

$cakeDescription = 'Workout Generator';
?>
<!DOCTYPE html>
<style>
	ul#paginate li {
		display:inline;
		padding-right: 5px;
		padding-left: 5px;
	}

	ul#paginate {
		margin-bottom: 0 !important;
		margin-left: 0 !important;
	}

	.login-form {
		max-width: 300px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
	}


	.container {
		/* for IE below version 7 use `width` instead of `max-width` */
		max-width: 80%;
		margin-right: auto;
		margin-left: auto;
		text-align: center;
	}

	#footer {
		text-align: center;
		color: white;
		background: #116d76;
		height: 30px;
	}
</style>
<html>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <?= $cakeDescription ?>:
        <?= $this->fetch('title') ?>
    </title>
    <?= $this->Html->meta('icon') ?>

    <?= $this->Html->css('base.css') ?>
    <?= $this->Html->css('style.css') ?>
    <?=	$this->Html->script('http://code.jquery.com/jquery.min.js') ?>
    <?= $this->fetch('meta') ?>
    <?= $this->fetch('css') ?>
    <?= $this->fetch('script') ?>
</head>
<body>
    <nav class="top-bar expanded" data-topbar role="navigation">
        <ul class="title-area large-3 medium-4 columns">
            <li class="name">
                <h1><a href="/fitness">Workout Generator</a></h1>
            </li>
        </ul>
        <div class="top-bar-section">
            <ul class="right">
                <li><a href="/fitness/login">Login</a></li>
            </ul>
        </div>
    </nav>
    <?= $this->Flash->render() ?>
    <div class="container clearfix">
        <?= $this->fetch('content') ?>
    </div>
    <footer>
        <div id="footer">Copyright © DJJ 2019 v1.0.0</div>
    </footer>
</body>
</html>
