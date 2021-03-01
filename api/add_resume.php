<?php
include_once "../base.php";

$basicID=$_POST['id'];
// print_r($basicID);

if (isset($_POST['degree'])) {
foreach($_POST['degree'] as $key=>$degree){
    if (!empty($degree)) {
        $add=[];
        $add['degree']=$degree;
        $add['school']=$_POST['school'][$key];
        $add['department']=$_POST['department'][$key];
        $add['basicInformationID']=$basicID;
        $Education->save($add);
    }
}
}
if (isset($_POST['serviceUnit'])) {
foreach($_POST['serviceUnit'] as $key=>$serviceUnit){
    if (!empty($serviceUnit)) {
        $add=[];
        $add['serviceUnit']=$serviceUnit;
        $add['title']=$_POST['title'][$key];
        $add['jobDescription']=$_POST['jobDescription'][$key];
        $add['start']=$_POST['start'][$key];
        $add['finish']=$_POST['finish'][$key];
        $add['basicInformationID']=$basicID;
        $Experience->save($add);
    }
}
}
to("../index.php");

?>