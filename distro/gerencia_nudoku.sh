#!/bin/bash

COMANDO=$1
VERSAO=$2
NUDOKU_DIR=nudoku
TMP_DIR=/tmp
REPO=git@github.com:jubalh/nudoku.git

checar_versao() {
  if [[ $VERSAO ]]; then
    git tag | grep "^$VERSAO$" > /dev/null
    if [ $? -ne 0 ]; then
      echo '[Error] Tag não existe, nudoku não instalado.'
      exit 1
    fi
  else
    VERSAO=`git tag | sort | tail -n1`
  fi
}

construir() {
  autoreconf -i > /dev/null 2>&1
  ./configure > /dev/null 2>&1
  make > /dev/null 2>&1
}

checar_dependencias() {
  sudo dnf install gettext gettext-devel autoconf automake
}

instale() {
  checar_dependencias
  if [ -f /usr/local/bin/nudoku ]; then
    INSTALADA=`nudoku -v | head -n1`
    echo "[INFO] nudoku já instalado: $INSTALADA"
    remova
  fi
  echo "[INFO] instalando nudoku..."
  rm -rf $TMP_DIR/$NUDOKU_DIR
  pushd $TMP_DIR > /dev/null 2>&1
  git clone $REPO > /dev/null 2>&1
  cd $NUDOKU_DIR
  checar_versao
  git checkout $VERSAO > /dev/null 2>&1
  construir

  sudo cp src/nudoku /usr/local/bin/nudoku
  if [ -d man ]; then
    MANUAL=`ls man | grep 'nudoku\.[0-9]'`
    sudo cp man/$MANUAL /usr/local/share/man/man6/nudoku.6
    sudo mandb > /dev/null 2>&1
  fi
  popd > /dev/null 2>&1
  rm -rf $TMP_DIR/$NUDOKU_DIR
  echo "[INFO] feito, nudoku instalado com sucesso"
}

remova() {
  echo "[INFO] removendo nudoku..."
  sudo rm -rf /usr/local/bin/nudoku
  sudo rm -rf /usr/local/share/man/man6/nudoku.6
  sudo mandb > /dev/null 2>&1
  echo "[INFO] feito, nudoku removido"
}

# Validando entrada:
case $COMANDO in
  instalar)
    instale
    ;;
  remover)
    remova
    ;;
  *)
    echo "[ERROR] comando nao suportado"
    ;;
esac

