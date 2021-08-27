
var $transporterParam; $smtp : Object

If (Form:C1466.trace)
	TRACE:C157
End if 


// ask for the token to the Gmail server
If (String:C10(Form:C1466.OAuth2.token.access_token)#"")
	If (String:C10(Form:C1466.user)#"")
		Form:C1466.mailsmtp.from:=Form:C1466.user
		Form:C1466.connectResultSMTP:=""
		Form:C1466.connectResultIMAP:=""
		
		// Init the transporter parameters object with the token obtained
		$transporterParam:=cs:C1710.Transporters.new(Form:C1466.user; Form:C1466.OAuth2)
		
		
		// ********************** SMTP ********************
		
		// Init SMTP transporter with the token
		$smtp:=SMTP New transporter:C1608($transporterParam.SMTP())
		
		Form:C1466.statusSMTP:=$smtp.checkConnection()
		
		If (Form:C1466.statusSMTP.success)
			Form:C1466.connectResultSMTP:="Connected to SMTP server"
		Else 
			ALERT:C41("Access denied to SMTP server")
		End if 
		
		// ********************** IMAP ********************
		
		// Init IMAP transporter with the token
		Form:C1466.imap:=IMAP New transporter:C1723($transporterParam.IMAP())
		
		Form:C1466.statusIMAP:=Form:C1466.imap.checkConnection()
		
		If (Form:C1466.statusIMAP.success)
			
			Form:C1466.connectResultIMAP:="Connected to IMAP server"
			
			Form:C1466.mailboxes:=cs:C1710.MailBoxes.new(Form:C1466.imap)
			ListRef:=Form:C1466.mailboxes.createList(Form:C1466.mailboxes.lvlMin)
		Else 
			ALERT:C41("Access denied to IMAP server")
		End if 
	Else 
		ALERT:C41("Please enter a user email address")
	End if 
Else 
	ALERT:C41("No token present")
End if 
