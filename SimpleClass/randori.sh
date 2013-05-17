## INSTRUCTIONS TO RUN
# run ./randori.sh

## PATH VALUES CHANGE FOR YOUR MACHINE
# Path to Randori Repos
repos=/Code/WebRelated/RandoriRepos
# Randori Compiler Path
rc=$repos/randori-compiler-0.2.4
# Randori SDK
rswc=$repos/randori-sdk/randori-framework/bin/swc
# Source File Base Path
source=./
# Output folder
output=./randori-output

# Run Randoir Compiler:
java -jar $rc/randori.jar randori.compiler.clients.Randori -library-path $rswc/builtin.swc -source-path $source -js-classes-as-files=true -output $output
