#!/usr/bin/env bash

[ -e app/auth.json ] && echo "auth.json already exists. Skipping." && exit 0;

if [ ! -z "$GITHUB_TOKEN" ]
then
    cp app/auth.dist.json app/auth.json
    sed -i '' -e "s/%token%/$GITHUB_TOKEN/" app/auth.json
    echo "Created the auth.json file"
    exit 0
fi

echo "You need to set '\$GITHUB_TOKEN' environment variable!";

exit 1;
