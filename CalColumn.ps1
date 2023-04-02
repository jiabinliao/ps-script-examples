<#
Requirement: Count based on the column SSMHost.Show output in the console. 

Get-Content .\file1.txt
App	Status	SSMHost	ConsumerID
MCJC1	enabled	uswp204511	/AZEU/MCJC1
MCJC2	enabled	uswp204511	/AZEU/MCJC2
MCJC3	enabled	uswp204511	/AZEU/MCJC3
MCJC4	enabled	uswp204789	/AZEU/MCJC4
MCJC5	enabled	uswp204211	/AZEU/MCJC5
MCJC6	enabled	uswp204908	/AZEU/MCJC6
MCJC7	enabled	uswp204908	/AZEU/MCJC7
MCJC8	enabled	uswp204208	/AZEU/MCJC8
MCJC9	enabled	uswp204511	/AZEU/MCJC9#>

#Load the file.
$Apps= Get-Content .\file1.txt

#Get SSMHost column.
$a = ($Apps | ForEach-Object {($data = $_ -split '\s+')[2]}|Select-String -NotMatch SSM)

#Get unique value.
$b = $a | select -Unique

#Get the final result.
$b | ForEach-Object {"$_ => " + ($a | Select-String $_  | Measure-Object | Select-Object -ExpandProperty Count)}