<?php
	require "public_function.php";
	dbInit();
	$province = '上海';
	$sql = "select * from province where p_name='{$province}'";
	$con->query("SET NAMES utf8");
	$datas = p_fetchAll($sql);
	//print_r($datas);
	//echo "</br>";
	echo json_encode($datas);
	
	$con = null;
?>