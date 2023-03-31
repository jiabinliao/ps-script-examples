$ret= egosh resource list -ll
<# $ret is something like below.
"NAME","status","mem","swp","tmp","ut","it","pg","r1m","r15s","r15m","ls"
"gbwd9016632.gbl.ad.hedani.net","ok","18G","30G","41G","2%","3","473.3","0.4","0.1","0.1","0"
"gbwd9016633.gbl.ad.hedani.net","ok","18G","30G","41G","1%","33","4.0","0.1","0.0","0.8","0"
"gbwd9016635.gbl.ad.hedani.net","ok","18G","30G","41G","2%","3","406.8","0.2","0.0","0.1","0"#>

#want to select only column 1 and 2, and remove quotation mark.
$ret |Select-String -Notmatch "Name"| ForEach-Object {($data=$_ -split ",")[0] +" "+ $data[1] -replace '"',''}
<#result is
gbwd9016632.gbl.ad.hedani.net ok
gbwd9016633.gbl.ad.hedani.net ok
gbwd9016635.gbl.ad.hedani.net ok#>