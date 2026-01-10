# COBOL-tutorials
This is just for me and learning COBOL basics without Mainframe.


With GNU COBOL, free-format files must have the extension .cbl (or .cob) and/or use the -free flag.

cobc -x -free -o coboltut coboltut.cob


Run the commands in a terminal outside Visual Studio Code
Can run the commands in the Visual Studio Code Terminal but after changes to the file are made, it needs to compile first

cobc -x -o calc calculator.cbl

then

./calc