<?php
/*
* import checksum generation utility
* You can get this utility from https://developer.paytm.com/docs/checksum/
*/
require_once("PaytmChecksum.php");
include 'paytm_credentials,php';
$amount = $_POST["amount"];
$paytmParams = array();

$orderId = "ORDERID_".mt_rand()
$paytmParams["body"] = array(
 "requestType"  => "Payment",
 "mid"  =>  $merchantId,
 "websiteName"  => "YOUR_WEBSITE_NAME",
 "orderId"  => $orderId;
 "callbackUrl"  => "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=".$orderId,
 "txnAmount"  => array(
 "value"  => $amount,
 "currency" => "INR",
 ),
 "userInfo"=> array(
 "custId" => mt_rand(),
 ),
);

/*
* Generate checksum by parameters we have in body
* Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys 
*/
$checksum = PaytmChecksum::generateSignature(json_encode($paytmParams["body"], JSON_UNESCAPED_SLASHES), $merchantId);

$paytmParams["head"] = array(
 "signature"=> $checksum
);

$post_data = json_encode($paytmParams, JSON_UNESCAPED_SLASHES);

/* for Staging */
$url = "https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid=$merchantId &orderId=$orderId";

/* for Production */
// $url = "https://securegw.paytm.in/theia/api/v1/initiateTransaction?mid=YOUR_MID_HERE&orderId=ORDERID_98765";

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
curl_setopt($ch, CURLOPT_HTTPHEADER, array("Content-Type: application/json")); 
$res = curl_exec($ch);
$res_json = json_decode($res,true);
if($res_json["body"]['resultInfo']["resultCode"]=="0000"){
    $response=array();
    $response["mid"] = $merchantId;
    $response["txToken"] = $res_json["body"]["tcnToken"];
    $response['orderId'] = $orderId;
    echo json_encode($response);
}else{
    http_response_code($res_json["body"]["resultInfo"]["resultMsg"])
}
?>

