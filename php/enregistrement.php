<?php

ini_set("display_errors", 1);
ini_set("display_startup_errors", 1);
error_reporting(E_ALL);

$cnx = mysqli_connect("localhost", "root", "wesker", "BD_441920") or die(mysqli_error($cnx));

$cin = $_POST["expediteur"];
$tel = $_POST["teldist"];
$nom = $_POST["nomdist"];
$addresse = $_POST["addressdist"];
$codepostal = $_POST["codepostal"];
$fragile = $_POST["fragile"];
$transport = $_POST["transporteur"];

$date_sys = Date("Y-m-d H:i:s");

$request_one = "SELECT * FROM `expediteur` WHERE cinExp = '$cin'";
$response_one = mysqli_query($cnx, $request_one) or die(mysqli_error($cnx));

if (mysqli_num_rows($response_one) !== 0) {
  $request_two = "SELECT * FROM `destinataire` WHERE teldest = $tel";
  $response_two = mysqli_query($cnx, $request_two) or die(mysqli_error($cnx));
  $date_modif = strtotime($date_sys . "+ 2 days");
  $new_date = Date("Y-m-d", $date_modif);
  if (mysqli_num_rows($response_two) === 0) {
    $request_three = "INSERT INTO `destinataire` VALUES('$tel', '$nom', '$addresse', '$codepostal')";
    $response_three = mysqli_query($cnx, $request_three) or die(mysqli_error($cnx));
    $request_four = "INSERT INTO `colis`(`dateColis`, `fragile`, `cinExp`, `cinTrans`, `teldest`) VALUES ('$date_sys','$fragile','$cin','$transport','$tel')";
    $response_four = mysqli_query($cnx, $request_four) or die(mysqli_error($cnx));
  } else {
    $request_five = "INSERT INTO `colis`(`dateColis`, `fragile`, `cinExp`, `cinTrans`, `teldest`) VALUES ('$date_sys','$fragile','$cin','$transport','$tel')";
    $response_five = mysqli_query($cnx, $request_five) or die(mysqli_error($cnx));
  }
  if (mysqli_affected_rows($cnx) > 0) {
    echo "Enregistrement réalisé avec succès votre colis arrivera" . " " . $new_date;
  } else {
    echo "Erreur: operation d'ajout echouéé";
  }
} else {
  echo "Erreur: Expéditeur inexistant";
}

mysqli_close($cnx);
