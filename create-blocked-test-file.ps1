'Hello world' | Set-Content .\test-files\dummy.pdf

@"
[ZoneTransfer]
ZoneId=3
"@ | Set-Content -Path .\test-files\dummy.pdf -Stream Zone.Identifier
