function Create-Configuration{
    [cmdletbinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$Name,
        [Parameter()]
        [string]$version = "1.0.0",
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter()]
        [ValidateSet("Windows","Linux")]
        [string]$OperatingSystem = "Windows"
    )

    begin{
        Write-Verbose "Begin block"
        $CounterPassed = 0
        $CounterFailed = 0
    }

    process{
        try{

        Write-Verbose "Creating configuration for $Name with version $version"
        New-Item -Path $Path -Name "$Name" -ItemType "file"
        $version | Out-File -FilePath "$Path\$Name" -Force
        $OperatingSystem | Out-File -FilePath "$Path\$Name" -Append -Force
        $CounterPassed++
        }
        catch{
            Write-Output $_.Exception.Message
            $CounterFailed++
        }
        Write-debug "Configuration created: $counterPassed,Configurations failed: $CounterFailed" 

    }
    end{
        Write-Verbose "End block"
        Write-Output "Configurations created: $CounterPassed,Configurations failed: $CounterFailed"
    }
}


$ConfigPath = "C:\Scripts\Methods"

Create-Configuration -Name "TestConfig0" -version "1.0.1" -OperatingSystem "Linux" -Path $ConfigPath

$Names = @("TestConfig1", "TestConfig2", "TestConfig3", "TestConfig4")

$Names | Create-Configuration -Path $ConfigPath -Verbose -debug

Create-ConfigFile -Name "TestConfig0" -version "1.0.1" -Path $ConfigPath





