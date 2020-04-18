[CmdletBinding()]
Param(
    [string]$convertFileArgFullPath = "wiki.xml"
)

function RefreshDirectory([string] $pathToDirectory)
{
    if (!(Test-Path $pathToDirectory -PathType Container))
    {
        Write-Host -Message "Creating $pathToDirectory."
        New-Item -Path $pathToDirectory -Type directory | out-null
    }
    else
    {
        Write-Host -Message "Deleting and recreating $pathToDirectory."
        Remove-Item $pathToDirectory -Recurse -Force
        New-Item -Path $pathToDirectory -Type directory | out-null
    }
}

if(!$PSScriptRoot){
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

$inputFolder = Join-Path $PSScriptRoot "input"
$outputFolder = Join-Path $PSScriptRoot "output"

RefreshDirectory $inputFolder
Copy-Item $convertFileArgFullPath $inputFolder

$fileToConvertFileName = Split-Path $convertFileArgFullPath -Leaf
$fileToConvertPathForDockerImage = "./input/"+$fileToConvertFileName

$image = "wiki2md"

docker build -t $image .

RefreshDirectory $outputFolder
$dockerRunCmd = "php convert.php --filename="+$fileToConvertPathForDockerImage+" --output=./output"
docker run -v ${PSScriptRoot}/output/:/src/output $image sh -c $dockerRunCmd