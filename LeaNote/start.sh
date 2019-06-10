#!/bin/sh
confPath="$GOPATH/src/github.com/leanote/leanote/conf/app.conf"
sed -i "s/V85ZzBeTnzpsHyjQX4zukbQ8qqtju9y2aDM55VWxAH9Qop19poekx3xkcDVvrD0y/"$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64)"/" $confPath
sed -i "s/"$(cat $confPath | grep "^db\\.host=.*\$")"/db.host="$DB_HOST"/" $confPath
revel run github.com/leanote/leanote -m prod
