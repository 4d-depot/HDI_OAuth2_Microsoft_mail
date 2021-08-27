//%attributes = {}
Form:C1466.mail:=New object:C1471
Form:C1466.mailDisplay:=cs:C1710.MailDisplay.new()

Form:C1466.trace:=False:C215


Form:C1466.numberMails:=10
ARRAY TEXT:C222(Attachments; 0)

OBJECT SET ENABLED:C1123(*; "connect_bt"; False:C215)
OBJECT SET ENABLED:C1123(*; "token_bt"; True:C214)

Form:C1466.connectResultSMTP:=""
Form:C1466.connectResultIMAP:=""

Form:C1466.trace:=False:C215

Form:C1466.part1:="Authentication and token request done by calling the getToken() function."
Form:C1466.part2:="Using the token to send or receive emails."
Form:C1466.part3:="getToken() automatically refreshes the token when necessary."