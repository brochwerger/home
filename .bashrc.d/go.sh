#export GOROOT=/opt/go
export GOPATH=$HOME/workspace/go
export PATH=$GOPATH/bin:$PATH

project () {
 echo ${PWD#${GOPATH}/src/}
}


