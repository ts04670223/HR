<?php
date_default_timezone_set("Asia/Taipei");
session_start();
$BasicInformation=new DB('basicInformation');
$Department=new DB('department');
$Education=new DB('education');
$Experience=new DB('experience');
$Supervisor=new DB('supervisor');
$dsn = "sqlsrv:Server=DATA;Database=hr";
class DB
{
  protected $table;
  protected $dsn = "sqlsrv:Server=localhost;Database=hr";
  protected $pdo;

  function __construct($table)
  {
    $this->table = $table;
    $this->pdo = new PDO($this->dsn, 'qq', '1234');
  }
  function all(...$arg)
  {
    $sql = "select * from $this->table";
    if (isset($arg[0])) {
      if (is_array($arg[0])) {
        foreach ($arg[0] as $key => $value) {
          $tmp[] = sprintf("%s='%s'", $key, $value);
        }
        $sql .= " where " . implode(" AND ", $tmp);
      } else {
        $sql .= $arg[0];
      }
    }
    if (isset($arg[1])) {
      $sql .= $arg[1];
    }
    
    return $this->pdo->query($sql)->fetchAll();
  }
  function count(...$arg)
  {
    $sql = "select count(*) from $this->table ";

    if (isset($arg[0])) {
      if (is_array($arg[0])) {
        foreach ($arg[0] as $key => $value) {
          $tmp[] = sprintf("%s='%s'", $key, $value);
        }

        $sql .= " where " . implode(" AND ", $tmp);
      } else {
        $sql .= $arg[0];
      }
    }

    if (isset($arg[1])) {
      $sql .= $arg[1];
    }

    return $this->pdo->query($sql)->fetchColumn();
  }
  function find($id)
  {
    $sql = "select * from $this->table ";
    if (is_array($id)) {
      foreach ($id as $key => $value) {
        $tmp[] = sprintf("%s='%s'", $key, $value);
      }
      $sql .= " where " . implode(" AND ", $tmp);
    } else {
      $sql .= " where id='$id'";
    }
    return $this->pdo->query($sql)->fetch(PDO::FETCH_ASSOC);
  }

  function del($id)
  {
    $sql = "delete from $this->table ";

    if (is_array($id)) {
      foreach ($id as $key => $value) {
        $tmp[] = sprintf("%s='%s'", $key, $value);
      }
      $sql .=" where " .implode(" AND ", $tmp);
    } else {
      $sql .= " where id='{$id}'";
    }
    echo $sql;
    return $this->pdo->exec($sql);
  }
  function save($arr)
  {
    if (isset($arr['id'])) {
      $id=$arr['id'];
      unset($arr['id']);
      foreach ($arr as $key => $value) {
        $tmp[] = sprintf("[%s]='%s'", $key, $value);
      }
      $sql=implode(',', $tmp);
      $sql = "update $this->table set " . implode(',', $tmp). " where id='{$id}'";
    } else {
      $sql = "insert into $this->table ([" . implode("],[", array_keys($arr)) . "]) values('" . implode("','", $arr) . "')";
    }
    // print_r($sql) ;
    return $this->pdo->exec($sql);
  }

  function q($sql)
  {
    return $this->pdo->query($sql)->fetchAll();
  }

}
function to($url)
{
  header("location:" . $url);
}