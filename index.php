<?php
include_once "base.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.23/datatables.min.css" />

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.23/datatables.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
    </script>

    <style>
    #cover {
        width: 100%;
        height: 100%;
        position: fixed;
        z-index: 5;
        background: rgba(51, 51, 51, 0.4);
        top: 0px;
        left: 0px;
        overflow: auto;
    }

    #coverr {
        position: fixed;
        background: #333333AA;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-basis: 50%;
        color: white;
        font-weight: bolder;
        text-align: center;
    }
    </style>
</head>

<body class="p-5 ">
    <div id="cover" style="display:none;">
        <div id="coverr">
            <a style="position:absolute; right:20%; top:5%; cursor:pointer; z-index:9999;"
                class="btn btn-danger btn-link btn-sm" onclick="cl('#cover')"><i class="material-icons">X</i></a>
            <div id="cvr">
            </div>
        </div>
    </div>
    <table id="example" class="display table" style="width:100%">
        <thead class="table-dark">
            <tr>
                <th>所屬部門</th>
                <th>員工編號</th>
                <th>姓名</th>
                <th>到職日期</th>
                <th>職位</th>
                <th>直屬主管</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <?php
$basicInformation=$BasicInformation->all();
$department=$Department->all();
foreach($basicInformation as $key=>$value){
    ?>
            <tr>
                <td>
                    <?php
    foreach($department as $ke=>$val){
    if ($val['id']==$value['department']) {
        echo $val['department'];
    }
    }
    ?>
                </td>
                <td><?=$value['staffCode'];?></td>
                <td><?=$value['name'];?></td>
                <td><?=$value['onDuty'];?></td>
                <td>
                    <?php
    if($value['position']==0){
        echo "非主管職";
    }else if($value['position']==1){
        $depar=$value['department'];
        $dep=$Department->find(['id'=>$depar])['department'];
        echo $dep."主管";
    }
    ?>
                </td>
                <td>
                    <?php
                $supervisor=$Supervisor->all();
                foreach($supervisor as $ke=>$val){
                    if(!empty($value['supervisor']==$val['id'])){
                        echo $val['name'];
                    }
                }
                ?>
                </td>
                <td>
                    <a href="edit.php?id=<?=$value['id'];?>&name=<?=$value['name'];?>"><input type="button"
                            class="btn btn-success" value="編輯"></a>
                    <input type="button"
                        onclick="op('#cover','#cvr','detail.php?id=<?=$value['id'];?>&name=<?=$value['name'];?>')"
                        class="btn btn-info" value="詳細">
                    <input type="button" class="btn btn-danger" onclick="del(<?=$value['id'];?>,'<?=$value['name'];?>')"
                        value="刪除">
                </td>
                <?php
}
?>
        </tbody>
        <tfoot class="table-dark">
            <tr>

                <th>所屬部門</th>
                <th>員工編號</th>
                <th>姓名</th>
                <th>到職日期</th>
                <th>職位</th>
                <th>直屬主管</th>
                <th>操作</th>
            </tr>
        </tfoot>
    </table>
    <a href="add.php"><input type="button" class="btn btn-dark" value="新增人員"></a>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
    </script>

    <script>
    $(document).ready(function() {
        $('#example').DataTable();
    });
    </script>

    <script>
    function del(id, name) {
        if (confirm('確定要刪除嗎?') == true) {
            $.post("api/del.php", {
                id,
                name
            }, function() {
                location.reload();
            })
        }
    }

    function lo(x) {
        location.replace(x)
    }

    function op(x, y, url) {
        $(x).fadeIn()
        if (y)
            $(y).fadeIn()
        if (y && url)
            $(y).load(url)
    }

    function cl(x) {
        $(x).fadeOut();
    }
    </script>
</body>

</html>