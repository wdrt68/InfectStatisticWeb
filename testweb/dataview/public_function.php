<?php
function dbInit(){
	global $con;
	$serverName = "localhost";
	$userName = "root";
	$password = "123456";
	$dbName = "infectstatistic";
	$con = new mysqli($serverName, $userName, $password, $dbName);
	if(mysqli_connect_errno()){
		die("连接失败: " . mysqli_connect_error());
	}
	
}

function provinceFetchAll($sql){
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

function nationFetchAll($sql){
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