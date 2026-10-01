for n in 10 20 40 80 160 320 640 1280; do
for p in 1.4 2 4; do
for s in `(seq 1 100)`; do

echo "./main $n $p $s knapsack > out-$n-$p-$s-k.txt"

done
done
done


# for n in 16 25 49 81 169 324 625 1156; do
for n in 49 100 196 400 784 1600 3136 6400; do
for p in 1.4 2 4; do
for s in `(seq 1 100)`; do

echo "./main $n $p $s assignment > out-$n-$p-$s-a.txt"

done
done
done
