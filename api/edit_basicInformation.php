<?php
include_once "../base.php";
$db=[];
$db['department']=$_POST['department'];
$db['staffCode']=$_POST['staffCode'];
$db['name']=$_POST['name'];
$db['onDuty']=$_POST['onDuty'];
$db['id']=$_POST['id'];
if(!empty($Supervisor->find(['name'=>$_POST['supName']]))){
    $s=$Supervisor->find(['name'=>$_POST['supName']]);
}
// print_r($s);
// echo $_POST['title'];
if($_POST['title']=='0'){
    $db['position']=0;
    $db['supervisor']=$_POST['supervisor'];
}else {
    $db['position']=1;
    $s['department']=$_POST['department'];
    $s['name']=$_POST['name'];
    $s['title']=$_POST['title'];
    $Supervisor->save($s);
}
// print_r($db);
$BasicInformation->save($db);
// echo $_POST['staffCode'];
$basic=$BasicInformation->find(['staffCode'=>$_POST['staffCode']]);
$basicID=$basic['id'];
?>
<form action="api/edit_resume.php" method="post">
    <legend>學歷</legend>
    <div class="form-row">
        <div class="form-group col-4">
            <label for="inputPassword4">學位</label>
        </div>
        <div class="form-group col-4">
            <label for="inputPassword4">學校</label>
        </div>
        <div class="form-group col-4">
            <label for="inputPassword4">畢業科系</label>
        </div>
        <?php
        $education=$Education->all(['basicInformationID'=>$basicID]);
        foreach($education as $key=>$value){
            ?>
        <div class="form-group col-4">
            <input type="text" name="degree[]" value="<?=$value['degree'];?>" class="form-control degree1">
        </div>
        <div class="form-group col-4">
            <input type="text" name="school[]" value="<?=$value['school'];?>" class="form-control school1">
        </div>
        <div class="form-group col-4">
            <input type="text" name="department[]" value="<?=$value['department'];?>" class="form-control department1">
        </div>
        <input type="hidden" name="eduID[]" value="<?=$value['id'];?>">
        <?php
        }
        ?>
    </div>
    <div>
        <h3>二、經歷</h3>
    </div>
    <div class="form-row">
        <div class="form-group col-2">
            <label for="inputPassword4">服務單位</label>
        </div>
        <div class="form-group col-2">
            <label for="inputPassword4">職稱</label>
        </div>
        <div class="form-group col-4">
            <label for="inputPassword4">工作內容</label>
        </div>
        <div class="form-group col-2">
            <label for="inputPassword4">起</label>
        </div>
        <div class="form-group col-2">
            <label for="inputPassword4">迄</label>
        </div>
        <?php
        $experience=$Experience->all(['basicInformationID'=>$basicID]);
        foreach($experience as $key=>$value){
            ?>

        <div class="form-group col-2">
            <input type="text" name="serviceUnit[]" value="<?=$value['serviceUnit'];?>" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="text" name="title[]" value="<?=$value['title'];?>" class="form-control">
        </div>
        <div class="form-group col-4">
            <input type="text" name="jobDescription[]" value="<?=$value['jobDescription'];?>" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="start[]" value="<?=$value['start'];?>" class="form-control">
        </div>
        <div class="form-group col-2">
            <input type="date" name="finish[]" value="<?=$value['finish'];?>" class="form-control">
        </div>
        <input type="hidden" name="expID[]" value="<?=$value['id'];?>">
        <?php
        }
        ?>
    </div>
    <input type="hidden" name="id" value="<?=$basicID;?>">
    <button type="submit" class="btn btn-primary">編輯</button>
    <input type="reset" class="btn btn-warning " value="重置">
</form>