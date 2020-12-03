#! /bin/bash

# Hits a URL (first argument) serially for 10 seconds,
# then prints QPS. Not very precise and usually requires
# checking that "curl -s $1 > /dev/null" works as expected
# first (i.e. is not a redirect).
end=$((SECONDS+10))

# One request to warm it up.
curl -s $1 > /dev/null

let count=0;
while [ $SECONDS -lt $end ]; do
    curl -s $1 > /dev/null
    count=$((count+1))
done

echo "QPS: $((count / 10))"
