﻿$KerbiEvents = Get-WinEvent -Logname security -FilterXPath "Event[System[(EventID=4769)]]and Event[EventData[Data[@Name='TicketEncryptionType']='0x17']]or Event[EventData[Data[@Name='TicketEncryptionType']='0x18']]" |

Select-Object `
@{Label='Time';Expression={$_.TimeCreated.ToString('g')}},
@{Label='UserName';Expression={$_.Properties[0].Value}},
@{Label='IPAddress';Expression={$_.Properties[6].Value}},
@{Label="ServiceName";Expression={$_.properties[2].value}},
@{Label="EncryptionType";Expression={$_.properties[5].value}}

 

$KerbiEvents | Out-Gridview