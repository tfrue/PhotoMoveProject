$files = Get-ChildItem -File 'C:\Source\Pictures' -Recurse #Enter Source folder

ForEach ($file in $files) {

    $fileName = $file.Name

    $date = $file.LastWriteTime

    $year = $date.ToString('yyyy')
    $month = $date.ToString('MM')
    $day = $date.ToString('dd')

    $dirpath = "C:\Destination\Pictures\$year`\$year`_$month`\$year`_$month`_$day" #Enter Destination folder. Sets up the destination folder to appear as, e.g. C:\destination\2019\2019_10\2019_10_28
    
    if (!(Test-Path $dirpath)) {

        New-Item -ItemType Directory -Force -Path $dirpath -Verbose
    }

    Start-Sleep -Milliseconds 250

    Move-Item -Path "$($file.FullName)" -Destination "$dirpath`\$fileName" -Verbose
}
