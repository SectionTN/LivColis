<?php

ini_set("display_errors", 1);
ini_set("display_startup_errors", 1);
error_reporting(E_ALL);

$cnx = mysqli_connect("localhost", "root", "wesker", "BD_441920") or die(mysqli_error($cnx));

$dd = Date("Y-m-d H:i:s", strtotime($_POST["startdate"] . " " . "00:00:00"));
$df = Date("Y-m-d H:i:s", strtotime($_POST["enddate"] . " ". "23:59:59"));


$etat = "";
$request_one = "";

if (isset($_POST["nl"]) and isset($_POST["l"])) {
  $etat = "deux";
  $request_one = "SELECT C.idColis, C.dateColis, D.nomDest, D.adrDest, D.codePostal, C.etat FROM `colis` C, `destinataire` D, `expediteur` E WHERE C.teldest = D.teldest AND E.cinExp = C.cinExp AND C.etat = 0 OR C.etat = 1 AND C.dateColis between '$dd' AND '$df' ORDER BY C.dateColis DESC";
} else if (isset($_POST["nl"])) {
  $etat = "zero";
  $request_one = "SELECT C.idColis, C.dateColis, D.nomDest, D.adrDest, D.codePostal, C.etat FROM `colis` C, `destinataire` D, `expediteur` E WHERE C.teldest = D.teldest AND E.cinExp = C.cinExp AND C.etat = 0 AND C.dateColis between '$dd' AND '$df' ORDER BY C.dateColis DESC";
} else {
  $etat = "une";
  $request_one = "SELECT C.idColis, C.dateColis, D.nomDest, D.adrDest, D.codePostal, C.etat FROM `colis` C, `destinataire` D, `expediteur` E WHERE C.teldest = D.teldest AND E.cinExp = C.cinExp AND C.etat = 1 AND C.dateColis between '$dd' and '$df' ORDER BY C.dateColis DESC";
}
var_dump($request_one);

$response_one = mysqli_query($cnx, $request_one) or die(mysqli_error($cnx));

echo("<table border = 1>");
echo("<tr>
       <td>Colis</td>
       <td>Date Depot</td>
       <td>Destinataire</td>
       <td>Adresse destinataire</td>
       <td>Etat</td></tr>");

while ($T = mysqli_fetch_array($response_one)) {
  $etat = $T[5];
  $message = "";
  if ($etat == 1) {
    echo ("$etat");
    $message = "Livré";
  } else {
    $message = "Non Livré";
  }
  echo("<tr>
       <td>$T[0]</td>
       <td>$T[1]</td>
       <td>$T[2]</td>
       <td>$T[3]</td>
       <td>$message</td></tr>");
}

echo "</table>";
