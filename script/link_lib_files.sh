if [ ! -d $SC_EXTENSIONS_PATH ]
then
    mkdir $SC_EXTENSIONS_PATH
fi

if [ ! -d $SC_NRT_EXTENSIONS_PATH ]
then
    mkdir $SC_NRT_EXTENSIONS_PATH
else
    rm -rf $SC_NRT_EXTENSIONS_PATH
    mkdir $SC_NRT_EXTENSIONS_PATH
fi

SC_NRT_LIB_FILES="$SC_NRT_LIB_PATH/*"

for f in $SC_NRT_LIB_FILES
do
    echo "linking $f to $SC_NRT_EXTENSIONS_PATH..."
    ln $f $SC_NRT_EXTENSIONS_PATH
    if [$? -ne 0]
    then
        "ERROR LINKING FILES"
        break
    fi
done

echo "done linking, nrt extensions directory: "

ls $SC_NRT_EXTENSIONS_PATH
