#!/bin/sh
read input
curl  $input | grep href | cut -d '"' -f 2
