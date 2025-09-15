# Configurar Java 17 para este proyecto
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"

Write-Host "Usando Java 17 para compilacion:"
java -version

Write-Host "Compilando microservicios..."

$services = @("notification-service", "member-service", "class-service", "payment-service")
foreach ($service in $services) {
    Write-Host "Compilando $service..."
    Set-Location $service
    ./mvnw.cmd clean package -DskipTests
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
    Set-Location ..
}

Write-Host "Compilacion completada!"