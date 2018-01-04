 wget -O index.html youtube.com

egrep -o 'user\/([a-zA-Z0-9]*)' index.html | while read u; do  
    echo ${u:5}
done > users.txt


egrep -o '([0-9],*)+\sv' index.html |  while read v; do
    v=${v::-1}
    echo ${v//,/}
done > views.txt


egrep -o '\">([0-90-9]*:[0-90-9]+)+' index.html |  while read t; do 
    echo ${t:2}
done > time.txt


egrep -o 'ids=\"([[:alnum:]]*)+\"' index.html |  while read i; do
    i=${i//\"/}
    echo ${i:4}
done > id.txt


egrep -o '\s\stitle=\"(.*)\"\saria\-d' index.html | while read l; do 
    l=${l:7}
    echo ${l::-6}
done > title.txt

paste  users.txt views.txt time.txt id.txt title.txt > table.csv
