
var $status; $param : Object

If (Form:C1466.trace)
	TRACE:C157
End if 


$param:=New object:C1471()
$param.name:="Microsoft"
$param.permission:="signedIn"
// Parameters create in Microsoft identity platform
$param.clientId:="7008ebf5-f013-4d92-ad5b-8c2252c460fc"
$param.redirectURI:="http://127.0.0.1:50993/authorize/"
// Ask for a refresh token + IMAP + SMTP
$param.scope:="offline_access https://outlook.office.com/IMAP.AccessAsUser.All https://outlook.office.com/SMTP.Send"

Form:C1466.OAuth2:=New OAuth2 provider($param)
ShowConnectBt(Form:C1466.OAuth2.getToken()#Null:C1517)