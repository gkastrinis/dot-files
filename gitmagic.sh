#!/bin/sh
# by Mary McGrath

branch=$1
shift

src="$HOME/Work/raicodes"
dir="$src/$branch"
depot="$src/.raicode-depots/$branch"

mkdir -p $dir
mkdir -p $depot

#here=$PWD

# set up the code directory
echo "Setting up code directory"
cd $src
git clone git@github.com:RelationalAI/raicode.git $branch
#cp -r ../prototype $branch
cd $branch
git fetch origin
#git pull --rebase
git checkout --track origin/$branch || git checkout -b $branch
pre-commit install

# Set up a separate depot for this branch.
echo "Copying startup.jl script into depot"
mkdir -p $depot/config
ln -s $HOME/.julia/config/startup.jl $depot/config/startup.jl

# use shadowenv https://shopify.github.io/shadowenv/getting-started/) to manage environment variables per-directory
# make sure .shadowenv.d is in your global gitignore
echo "Setting up environment variables"
env=.shadowenv.d
mkdir -p $env
echo "(env/set \"RAI_PATH\" \"$dir\")" > $env/env.lisp
echo "(env/set \"JULIA_PROJECT\" \"$dir\")" >> $env/env.lisp
echo "(env/set \"JULIA_DEPOT_PATH\" \"$depot:\")" >> $env/env.lisp
echo "(env/set \"JULIA_LOAD_PATH\" \"$depot:$HOME/.julia:\")" >> $env/env.lisp
shadowenv trust

# go back to where we started
#cd $here
