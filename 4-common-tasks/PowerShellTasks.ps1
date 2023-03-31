$RGName = "W10-MS"
$HostPoolName = "W10-MS"

# Get a session host and enable drain mode
$sessionHosts = Get-AzWvdSessionHost -ResourceGroupName $RGName `
  -HostPoolName $HostPoolName

Update-AzWvdSessionHost -ResourceGroupName $RGName `
  -HostPoolName $HostPoolName `
  -SessionHostName $sessionHosts[0].Name.split("/")[1] `
  -AllowNewSession:$false

$userSessions = Get-AzWvdUserSession -ResourceGroupName $RGName `
  -HostPoolName $HostPoolName `
  -SessionHostName $sessionHosts[0].Name.split("/")[1]

# Send a message that the session host is going into maintenance mode
Send-AzWvdUserSessionMessage -ResourceGroupName $RGName `
  -HostPoolName $HostPoolName `
  -SessionHostName $sessionHosts[0].Name.split("/")[1] `
  -UserSessionId $userSessions[0].Id.split("/")[-1] `
  -MessageTitle "Maintenance" `
  -MessageBody "This session host is going into maintenance mode. Please save your work and log off."

  # You can disconnect their session with
  Disconnect-AzWvdUserSession -ResourceGroupName $RGName `
    -HostPoolName $HostPoolName `
    -SessionHostName $sessionHosts[0].Name.split("/")[1] `
    -UserSessionId $userSessions[0].Id.split("/")[-1]

# Or force logoff with
Remove-AzWvdUserSession -ResourceGroupName $RGName `
  -HostPoolName $HostPoolName `
  -SessionHostName $sessionHosts[0].Name.split("/")[1] `
  -UserSessionId $userSessions[0].Id.split("/")[-1]

  Update-AzWvdSessionHost -ResourceGroupName $RGName `
  -HostPoolName $HostPoolName `
  -SessionHostName $sessionHosts[0].Name.split("/")[1] `
  -AllowNewSession:$true