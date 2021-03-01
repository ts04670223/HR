<?php
include_once "../base.php";

$basicID=$_POST['id'];
// print_r($basicID);
if (isset($_POST['degree'])) {
foreach($_POST['eduID'] as $key=>$id){
    if (!empty($id)) {
        $add=[];
        $add['id']=$id;
        $add['degree']=$_POST['degree'][$key];
        $add['school']=$_POST['school'][$key];
        $add['department']=$_POST['department'][$key];
        $add['basicInformationID']=$basicID;
        $Education->save($add);
    }
}
}
if (isset($_POST['serviceUnit'])) {
foreach($_POST['expID'] as $key=>$id){
    if (!empty($id)) {
        $add=[];
        $add['id']=$id;
        $add['serviceUnit']=$_POST['serviceUnit'][$key];
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