#!/bin/bash

DIRNAME=${1:-.}
cd "$DIRNAME" || exit

FILES=$(mktemp)
PACKAGES=$(mktemp)

# use fd
# https://github.com/sharkdp/fd
# sudo dnf install fd-find

function check {
	cat package.json \
		| jq "{} + .$1 | keys" \
		| sed -n 's/.*"\(.*\)".*/\1/p' > "$PACKAGES"
	echo "--------------------------"
	echo "Checking $1..."
	fd '(js|ts|json)$' -t f > "$FILES"
	while read -r PACKAGE; do
		if [ -d "node_modules/${PACKAGE}" ]; then
			fd -t f '(js|ts|json)$' "node_modules/${PACKAGE}" >> "$FILES"
		fi
		RES=$(cat "$FILES" | xargs -P 32 -I {} egrep -i "(import|require|loader|plugins|${PACKAGE}).*['\"](${PACKAGE}|.?\d+)[\"']" '{}' | wc -l)

		if [ "$RES" = 0 ]; then
			echo -e "UNUSED\t\t $PACKAGE"
		else
			echo -e "USED ($RES)\t $PACKAGE"
		fi
	done < "$PACKAGES"
}

check "dependencies"
check "devDependencies"
check "peerDependencies"
