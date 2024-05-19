preset=$1
file ${PWD}/target/${preset}/main | tee ${PWD}/target/${preset}/main.file
objdump -D ${PWD}/target/${preset}/main | tee ${PWD}/target/${preset}/main.dump

ldd ${PWD}/target/${preset}/main | tee ${PWD}/target/${preset}/main.ldd
readelf -a  ${PWD}/target/${preset}/main | tee ${PWD}/target/${preset}/main.elf

