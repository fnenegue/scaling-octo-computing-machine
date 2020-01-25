<?php 
//function  MyFunc() {
//$file_db = new PDO('sqlite:'.$conf['metadir'].'/'.'struct.sqlite3');
//$file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//$sql = "SELECT name,sql FROM sqlite_master WHERE type='table' ORDER BY name";
//$result = $file_db->query($sql);
//if (!$result) echo "empty";
//foreach($result as $row) {
//      echo "name: " . $row['name'] . "<br>\n";
//      echo "sql : " . $row['sql'] . "<br>\n";
//      echo "<br>\n";
//   }
//echo "Обнови страницу!";
$file_db = new PDO('sqlite:'.$conf['metadir'].'/'.'struct.sqlite3');
$file_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sql = "SELECT * FROM data_avrora21work WHERE latest and pid like '".$pidr.":work:utp-0093-000%'";
$result = $file_db->query($sql);
if (!$result) echo "empty";
foreach($result as $row) {
      echo $row['pid'] . $row['col1'] . $row['col6'] . "<br>\n";
      echo "<br>\n";
      $sqlupd = "update data_avrora21work set col6='upd' WHERE latest and pid='" . $row['pid'] . "'";
      echo $sqlupd . "<br>\n";
      $file_db->exec($sqlupd);
    }
echo "Refresh page!";
//}
?>


