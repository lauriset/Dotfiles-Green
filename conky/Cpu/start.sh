#!/bin/bash

killall conky
sleep 2s
		
conky -c $HOME/.conky/Cpu/conkyrc &> /dev/null &
conky -c $HOME/.conky/Cpu/conky_cpu &> /dev/null &
