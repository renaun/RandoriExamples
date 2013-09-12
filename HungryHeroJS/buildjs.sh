## PATH VALUES EXPECT "common" folder to be at same folder depth 
## as your game

# Path to Randori Repos
currentdir=`pwd`
repos=$currentdir/../common
# Randori Compiler Path
rc=$repos/randori-compiler-latest
# sdk-path
rsdk=$repos/randori-sdk/
# Kontiki Source
kontikisource=$repos/KontikiJS/src
# Starling-Framework Source
starlingroot=$repos/Starling-Framework/starling/src

# Source File Base Path
source=./
# Output folder
output=../js-randori


# Change into the source folder because of bug
cd src/

# Run Randoir Compiler:
#echo java -jar $rc/randori.jar randori.compiler.clients.Randori -sdk-path=$rsdk -source-path $kontikisource -source-path $starlingroot -source-path $source -js-classes-as-files=true -output $output

java -jar $rc/randori.jar randori.compiler.clients.Randori -sdk-path=$rsdk -source-path $kontikisource -source-path $starlingroot -source-path $source -js-classes-as-files=true -output $output
