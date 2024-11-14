for NAME in $(pip freeze | cut -d= -f1);
    do REQ=$(pip show $NAME| grep Required-by);
        if [[ "$REQ" =~ "$REQUIRES" ]]; then
            echo $REQ;
            echo "Package: $NAME";
            echo "---" ;    
        fi;
    done > requirements.txt

