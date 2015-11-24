Function Start-Sizing {
    Clear-Host

    Write-Host ' __     __ _        _                  _  _             _    _               ' -ForegroundColor Green -BackgroundColor Black
    Write-Host ' \ \   / /(_) _ __ | |_  _   _   __ _ | |(_) ____ __ _ | |_ (_)  ___   _ __  ' -ForegroundColor Green -BackgroundColor Black
    Write-Host '  \ \ / / | ||  __|| __|| | | | / _  || || ||_  // _  || __|| | / _ \ |  _ \ ' -ForegroundColor Green -BackgroundColor Black
    Write-Host '   \ V /  | || |   | |_ | |_| || (_| || || | / /| (_| || |_ | || (_) || | | |' -ForegroundColor Green -BackgroundColor Black
    Write-Host '    \_/   |_||_|    \__| \__,_| \__,_||_||_|/___|\__,_| \__||_| \___/ |_| |_|' -ForegroundColor Green -BackgroundColor Black
    Write-Host '                                                                             ' -ForegroundColor Green -BackgroundColor Black
    Write-Host '  ____   _       _                 _____              _ ' -ForegroundColor Green -BackgroundColor Black
    Write-Host ' / ___| (_) ____(_) _ __    __ _  |_   _|___    ___  | |' -ForegroundColor Green -BackgroundColor Black
    Write-Host ' \___ \ | ||_  /| ||  _ \  / _  |   | | / _ \  / _ \ | |' -ForegroundColor Green -BackgroundColor Black
    Write-Host '  ___) || | / / | || | | || (_| |   | || (_) || (_) || |' -ForegroundColor Green -BackgroundColor Black
    Write-Host ' |____/ |_|/___||_||_| |_| \__, |   |_| \___/  \___/ |_|' -ForegroundColor Green -BackgroundColor Black
    Write-Host '                           |___/                        ' -ForegroundColor Green -BackgroundColor Black
    Write-Host "Greetings, I am omarcandroid's virtualization sizing tool." -ForegroundColor White -BackgroundColor Black
    Write-Host 'Never tell me the odds.' -ForegroundColor White -BackgroundColor Black
    Write-Host 'My purpose in this universe is to help with the deployment of your virtualization environment.' -ForegroundColor White -BackgroundColor Black
    Write-Host 'Our objective will be to create and plan out an environment suitable for your business needs' -ForegroundColor White -BackgroundColor Black
    Write-Host 'while also ensuring it aligns with the best practices of the technology and hardware we decide to use.' -ForegroundColor White -BackgroundColor Black
        Write-Host 'First, is this going to be a NEW environment or are we loading an EXISTING environment?' -ForegroundColor Green -BackgroundColor Black
        Write-Host '(1) NEW environment' -ForegroundColor Yellow -BackgroundColor Black
        Write-Host '(2) EXISTING environment' -ForegroundColor Yellow -BackgroundColor Black
        $neworexisting = Read-Host
            If($neworexisting -eq '1') {Start-NewBuild}
            ElseIf($neworexisting -eq '2'){Start-LoadBuild}
}

Function Start-NewBuild {
    Write-Host 'Please name the new build or you will be redirected to the main menu.' -ForegroundColor White -BackgroundColor Black
    #$BuildNameQC - Variable which determines if the user can proceed.
    $BuildNameQC = 0
    $NewBuildName = Read-Host

    #Ensuring the user has provided a name
    If ($NewBuildName -eq '') {
    Clear-Host
    Start-Sizing
    }
    Elseif ($NewBuildName -ne '') {
    $BuildNameQC++
    }

    #Double-checking if the user has provided a Name
    If ($BuildNameQC -eq '1') {
    Write-Host "New Build: $NewBuildName" -ForegroundColor White -BackgroundColor Black
    }
    Else {
    Start-NewBuild
    }

    #Confirming the user wants to proceed with the name provided
    Write-Host "Are you sure you want to use this name?" -ForegroundColor White -BackgroundColor Black    
    Write-Host 'Yes or No' -ForegroundColor White -BackgroundColor Black
    $yesorno = Read-Host
    If ($yesorno -eq 'Yes') {
    Write-Host '(1) Microsoft Hyper-V' -ForegroundColor Green -BackgroundColor Black
    Write-Host '(2) VMWare ESXi' -ForegroundColor Green -BackgroundColor Black
    Write-Host '(3) Go Back' -ForegroundColor Green -BackgroundColor Black
        $pickyourpoison = Read-Host
            If($pickyourpoison -eq '1') {Start-NewHyperVBuildVMCount}
            If($pickyourpoison -eq '2') {Start-NewVMWareESXBuild}
            If($pickyourpoison -eq '3') {Start-Sizing}
    }
    Elseif ($yesorno -eq 'No') {
    Start-NewBuild
    }
}

Function Start-NewHyperVBuildVMCount {
    Write-Host 'How many Virtual Devices?' -ForegroundColor Green -BackgroundColor Black
        #We will now begin a series of questions over the Virtual Machines to be configured:
        #How many Virtual Device(s)?
        #What will be the Name of the Virtual Device(s)?
        #How many vCPUs to assign the Virtual Device(s)?
        #How much RAM to assign the Virtual Device(s)?
        #How many disks will the Virtual Device(s) have including the system disk?
            #Optional if there are additional disks - Name of the additional disks?
        #How much space in GB should the drive(s) be?
        #Are any of the VM(s) sharing disks?
        #Which VMs are sharing disks and which disk will they be sharing?
}
Start-Sizing