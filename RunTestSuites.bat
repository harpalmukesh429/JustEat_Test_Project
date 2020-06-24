Set ProjectPath=%cd%
Set TestSuitePath=%ProjectPath%\TestScripts\
set Timestamp=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set set "Timestamp=%CurrentTime: =%"
set "ResultFolderName=Result_%Timestamp%"
set "ResultFolderName=%ResultFolderName: =%"
Set ResultFolderPath=%ProjectPath%\Results\%ResultFolderName%\

cd %TestSuitePath%

robot -v gv_URL:http://www.just-eat.co.uk/ -v gv_Browser_Name:chrome --include Smoke --outputdir %ResultFolderPath% --timestampoutputs Search_TestScripts.robot