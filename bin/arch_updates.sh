
#!/bin/bash
# See nº the arch penging updates
# 07 nov. 2018 - electro7

# Gestor a utilizar
#CMD=pacman
CMD=yay

$CMD -Sy &>/dev/null

SYNC=`${CMD} -Qu`
NUM=`echo $SYNC | grep -o " -> " | wc -l`

echo $NUM
