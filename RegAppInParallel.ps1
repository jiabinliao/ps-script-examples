#Loop through the app list
Get-Content "AppList.txt" | %{

    #Define what each job does.
    $ScriptBlock = {
        param($AppName)
        if($AppName -ne $null){
            soamview app $AppName -p | Set-Content -Force -Path M:\$AppName.xml -Verbose -Encoding ASCII
            if($?){
                    soamreg M:\$AppName.xml -f >> M:\RegApp.log
                    Start-Sleep -Seconds 120
            }else {
                Write-Host "$AppName profile not saved. " >> M:\RegApp.log
            }
         }else {
            Write-Host "$AppName has something wrong. " >> M:\RegApp.log
        }

    }

    #start jobs at background in parallel.
    Start-Job $ScriptBlock -ArgumentList $_ 

}