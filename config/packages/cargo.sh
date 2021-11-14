#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s \
    -- -y --no-modify-path
. $HOME/.cargo/env
rustup override set stable
rustup update stable


