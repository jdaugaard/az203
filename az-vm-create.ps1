
## How to create function in PowerShell
function create-vm-linux{
    param(
        $rgName="jdaz203",
        $VMName="jdaz203vm",
        $secret
    )
    az group create --location westeurope --name $rgName
    az vm create --resource-group $rgName --name $VMName --image Debian --admin-username sysadmin --admin-password $secret -tags "env[=tst]"
}

## How to run ? 
$credential = Get-Credential -UserName sysadmin -Message "angiv passord for azure vm"
$x =  $credential.GetNetworkCredential()
create-vm-linux  -secret $x.password
