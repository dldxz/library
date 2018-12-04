<?php
include 'mysql_info.php';
function encodes(array $payload, string $key, string $alg)
{
    $key = md5($key);
    $jwt = base64_encode(json_encode(['typ' => 'JWT', 'alg' => $alg])) . '.' . base64_encode(json_encode($payload));
    return $jwt . '.' . signature($jwt, $key, $alg);
}

function signature(string $input, string $key, string $alg)
{
    return hash_hmac($alg, $input, $key);
}

function check_token(string $token)
{
	$info = explode('.',$token);
	$user_info = json_decode(base64_decode($info[1]));
	if(encodes($user_info,$key,'SHA256') == $token)
	{
		return $user_info;
	}
	else
	{
		return "Check Faild!!!";
	}
}

 ?>
