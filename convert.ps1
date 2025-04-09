#!/usr/bin/powershell
# Чтение содержимого файла
$text = [System.IO.File]::ReadAllText("$PWD/index.html")

# Замена ссылок в цикле от 1 до 10
for ($i = 1; $i -le 10; $i++) {
    Write-Host "Try replace $i"
    $oldLink = "<a href=`"https://./tolldoc$i.pdf`">"
    $newLink = "<a href=`"./tolldoc$i.pdf`" download>"
    $newtext = $text.Replace($oldLink, $newLink)
    if ($text -ceq $newtext) {
        Write-Host "Not found!"
    } else {
        Write-Host "Found!"
    }
    $text = $newtext
}

# Запись измененного содержимого обратно в файл
[System.IO.File]::WriteAllText("$PWD/index.html", $text)

Write-Host "DONE!"