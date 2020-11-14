$start_time = Get-Date

$scripts_download_folder = "c:\Samples\"
$scripts_folder = "c:\Samples\AdventureWorks"
New-Item -Path $scripts_folder -ItemType Directory

"Downloading archived scripts..."
$url = "https://github.com/microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks-oltp-install-script.zip"
$output = $scripts_download_folder + "\AdventureWorks-oltp-install-script.zip"
$web_client = New-Object System.Net.WebClient
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$web_client.DownloadFile($url, $output)

"Extacting files from archive..."
Expand-Archive -LiteralPath $output -DestinationPath $scripts_folder

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
"Done"