#! /bin/bash
end=$((SECONDS+10))

let count=0;
while [ $SECONDS -lt $end ]; do
    curl -s $1 > /dev/null
    count=$((count+1))
done

echo "QPS: $((count / 10))"
