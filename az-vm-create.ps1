
## How to create function in PowerShell
function create-vm-linux{
    param(
        $rgName="vm2020",
        $VMName="dev2020",
        $secret
    )
    az group create --location westus --name $rgName
    az vm create --resource-group $rgName --name $VMName --image Debian --admin-username sysadmin --admin-password $secret
}

## How to run ? 
$credential = Get-Credential -UserName sysadmin -Message "angiv passord for azure vm"
$x =  $credential.GetNetworkCredential()
create-vm-linux  -secret $x.password