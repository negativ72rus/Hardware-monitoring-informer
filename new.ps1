$GPUTemps = Get-WmiObject -namespace root\openhardwaremonitor -class sensor | Where-Object {$_.SensorType -Match "temp" -and $_.Identifier -like "*GPU*"}
$CPUTemps = Get-WmiObject -namespace root\openhardwaremonitor -class sensor | Where-Object {$_.SensorType -Match "temp" -and $_.Identifier -like "*CPU*"}
$GPUNumber = 0
$GPUTempString = "GPU Temp: "
$CPUNumber = 0
$CPUTempString = "CPU Temp: "
ForEach($GPU In $GPUTemps)  {
 $GPUNumber++
 $GPUTempValue = $GPU.value
 $GPUTempString = $GPUTempString + $GPU.value + ";"
        #Write-Host "[" $GPUNumber "]" $GPUTempValue    
}
ForEach($CPU In $CPUTemps)  {
 $CPUNumber++
 $CPUTempValue = $CPU.value
 $CPUTempString = $CPUTempString + $CPU.value + ";"
        #Write-Host "[" $GPUNumber "]" $GPUTempValue    
}
Write-Host $GPUTempString
Write-Host $CPUTempString
Out-File -filepath c:\Telegram\test.txt -inputobject $GPUTempString -Encoding utf8
Out-File -filepath c:\Telegram\CPU.txt -inputobject $CPUTempString -Encoding utf8