
if(Test-Path "M:\AppList.txt"){ 
    #Loop through the app list
    Get-Content "AppList.txt" | %{
        #Define what each job does.
        $ScriptBlock = {
            param($AppName)
            if($AppName -ne $null){
                soamview app $AppName -p | Set-Content -Force -Path M:\$AppName.xml -Verbose -Encoding ASCII
                if($?){
                        soamreg M:\$AppName.xml -f >> "M:\Reg.$AppName.log"
                        Start-Sleep -Seconds 5
                }else {
                    Write-Host "$AppName profile not saved. " >> "Reg.$AppName.log"
                }
             }else {
                Write-Host "$AppName has something wrong. " >> "Reg.$AppName.log"
             }

        }

        #start jobs at background in parallel.
        Start-Job $ScriptBlock -ArgumentList $_ 

        }
}