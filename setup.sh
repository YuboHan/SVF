echo "Setting up environment for PTA"

# change following parameters
install_base=/home/y59han
build_directory='Debug-build'

#########PATH FOR LLVM (do not recommand to change it)##############                                                                 
llvm_version=3.8.0

# change this to your home
export LLVM_SRC_ROOT=$install_base/llvm-$llvm_version.src
export LLVM_OBJ_ROOT=$install_base/llvm-$llvm_version.obj
export LLVM_DIR_ROOT=$LLVM_OBJ_ROOT
export PATH=$LLVM_DIR_ROOT/bin:$PATH

export LLVMOPT=opt
export CLANG=clang
export LLVMDIS=llvm-dis
export LLVMLLC=llc

##############astyle code formatting###############
#AstyleDir=$install_base/astyle/build/clang
#export PATH=$AstyleDir/bin:$PATH

##############check what os we have
PLATFORM='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
export PLATFORM='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
export PLATFORM='darwin'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
export PLATFORM='freebsd'
fi

export PTAHOME=`pwd`
export PTABIN=$PTAHOME/$build_directory/bin
export PTALIB=$PTAHOME/$build_directory/lib
#export PTARTLIB=$PTAHOME/lib/RuntimeLib
export PATH=$PTABIN:$PATH

export PTATEST=$PTAHOME/tests
export PTATESTSCRIPTS=$PTATEST/scripts
export RUNSCRIPT=$PTATESTSCRIPTS/run.sh

### for mac 10.10.1###
rm -rf $PTALIB/liblib*
for file in $(find $PTALIB -name "*.dylib")
do
    basefilename=`basename $file`
    newfile=`echo $basefilename | sed s/lib/liblib/`
    ln -s $PTALIB/$basefilename $PTALIB/$newfile
done
