
var $status; $smtp : Object

If (Bool:C1537(Form:C1466.statusSMTP.success))
	ON ERR CALL:C155("onerr")
	// Init the transporter parameter object with the token obtained
	
	// Init transporter with token
	$smtp:=SMTP New transporter:C1608(cs:C1710.Transporters.new(Form:C1466.user; Form:C1466.OAuth2).SMTP())
	// Send the mail according to the mail information entered in the form
	$status:=$smtp.send(Form:C1466.mailsmtp)
	ON ERR CALL:C155("")
	
	// Verification if send mail is a success or not and display a message
	If ($status.success)
		ALERT:C41("Mail has been sent")
	Else 
		If ($status.status=0)
			ARRAY LONGINT:C221($tcodes; 0)
			ARRAY LONGINT:C221($tcmps; 0)
			ARRAY TEXT:C222($tmess; 0)
			GET LAST ERROR STACK:C1015($tcodes; $tcmps; $tmess)
			ALERT:C41("An error occurred: "+$tmess{1})
		Else 
			ALERT:C41("An error occurred: "+$status.statusText)
		End if 
	End if 
End if 