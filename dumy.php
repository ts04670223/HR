<?php
include_once "base.php";

// 創立員工假個人資料
for ($i=1; $i <=15 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小明".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=1;
$BasicInformation->save($db);
}

for ($i=16; $i <=30 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小明".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=2;
    $BasicInformation->save($db);
}

for ($i=1; $i <=15 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小花".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=3;
$BasicInformation->save($db);
}
for ($i=16; $i <=30 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小花".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=4;
    $BasicInformation->save($db);
}
for ($i=1; $i <=15 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小新".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=5;
$BasicInformation->save($db);
}
for ($i=16; $i <=30 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小新".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=6;
    $BasicInformation->save($db);
}
for ($i=1; $i <=5 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小依".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=7;
    $BasicInformation->save($db);
}
for ($i=6; $i <=10 ; $i++) { 
    $db=[];
    $db['department']=rand(1,4);
    $db['staffCode']=rand(1,1000);
    $db['name']="小依".$i;
    $db['onDuty']=date("Y-m-d");
    $db['position']=0;
    $db['supervisor']=8;
$BasicInformation->save($db);
}

// 創立員工假學歷
for ($i=1; $i <=15 ; $i++) { 
    $db=[];
    $db['degree']="高中";
$db['school']="新北市立新莊高級中學";
$db['department']="普通科";
$db['basicInformationID']=$i;
$Education->save($db);
}
for ($i=16; $i <=30 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="東海高級中學";
    $db['department']="餐飲管理科";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=31; $i <=45 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立丹鳳高中";
    $db['department']="普通科";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=46; $i <=60 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市泰山區泰山高級中學";
$db['department']="普通科";
$db['basicInformationID']=$i;
$Education->save($db);
}
for ($i=61; $i <=75 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="私立醒吾高級中學附設國中部";
    $db['department']="普通科";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=76; $i <=90 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立海山高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=91; $i <=100 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立三民高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=$i;
    $Education->save($db);
}


for ($i=1; $i <=15 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=16; $i <=30 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="長庚大學";
    $db['department']="醫學系";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=31; $i <=45 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="東吳大學";
    $db['department']="法律系";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=46; $i <=60 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="國立體育大學";
    $db['department']="體育系";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=61; $i <=75 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="大同大學";
    $db['department']="電機系";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=76; $i <=90 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="臺灣大學";
    $db['department']="會計系";
    $db['basicInformationID']=$i;
    $Education->save($db);
}
for ($i=91; $i <=100 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="國立臺北商業大學";
    $db['department']="會計系";
    $db['basicInformationID']=$i;
    $Education->save($db);
}

// 創立員工假經歷
for ($i=1; $i <=15 ; $i++) { 
    $db=[];
    $db['serviceUnit']="聯電";
    $db['title']="技術員";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=$i;
    $Experience->save($db);
}
for ($i=16; $i <=30 ; $i++) { 
    $db=[];
    $db['serviceUnit']="台積電";
    $db['title']="技術員";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=$i;
    $Experience->save($db);
}
for ($i=31; $i <=45 ; $i++) { 
    $db=[];
    $db['serviceUnit']="華碩";
    $db['title']="前端工程師";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=$i;
    $Experience->save($db);
}
for ($i=46; $i <=60 ; $i++) { 
    $db=[];
    $db['serviceUnit']="南科";
    $db['title']="技術員";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=$i;
    $Experience->save($db);
}
for ($i=61; $i <=75 ; $i++) { 
    $db=[];
    $db['serviceUnit']="國賓";
    $db['title']="櫃員";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=$i;
    $Experience->save($db);
}
for ($i=76; $i <=90 ; $i++) { 
    $db=[];
    $db['serviceUnit']="統一超商";
    $db['title']="收銀員";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=$i;
    $Experience->save($db);
}
for ($i=91; $i <=100 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=$i;
    $Experience->save($db);
}


// 創立department1主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=1;
    $db['staffCode']=rand(1,1000);
    $db['name']="鄭花花";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="鄭花花";
    $sur['department']=1;
    $sur['title']="經理";
    $Supervisor->save($sur);
}

// 創立department1主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=101;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=101;
    $Education->save($db);
}
// 創立department1主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=101;
    $Experience->save($db);
}
// 創立department1主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=1;
    $db['staffCode']=rand(1,1000);
    $db['name']="鄭一方";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="鄭一方";
    $sur['department']=1;
    $sur['title']="副理";
    $Supervisor->save($sur);
}

// 創立department1主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=102;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=102;
    $Education->save($db);
}
// 創立department1主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=102;
    $Experience->save($db);
}

// 創立department2主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=2;
    $db['staffCode']=rand(1,1000);
    $db['name']="陳發發";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="陳發發";
    $sur['department']=2;
    $sur['title']="經理";
    $Supervisor->save($sur);
    
}

// 創立department2主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=103;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=103;
    $Education->save($db);
}
// 創立department2主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=103;
    $Experience->save($db);
}
// 創立department2主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=2;
    $db['staffCode']=rand(1,1000);
    $db['name']="林黃依";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="林黃依";
    $sur['department']=2;
    $sur['title']="副理";
    $Supervisor->save($sur);
}

// 創立department2主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=104;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=104;
    $Education->save($db);
}
// 創立department2主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=104;
    $Experience->save($db);
}


// 創立department3主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=3;
    $db['staffCode']=rand(1,1000);
    $db['name']="蔡黃如";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="蔡黃如";
    $sur['department']=3;
    $sur['title']="經理";
    $Supervisor->save($sur);
}

// 創立department3主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=105;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=105;
    $Education->save($db);
}
// 創立department3主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=105;
    $Experience->save($db);
}


// 創立department3主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=3;
    $db['staffCode']=rand(1,1000);
    $db['name']="賴旺宏";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="賴旺宏";
    $sur['department']=3;
    $sur['title']="副理";
    $Supervisor->save($sur);
}

// 創立department3主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=106;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=106;
    $Education->save($db);
}
// 創立department3主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=106;
    $Experience->save($db);
}


// 創立department4主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=4;
    $db['staffCode']=rand(1,1000);
    $db['name']="林依芳";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="林依芳";
    $sur['department']=4;
    $sur['title']="經理";
    $Supervisor->save($sur);
}

// 創立department4主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=107;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=107;
    $Education->save($db);
}
// 創立department4主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=107;
    $Experience->save($db);
}
// 創立department4主管假個人資料
for($i=1;$i<=1;$i++){
    $db=[];
    $db['department']=4;
    $db['staffCode']=rand(1,1000);
    $db['name']="陳芳瑜";
    $db['onDuty']=date("Y-m-d");
    $db['position']=1;
    $BasicInformation->save($db);
    $sur=[];
    $sur['name']="陳芳瑜";
    $sur['department']=4;
    $sur['title']="副理";
    $Supervisor->save($sur);
}

// 創立department4主管假學歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="高中";
    $db['school']="新北市立新莊高級中學";
    $db['department']="普通科";
    $db['basicInformationID']=108;
    $Education->save($db);
}
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['degree']="大學";
    $db['school']="輔仁大學";
    $db['department']="醫學系";
    $db['basicInformationID']=108;
    $Education->save($db);
}
// 創立department4主管假經歷
for ($i=1; $i <=1 ; $i++) { 
    $db=[];
    $db['serviceUnit']="中視";
    $db['title']="導演";
    $db['jobDescription']="完成主管交辦任務";
    $today=date("Y-m-d");
    $db['start']=date("Y-m-d",strtotime("-30 day",strtotime($today)));
    $db['finish']=date("Y-m-d");
    $db['basicInformationID']=108;
    $Experience->save($db);
}
to("index.php");

?>