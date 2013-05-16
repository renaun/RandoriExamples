## INSTRUCTIONS TO RUN
# cd into src/
# run ../randori.sh

## PATH VALUES CHANGE FOR YOUR MACHINE
# Randori Compiler Path
rc=../../randori-compiler-0.2.4
# Randori SDK
rswc=../../randori-sdk-master/randori-framework/bin/swc
# Randori Libraries SWC
rlswc=../../randori-libraries/bin/randori-libraries.swc
###rlswc=../../randori-sdk-master/randori-framework/bin/swc/HTMLCoreLib.swc
# Source File Base Path
source=./
# Output folder
output=./jsapp

# Run Randoir Compiler:
java -jar $rc/randori.jar randori.compiler.clients.Randori -library-path $rswc/builtin.swc -library-path $rlswc -source-path $source -js-classes-as-files=true -output $output
