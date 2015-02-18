These labs have been built using Intel compiler (icc), gcc or Oracle Sun 
Studio compiler cc.

gcc is in the PATH by default. icc (and Sun studio) can be used by including 
the following in .bashrc and log on again.

source  /opt/intel/bin/compilervars.sh intel64
source /opt/intel/vtune_amplifier_xe_2011/amplxe-vars.sh
source /opt/intel/inspector_xe_2011/inspxe-vars.sh
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PATH=/opt/solstudio12.2/bin:$PATH

To compile any openmp viersion you should add the -openmp compiler flag with 
icc,  -fopenmp with gcc and -xopenmp with cc.

To compile the serial program, type

make

The Makefile is configured to use the Intel compiler. Change it if you 
want to experiment with other compilers.


