FF=$(nm -D --defined-only ./libs/x86_64/libGL.so | grep -i " T " | cut -d " " -f3)

rm fnmap.txt

for sym in $FF; do
    if [[ $sym == gl4es_* ]]; then continue; fi
    
    target=gl4es_$sym
    echo $sym $target >> fnmap.txt

done

$PATCHELF --rename-dynamic-symbols fnmap.txt ./libs/x86_64/libGL.so
