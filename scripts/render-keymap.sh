#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

KEYMAP_DRAWER_VERSION="0.23.0"
RUNNER=(uvx --python 3.12 --from "keymap-drawer==${KEYMAP_DRAWER_VERSION}" keymap -c keymap_drawer.config.yaml)

mkdir -p keymap-drawer
"${RUNNER[@]}" parse -c 12 -z config/corne.keymap -o keymap-drawer/corne.yaml
"${RUNNER[@]}" draw -z corne keymap-drawer/corne.yaml -o keymap-drawer/corne.svg
