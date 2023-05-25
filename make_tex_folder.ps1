#入力要求し、かつ変数fulldateに入力データを代入
$full_date = Read-Host "Input date"  

#inputが6文字でなければ弾く
$input_length = $full_date.Length 
If ($input_length -ne 6){       
echo "invailed input number"
}Else{

$year  = $full_date.Substring(0,2)
$month = $full_date.Substring(2,2)
$date  = $full_date.Substring(4,2)

#folder名は数字連続が見づらいので分割
$foldername = $year+"_"+$month+"_"+$date 

echo $foldername

New-Item C:\Users\yoshi\meeting\$foldername -ItemType Directory 

#テンプレファイルをコピーして、入力した日付をファイル名に変更
Copy-Item C:\Users\yoshi\meeting\tempre\tempre.tex C:\Users\yoshi\meeting\$foldername\mt$full_date.tex
Copy-Item C:\Users\yoshi\meeting\tempre\reference.bib C:\Users\yoshi\meeting\$foldername

#作業フォルダをVSCodeで自動的に開く
cd "C:\Users\yoshi\AppData\Local\Programs\Microsoft VS Code"
.\Code.exe C:\Users\yoshi\meeting\$foldername

cd ~\
}