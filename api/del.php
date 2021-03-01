<?php
include_once "../base.php";
if(!empty($Supervisor->find(['name'=>$_POST['name']]))){
    $BasicInformation->del(['id'=>$_POST['id']]);
    $Education->del(['basicInformationID'=>$_POST['id']]);
    $Experience->del(['basicInformationID'=>$_POST['id']]);
    $sup=$Supervisor->find(['name'=>$_POST['name']]);
    $Supervisor->del(['id'=>$sup['id']]);
}else{
    $BasicInformation->del(['id'=>$_POST['id']]);
    $Education->del(['basicInformationID'=>$_POST['id']]);
    $Experience->del(['basicInformationID'=>$_POST['id']]);
}

// to("../index.php");
?>