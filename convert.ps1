[CmdletBinding()]
Param(
    [string]$fileToConvert = "wiki.xml"
)

$image = "wiki2md"

docker build -t $image .

$dockerRunCmd = "php convert.php --filename="+$fileToConvert+" --output=./output"
docker run -v ${PSScriptRoot}/output/:/src/output $image sh -c $dockerRunCmd