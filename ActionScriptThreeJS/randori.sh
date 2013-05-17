## INSTRUCTIONS TO RUN
# cd into src/
# run ../randori.sh

## PATH VALUES CHANGE FOR YOUR MACHINE
# Path to Randori Repos
repos=/Code/WebRelated/RandoriRepos
# Randori Compiler Path
rc=$repos/randori-compiler-0.2.4.1
# Randori SDK
rswc=$repos/randori-sdk/randori-framework/bin/swc
# Randori Libraries SWC
rlswc=$repos/randori-libraries/bin/randori-libraries.swc
###rlswc=$repos/randori-sdk-master/randori-framework/bin/swc/HTMLCoreLib.swc
# sdk-path
rsdk=$repos/randori-sdk/
# Source File Base Path
source=./
# Output folder
output=../js-randori

# Change into the source folder because of bug
cd src/
# Run Randoir Compiler:
java -jar $rc/randori.jar randori.compiler.clients.Randori -sdk-path=$rsdk -library-path $rswc/builtin.swc -library-path $rswc/randori-guice-framework.swc -library-path $rlswc -source-path $source -js-classes-as-files=true -output $output