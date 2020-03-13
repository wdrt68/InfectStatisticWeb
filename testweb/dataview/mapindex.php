<?php
	require "public_function.php";
	dbInit();
	$date = '2020-02-29';
	$sql = "select * from province where p_date='{$date}'";
	$con->query("SET NAMES utf8");
	$datas = n_fetchAll($sql);
	//print_r($datas);
	//echo "</br>";
	echo json_encode($datas);
	$con = null;
?>