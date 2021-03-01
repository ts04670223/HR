<?php
include_once "base.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人力資源盤點</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>

<body class="table-dark">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1>人力資源盤點</h1>
            </div>
            <div class="col-12">
                <h3>一、員工基本資料</h3>
            </div>
            <form>
                <div class="form-row dis">
                    <div class="form-group col-6">
                        <label for="inputEmail4">所屬部門</label>
                        <select class="custom-select mr-sm-2" name="department" id="department">
                            <option selected>Choose...</option>
                            <?php
                            $department=$Department->all();
                            foreach($department as $key=>$value){
                                ?>
                            <option value="<?=$value['id'];?>"><?=$value['department'];?></option>
                            <?php
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group col-6">
                        <label for="inputPassword4">員工編號</label>
                        <input type="number" name="staffCode" class="form-control" id="staffCode">
                    </div>
                    <div class="form-group col-6">
                        <label for="inputPassword4">姓名</label>
                        <input type="text" name="name" class="form-control" id="name">
                    </div>
                    <div class="form-group col-6">
                        <label for="inputPassword4">到職日期</label>
                        <input type="date" name="onDuty" class="form-control" id="onDuty">
                    </div>
                    <fieldset class="form-group">
                        <div class="row">
                            <legend class="col-form-label col-sm-2 pt-0">職位</legend>
                            <div class="col-sm-10">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gridRadios" id="position"
                                        value="option1" checked>
                                    <label class="form-check-label" for="gridRadios1">
                                        非主管級人員
                                    </label>
                                </div>
                                <select class="custom-select mr-sm-2 mb-3" id="supervisor">
                                    <option selected>Choose...</option>
                                    <?php
                            $supervisor=$Supervisor->all();
                            foreach($supervisor as $key=>$value){
                                ?>
                                    <option value="<?=$value['id'];?>"><?=$value['name'];?></option>
                                    <?php
                            }
                            ?>
                                </select>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="gridRadios" value="option"
                                        checked>
                                    <label class="form-check-label" for="gridRadios2">
                                        主管級人員(轄有部屬)
                                    </label>
                                </div>
                                <select class="custom-select mr-sm-2 mb-3" id="title">
                                    <option value="0" selected>Choose...</option>
                                    <option value="經理">經理</option>
                                    <option value="副理">副理</option>
                                </select>

                            </div>
                            <input type="button" id="sub" class="ml-3 btn btn-primary" value="新增">
                            <input type="reset" class="ml-2 btn btn-warning " value="重置">
                    </fieldset>
                </div>
            </form>
            <div class="sho" style="display:none">

            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous">
    </script>
    <script>
    $("#sub").on("click", function() {
        $(".dis,.sho").toggle();
        let department = $("#department").val();
        let staffCode = $("#staffCode").val();
        let name = $("#name").val();
        let onDuty = $("#onDuty").val();
        let position = $("#position").val();
        let supervisor = $("#supervisor").val();
        let title = $("#title").val();
        $.post("api/add_basicInformation.php", {
            department,
            staffCode,
            name,
            onDuty,
            position,
            supervisor,
            title
        }, function(ht) {

            $(".sho").html(ht);
        })
    })
    </script>
</body>

</html>