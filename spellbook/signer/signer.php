<?php

/**
 * Usage:
 *
 *   php signer.php [optional hash - defaults to environment] [optional json - defaults to STDIN if not provided]
 *
 */

$hash = isset($argv[2]) ? $argv[2] : 'ph7a7Bb8QMb7UVg6X6vTU7Y9AogK26Ry';
$json = isset($argv[3]) ? $argv[3] : NULL;
if ( ! isset($json) ) $json = file_get_contents('php://stdin');
$request = json_decode(trim($json));

if ( ! isset($request) ) {
  echo('Invalid JSON data provided.');
  exit(1);
}

$request->ts = round(microtime(TRUE) * 1000);

echo getSignedRequest($hash, json_encode($request));
echo(0);

function getSignedRequest($hash, $jsonString)
{
  $signature = getSignature($hash, $jsonString);
  return $signature . "." . base64UrlEncode($jsonString);
}

function getSignature($hash, $jsonString)
{
  $payload = base64UrlEncode($jsonString);
  return base64UrlEncode(hash_hmac('sha256', $payload, $hash, $raw = TRUE));
}
 
function base64UrlEncode($input)
{
  return strtr(rtrim(base64_encode($input), '='), '+/', '-_');
}
 
function base64UrlDecode($input)
{
  return base64_decode(strtr($input, '-_', '+/'));
}