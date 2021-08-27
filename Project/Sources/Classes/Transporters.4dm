Class constructor($user : Text; $OAuth2 : Object)
	This:C1470.user:=$user
	This:C1470.OAuth2:=$OAuth2
	
Function IMAP->$parameters : Object
	$parameters:=New object:C1471
	// This.OAuth2.getToken() verify if a valid token is present
	// If not, ask for a new token
	$parameters.accessTokenOAuth2:=This:C1470.OAuth2.getToken().token.access_token
	$parameters.authenticationMode:=IMAP authentication OAUTH2:K90:23
	$parameters.user:=This:C1470.user
	$parameters.host:="Outlook.office365.com"
	$parameters.port:=993
	
	//$parameters.logFile:="imap.log"
	
Function SMTP->$parameters : Object
	$parameters:=New object:C1471
	// This.OAuth2.getToken() verify if a valid token is present
	// If not, ask for a new token
	$parameters.accessTokenOAuth2:=This:C1470.OAuth2.getToken().token.access_token
	$parameters.authenticationMode:=SMTP authentication OAUTH2:K90:21
	$parameters.user:=This:C1470.user
	$parameters.host:="smtp.office365.com"
	$parameters.port:=587
	
	//$parameters.logFile:="smtp.log"