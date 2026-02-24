#!/bin/bash

free_space=$(df / | awk 'NR==2 {print $4}')

[ "$free_space" -lt 100000 ] && echo "Disk to'la!" || echo "OK"