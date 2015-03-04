<?php

// change the following paths if necessary
// 4office
$yii=dirname(__FILE__).'/../yii-1.1.7.r3135/framework/yii.php';
// 00584
// $yii='C:/Frameworks/yii/yii.php';
$config=dirname(__FILE__).'/protected/config/main.php';

// remove the following line when in production mode
// defined('YII_DEBUG') or define('YII_DEBUG',true);

require_once($yii);
Yii::createWebApplication($config)->run();
