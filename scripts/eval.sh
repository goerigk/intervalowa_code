#evaluate solution times

for p in 1.4 2 4; do
for n in 10 20 40 80 160 320 640 1280; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f1; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f2; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f3; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f4; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f5; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f6; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done> times-$p-k-95.txt
done


for p in 1.4 2 4; do
for n in 10 20 40 80 160 320 640 1280; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f1; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f2; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f3; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f4; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f5; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f6; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done> times-$p-k-50.txt
done

for p in 1.4 2 4; do
for n in 10 20 40 80 160 320 640 1280; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f1; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f2; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f3; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f4; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f5; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | head -n1 | cut -d';' -f6; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done> times-$p-k-05.txt
done




for p in 1.4 2 4; do
for n in 49 100 196 400 784 1600 3136 6400; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f1; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f2; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f3; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f4; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f5; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f6; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done> times-$p-a-95.txt
done


for p in 1.4 2 4; do
for n in 49 100 196 400 784 1600 3136 6400; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f1; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f2; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f3; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f4; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f5; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f6; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done> times-$p-a-50.txt
done

for p in 1.4 2 4; do
for n in 49 100 196 400 784 1600 3136 6400; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f1; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f2; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f3; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f4; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f5; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | head -n1 | cut -d';' -f6; done | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done> times-$p-a-05.txt
done






###evaluate objective values


for p in 1.4 2 4; do
for n in 10 20 40 80 160 320 640 1280; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f1 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f2 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f3 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f4 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f5 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f6 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done > obj-$p-k-95.txt
done

for p in 1.4 2 4; do
for n in 10 20 40 80 160 320 640 1280; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f1 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f2 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f3 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f4 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f5 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f6 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done > obj-$p-k-50.txt
done

for p in 1.4 2 4; do
for n in 10 20 40 80 160 320 640 1280; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f1 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f2 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f3 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f4 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f5 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-k.txt | grep ";" | tail -n100 | cut -d';' -f6 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done > obj-$p-k-05.txt
done





for p in 1.4 2 4; do
for n in 49 100 196 400 784 1600 3136 6400; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f1 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f2 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f3 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f4 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f5 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f6 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.95 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done > obj-$p-a-95.txt
done

for p in 1.4 2 4; do
for n in 49 100 196 400 784 1600 3136 6400; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f1 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f2 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f3 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f4 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f5 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f6 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.50 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done > obj-$p-a-50.txt
done

for p in 1.4 2 4; do
for n in 49 100 196 400 784 1600 3136 6400; do

t1=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f1 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t2=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f2 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t3=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f3 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t4=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f4 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t5=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f5 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')
t6=$(for s in `(seq 1 100)`; do cat data/out-$n-$p-$s-a.txt | grep ";" | tail -n100 | cut -d';' -f6 | sed 's/\./,/g' | sort -n | sed 's/,/\./g'  | awk '{all[NR] = $0} END{print all[int(NR*0.05 - 0.5)]}'; done | awk -F';' '{ sum += $1; n++ } END { if (n > 0) printf "%.5f", sum / n }')

echo "$n;$p;$t1;$t2;$t3;$t4;$t5;$t6"

done > obj-$p-a-05.txt
done
