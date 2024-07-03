#!/bin/bash

node=$1
dest=$2
subject="Nginx cluster alert"

content=$(cat <<EOF
<html>
<head>
<style>
    p {
        font-size: 20px;
        font-family: Arial, Helvetica, sans-serif;
        color: black;
    }

    p span {
        font-weight: 800;
        color: red;
    }
</style>
</head>
<body>
    <p>Noeud <span>numéro $node</span> inactif !</p>
</body>
</html>
EOF
)

echo "$content" | sendmail -t -oi <<EOF
Subject: $subject
To: $dest
Content-Type: text/html; charset=UTF-8

$content
EOF
