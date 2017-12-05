#!/bin/bash
sed -i '2s/0/1/;tx;2s/1/0/;:x' ./net.sh
