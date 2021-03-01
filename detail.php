<?php
include_once "base.php";
$basicInformation=$BasicInformation->find($_GET['id']);
?>
<table class="table">
    <tr>
        <td>所屬部門</td>
        <td colspan='4'>
            <?php
            $department=$Department->all();
            foreach($department as $ke=>$val){
                if ($basicInformation['department']==$val['id']) {
                    echo $val['department'];
                }
            }
            ?>
        </td>
    </tr>
    <tr>
        <td>員工編號</td>
        <td colspan='4'><?=$basicInformation['staffCode'];?></td>
    </tr>
    <tr>
        <td>姓名</td>
        <td colspan='4'><?=$basicInformation['name'];?></td>
    </tr>
    <tr>
        <td>到職日期</td>
        <td colspan='4'><?=$basicInformation['onDuty'];?></td>
    </tr>
    <tr>
        <td>職位</td>
        <td colspan='4'>
            <?php
    if($basicInformation['position']==0){
        echo "非主管職";
    }else if($basicInformation['position']==1){
        $depar=$basicInformation['department'];
        $dep=$Department->find(['id'=>$depar])['department'];
        echo $dep."主管";
    }
    ?>
        </td>
    </tr>
    <tr>
        <td>主管</td>
        <td colspan='4'>
            <?php
                $supervisor=$Supervisor->all(['id'=>$basicInformation['supervisor']]);
                foreach($supervisor as $ke=>$val){
                    if(!empty($basicInformation['supervisor']==$val['id'])){
                        echo $val['name'];
                    }
                }
                ?>
        </td>
    </tr>
    <td colspan='5'>
        <h4 class="m-3">學歷</h4>
    </td>
    <td></td>
    <td></td>
    <tr>
    <tr>
        <td>
            <h5>學位</h5>
        </td>
        <td colspan='3'>
            <h5>學校</h5>
        </td>
        <td>
            <h5>畢業科系</h5>
        </td>
    </tr>
    <?php
        $education=$Education->all(['basicInformationID'=>$basicInformation['id']]);
        foreach($education as $ke=>$val){
            ?>
    <tr>
        <td><?=$val['degree'];?></td>
        <td colspan='3'><?=$val['school'];?></td>
        <td><?=$val['department'];?></td>
    </tr>
    <?php
        }
        ?>
    </tr>
    <td colspan='5'>
        <h4 class="m-3">經歷</h4>
    </td>
    <tr>
    <tr>
        <td>
            <h5>服務單位</h5>
        </td>
        <td>
            <h5>職稱</h5>
        </td>
        <td>
            <h5>工作內容</h5>
        </td>
        <td>
            <h5>起</h5>
        </td>
        <td>
            <h5>迄</h5>
        </td>
    </tr>
    <?php
        $experience=$Experience->all(['basicInformationID'=>$basicInformation['id']]);
        foreach($experience as $ke=>$val){
            ?>
    <tr>
        <td class="mx-2"><?=$val['serviceUnit'];?></td>
        <td class="mx-2"><?=$val['title'];?></td>
        <td class="mx-2"><?=$val['jobDescription'];?></td>
        <td class="mx-2"><?=$val['start'];?></td>
        <td class="mx-2"><?=$val['finish'];?></td>
    </tr>
    <?php
        }
        ?>
</table>