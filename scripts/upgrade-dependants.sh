#!/usr/bin/env bash
# set -o pipefail
set -o errexit
set -o nounset
# set -o xtrace

# Set magic variables for current FILE & DIR
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# __file="${__dir}/$(basename "${0}")"
# __base="$(basename ${__file})"
# __root="$(cd "$(dirname "${__dir}")" && pwd)"

version=$(node -e 'console.log(require("./package.json").version)')

for dir in ~/code/content ~/code/kvz.io ~/code/legal ~/code/lanyon/example ~/code/lanyon/website ~/code/transloadify ~/code/tus.io ~/code/frey-website ~/code/bash3boilerplate; do
  pushd ${dir}
    npm unlink lanyon || true
    gsed -i .travis.yml -e 's/lanyon postinstall/lanyon install/g' || true
    gsed -i package.json -e 's/lanyon postinstall/lanyon install/g' || true
    gsed -i website/package.json -e 's/lanyon postinstall/lanyon install/g' || true
    gsed -i _scripts/postinstall.sh -e 's/lanyon postinstall/lanyon install/g' || true
    yarn add lanyon@${version}
    env LANYON_RESET=1 node "${__dir}/../lib/cli.js" install
    git add package.json yarn.lock _scripts/postinstall.sh website/package.json .travis.yml || true
    git commit -m "Upgrade Lanyon to v${version}" || true
    git pull && git push
  popd
done
