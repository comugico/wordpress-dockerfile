#!/bin/bash
pushd $(dirname $0)

docker build --tag="comugico/wordpress" .

popd
