## INSTRUCTIONS TO RUN
# Open a command prompt and from the RandoriExamples/ActionScriptThreeJS folder run:
# ./randori.sh

## PATH VALUES CHANGE FOR YOUR MACHINE
# Path to Randori Repos
repos=/Code/WebRelated/RandoriRepos
# Randori Compiler Path
rc=$repos/randori-compiler-0.2.4.2
# Randori Libraries SWC
rlswc=$repos/randori-libraries/bin/randori-libraries.swc
# sdk-path
rsdk=$repos/randori-sdk/
# Source File Base Path
source=./
# Output folder
output=../js-randori

# Change into the source folder because of bug
cd src/
# Run Randoir Compiler:
java -jar $rc/randori.jar randori.compiler.clients.Randori -sdk-path=$rsdk -library-path $rlswc -source-path $source -js-classes-as-files=true -output $output