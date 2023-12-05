$inputAddress = Read-Host "Provide Network address"
$AddressFormat = $inputAddress.Split(".") 

$1stOct = $AddressFormat[0]
$2ndOct = $AddressFormat[1]
$3rdOct = $AddressFormat[2]

$4thOct = $AddressFormat[3].Split("/")[0]
$subnetMask = $AddressFormat[3].Split("/")[1]

$AddressSize = 32

$numberOfHosts = [Math]::Pow(2,($AddressSize - $subnetMask))
$numberOfUsableHosts = $numberOfHosts - 2

Write-Host "The numer of hosts: $numberOfHosts"
Write-Host "The numer of usable hosts available: $numberOfUsableHosts"

$classA = $1stOct -In 1 ...126 
$classB = $1stOct -In 128 ...191
$classC = $1stOct -In 192 ...223

if($classA)
{
   $numberOfSubNets =  [Math]::Pow(2,($subnetMask - 24))
   Write-Host "The numer of subnets: $numberOfSubNets"
}
elseif($classB)
{
   $numberOfSubNets =  [Math]::Pow(2,($subnetMask - 16))
   Write-Host "The numer of subnets: $numberOfSubNets"
}
elseif($classC)
{
   $numberOfSubNets =  [Math]::Pow(2,($subnetMask - 8))
   Write-Host "The numer of subnets: $numberOfSubNets"
}
else
{
   Write-Host "The network address provided: $inputAddress should not be used" -BackgroundColor Yellow
}