#!/bin/bash

function operacio1() {
  read -p "Introdueix el nom d'un usuari: " nom

  vegades=$(grep -c "^$nom " usuarios.txt)
  if [ $vegades -eq 0 ]; then
    echo "No s'ha loguejat"
  else
    echo "$nom s'ha connectat $vegades vegades"
  fi
}

function operacio2() {
  read -p "Introdueix el nom d'un mes: " mes

  dies=$(grep $mes usuarios.txt | awk '{print $2}')
  if [ -z "$dies" ]; then
    echo 0
  else
    echo "S'ha connectat el $dies de $mes"
  fi
}

function operacio3() {
  read -p "Introdueix el dia: " dia
  read -p "Introdueix el mes: " mes
  
  usuaris=$(grep "$dia $mes" usuarios.txt | awk '{print $1}')
  if [ -z "$usuaris" ]; then
    echo "No hi ha connexions en aquesta data"
  else
    echo "Els usuaris que es van connectar en aquesta data són: $usuaris"
  fi
}

function operacio4() {
  read -p "Introdueix el nom d'un usuari: " usuari
  data=$(grep "^$usuari " usuarios.txt | awk '{print $2 " " $3}' | tail -n 1)
  if [ -z "$data" ]; then
    echo "Aquest usuari no ha fet cap connexió"
  else
    echo "L'última connexió de $usuari va ser el $data"
  fi
}

while true; do
echo "Operacions disponibles:"
echo "1. Mostrar el nombre de vegades que s'ha loguejat un usuari"
echo "2. Mostrar una llista dels dies que s'ha connectat un mes"
echo "3. Mostrar un llistat amb els noms d'usuaris que es van loguejar en una data"
echo "4. Mostrar la data de l'última vegada que s'ha loguejat un usuari"
echo "5. Eixir"
read -p "Introdueix una opció: " opcio

case $opcio in
1) operacio1;;
2) operacio2;;
3) operacio3;;
4) operacio4;;
5) exit 0;;
*) echo "Opció no vàlida";;
esac
done

