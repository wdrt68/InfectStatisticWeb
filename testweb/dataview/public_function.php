<?php
function dbInit(){
	global $con;
	$servername = "localhost";
	$username = "root";
	$password = "123456";
	$dbname = "infectstatistic";
	$con = new mysqli($servername, $username, $password, $dbname);
	if(mysqli_connect_errno()){
		die("连接失败: " . mysqli_connect_error());
	}
	
}

function p_fetchAll($sql){
	global $con;
	class user{
		public $dates;
		public $num;
	}
	if($result = $con->query($sql)){
		
		$datas = array();
		$num_results = $result->num_rows;
		for($i = 0; $i < $num_results; $i++){
			$row = $result->fetch_assoc();
			$user = new User();
			$user->dates = $row['p_date'];
			$user->num = $row['n_ip'];
			$datas[] = $user;
		}
		return $datas;
	}else{
		return false;
	}
	
}

function n_fetchAll($sql){
	global $con;
	class user{
		public $province;
		public $dates;
		public $num;
	}
	if($result = $con->query($sql)){
		
		$datas = array();
		$num_results = $result->num_rows;
		for($i = 0; $i < $num_results; $i++){
			$row = $result->fetch_assoc();
			$user = new User();
			$user->province = $row['p_name'];
			$user->dates = $row['p_date'];
			$user->num = $row['c_ip'];
			$datas[] = $user;
		}
		return $datas;
	}else{
		return false;
	}
	
}

?>