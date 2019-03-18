
#!/bin/bash
# See nº the arch penging updates
# 07 nov. 2018 - electro7

# Gestor a utilizar
#CMD=pacman
CMD=yay

$CMD -Sy &>/dev/null

SYNC=`${CMD} -Qu 2&> /dev/null`
NUM=`echo $SYNC | grep -o " -> " | wc -l`

if [ $NUM -eq 0 ]; then
	echo ""
else
	echo $NUM
fi
