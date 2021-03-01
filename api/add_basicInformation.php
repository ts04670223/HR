<?php
include_once "../base.php";
$db=[];
$db['department']=$_POST['department'];
$db['staffCode']=$_POST['staffCode'];
$db['name']=$_POST['name'];
$db['onDuty']=$_POST['onDuty'];
// echo $_POST['title'];
if($_POST['title']=='0'){
    $db['position']=0;
    $db['supervisor']=$_POST['supervisor'];
}else{
    $db['position']=1;
    $su=[];
    $su['department']=$_POST['department'];
    $su['name']=$_POST['name'];
    $su['title']=$_POST['title'];
    $Supervisor->save($su);
}
// print_r($db);
$BasicInformation->save($db);
$basic=$BasicInformation->find(['staffCode'=>$_POST['staffCode']]);
$basicID=$basic['id'];
// print_r($basicID);
?>
<form action="api/add_resume.php" method="post">
    <legend>學歷</legend>
    <div class="form-row">
        <div class="form-group col-4">
            <label for="inputPassword4">學位</label>
            <input type="text" name="degree[]" class="form-control degree">
        </div>
        <div class="form-group col-4">
            <label for="inputPassword4">學校</label>
            <input type="text" name="school[]" class="form-control school">
        </div>
        <div class="form-group col-4">
            <label for="inputPassword4">畢業科系</label>
            <input type="text" name="department[]" class="form-control department">
        </div>
        <div class="form-group col-4">
            <input type="text" name="degree[]" class="form-control degree1">
        </div>
        <div class="form-group col-4">
            <input type="text" name="school[]" class="form-control school1">
        </div>
        <div class="form-group col-4">
            <input type="text" name="department[]" class="form-control department1">
        </div>
        <div class="form-group col-4">
            <input type="text" name="degree[]" class="form-control degree2">
        </div>
        <div class="form-group col-4">
            <input type="text" name="school[]" class="form-control school2">
        </div>
        <div class="form-group col-4">
            <input type="text" name="department[]" class="form-control department2">
        </div>
    </div>
    <div>
        <h3>二、經歷</h3>
    </div>
    <div class="form-row">
        <div class="form-group col-2">
            <label for="inputPassword4">服務單位</label>
            <input type="text" name="serviceUnit[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <label for="inputPassword4">職稱</label>
            <input type="text" name="title[]" class="form-control">
        </div>
        <div class="form-group col-4">
            <label for="inputPassword4">工作內容</label>
            <input type="text" name="jobDescription[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <label for="inputPassword4">起</label>
            <input type="date" name="start[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <label for="inputPassword4">迄</label>
            <input type="date" name="finish[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="serviceUnit[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="title[]" class="form-control">
        </div>
        <div class="form-group col-4">
            <input type="text" name="jobDescription[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="start[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="finish[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="serviceUnit[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="title[]" class="form-control">
        </div>
        <div class="form-group col-4">
            <input type="text" name="jobDescription[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="start[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="finish[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="serviceUnit[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="title[]" class="form-control">
        </div>
        <div class="form-group col-4">
            <input type="text" name="jobDescription[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="start[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="finish[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="serviceUnit[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="title[]" class="form-control">
        </div>
        <div class="form-group col-4">
            <input type="text" name="jobDescription[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="start[]" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="finish[]" class="form-control">
        </div>
    </div>
    <input type="hidden" name="id" value="<?=$basicID;?>">
    <button type="submit" class="btn btn-primary">新增</button>
    <input type="reset" class="btn btn-warning " value="重置">
</form>