$fileToConvert = "wiki.xml"
$image = "wiki2md"

# Build and run Docker container to gather requirements to be copied into $stagingDirectory
docker build -t $image .

$dockerRunCmd = "php convert.php --filename="+$fileToConvert+" --output=./output"
docker run -v ${PSScriptRoot}/output/:/src/output $image sh -c $dockerRunCmd