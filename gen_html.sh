#!/bin/bash

function clean_old_index {
    rm -f index.html
}

function gen_list {
    arr=( $(find ./apks/*  -printf "%f\n") )
    for (( i=0; i<${#arr[@]}; i++ )); do
        printf "<li><a href=\"apks/${arr[i]}\">${arr[i]}</a></li>\n"
    done
}

function gen_html1 {
    cat <<EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Directory listing for /</title>
</head>
<body>
<h1>Directory listing for /</h1>
<hr>
<ul>
EOF
}

function gen_html2 {
    cat <<EOF
</ul>
<hr>
</body>
</html>
EOF
}

#clean_old_index
gen_html1 > index.html
gen_list >> index.html
gen_html2 >> index.html

