#!/usr/bin/env bash

# Exit script as soon as a command fails.
set -o errexit

testrpc_port=8111

testrpc_running() {
  nc -z localhost "$testrpc_port"
}

start_testrpc() {
    node_modules/.bin/ganache-cli -i 15 --gasLimit 50000000 --port "$testrpc_port" > /dev/null &
    testrpc_pid=$!
}

if testrpc_running; then
  echo "Using existing testrpc instance at port $testrpc_port"
else
  echo "Starting our own testrpc instance at port $testrpc_port"
  start_testrpc
fi
