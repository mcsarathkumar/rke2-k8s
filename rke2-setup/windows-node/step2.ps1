Invoke-WebRequest -Uri https://raw.githubusercontent.com/rancher/rke2/master/install.ps1 -Outfile install.ps1
New-Item -Type Directory c:/etc/rancher/rke2 -Force
Write-Host "Edit Config.yaml and start executing step3.ps1"