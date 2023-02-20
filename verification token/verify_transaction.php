<?php

require_once("PaytmChecksum.php");
include "paytm_credentials.php";

$ordrerId = $_POST['orderId'];
$paytmParams = array();
$paytmParams["body"] = array(

    "mid" => $merchantId,
    "orderId" => $ordrerId 
);


$checksum = PaytmChecksum::generateSignature(json_encode($paytmParams["body"], JSON_UNESCAPED_SLASHES),$merchantId);


$paytmParams["head"] = array(
    "signature" => $checksum
);

$post_data = json_encode($paytmParams,JSON_UNESCAPED_SLASHES);

$url = "https://securegw-stage.paytm.in/v3/order/status";

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_POST,1);
curl_setopt($ch,CURLOPT_POSTFIELDS, $post_data);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
curl_setopt($ch,CURLOPT_HTTPHEADER,array('Content-Type: application/json'));
$response = curl_exec($ch);
echo $response;
?>