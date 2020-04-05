#get a breaddown of error sources in the system eventlog

Param(
[string]$Computername = $env:COMPUTERNAME,
[string]$ReportTitle = "Event Log Report", 
[Parameter(Mandatory, HelpMessage ="Enter the path for the file")]
[string]$path

)
$computername = $env:COMPUTERNAME
$data = Get-Process | where Cpu -GT 100


$footer = "<h5> Report Run $(get-date)</h5>"
$css = "http://jdhitsolutions.com/sample.css"

$data | sort -Property Count, Name -Descending |
select CPU, Name | 
ConvertTo-Html -Title $ReportTitle -PreContent "<h1>$computername</h1>" -PostContent $footer  -CssUri $css |
Out-File $path


