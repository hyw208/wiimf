#!/bin/bash

cmd=$1

if [[ $cmd == 'run' ]]; then
    export FLASK_APP=./app/app.py
    export DATABASE_URL='postgres://localhost:5432/wiimf'
    export DEBUG='True'
    flask run
    
elif [[ $cmd == 'create' ]]; then
    ename=$2
    req=$3

    conda deactivate
    conda create -n $ename -y --file $req
    conda activate $ename

elif [[ $cmd == 'install' ]]; then
    ename=$2
    req=$3

    conda install -n $ename -y --file $req

else
    echo 'nothing'
fi

