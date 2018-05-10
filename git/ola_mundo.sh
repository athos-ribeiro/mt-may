#!/bin/bash

meu_dir=ola_mundo_em_python
ola=ola_mundo.py
interpretador=/usr/bin/python3
ola_log=ola.log

if [ ! -f $interpretador ]; then
  echo '[ERROR] Instale o python 3'
  echo "  \$ sudo dnf install python3"
  exit 1
fi

printf "[INFO] Este é meu diretório de trabalho: %s \n" $meu_dir

if [ ! -d $meu_dir ]; then
  mkdir -p $meu_dir
fi

pushd $meu_dir
cat > $ola << EOF
#!/usr/bin/python3
print('olá mundo', end='')
EOF
chmod a+x $ola

echo '[INFO] Rodando olá mundo em python...'
./$ola > $ola_log
echo '[INFO] Imprimindo a quantidade de caracteres do log...'
echo -e '\e[32m====================================='
echo O arquivo $ola_log possui `wc -m $ola_log | cut -d ' ' -f1` caracteres
echo -e '=====================================\e[39m'
echo '[INFO] Fim do programa.'
popd
