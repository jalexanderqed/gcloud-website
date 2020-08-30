let kBucketPeriod = 6000;
let kPingPeriod = 50;
let kMaxBuckets = 40;

function getRowHeader() {
    return ["periodEnd", "min", "50%", "95%", "99%", "max"];
}

let chart = c3.generate({
    bindto: "#ping-chart",
    data: {
        x: "periodEnd",
        xFormat: "%Y-%m-%dT%H:%M:%S.%LZ",
        rows: [
            getRowHeader()
        ]
    },
    transition: {
        duration: 0,
    },
    axis: {
        x: {
            type: "timeseries",
            tick: {
                format: "%H:%M:%S"
            },
            label: "Time at End of Window"
        },
        y: {
            label: "Ping Time (ms)",
        }
    },
    grid: {
        y: {
            show: true
        }
    },
});

function DataBucket(startDate) {
    this.startDate = startDate;
    this.pings = [];
    this.sorted = false;
}

DataBucket.prototype.totalRequests = function() {
    return this.pings.length;
}

DataBucket.prototype.push = function(ping) {
    this.sorted = false;
    this.pings.push(ping);
}

// Returns a data row consisting of the bucket's start date and
// it's 50th, 95th, 99th, and 100th percentile ping times. Returns
// null if there is no data for this time period.
DataBucket.prototype.getRowData = function() {
    if(this.pings.length == 0) {
        return null;
    }
    if(!this.sorted) {
        this.pings.sort(function(a, b) { return a - b; });
    }
    this.sorted = true;
    return [
        new Date(this.startDate.getTime() + kBucketPeriod).toISOString(),
        this.pings[0],
        this.pings[Math.floor(0.5 * this.pings.length)],
        this.pings[Math.floor(0.95 * this.pings.length)],
        this.pings[Math.floor(0.99 * this.pings.length)],
        this.pings[Math.floor(this.pings.length - 1)],
    ];
}

// Array of Bucket() objects.
let buckets = [];

function updatePingRate() {
    let qps = Math.floor(1000 / kPingPeriod);
    if(buckets.length > 5) {
        qps = buckets[buckets.length - 3].totalRequests() / (kBucketPeriod / 1000);
    }
    document.getElementById("ping-rate").innerHTML =
        "Testing at " + qps.toFixed(1) + " QPS with a " +
        (kBucketPeriod / 1000) + " second window";
}

function updateChart() {
    while(buckets.length > kMaxBuckets) {
        buckets.shift();
    }
    let rows = [getRowHeader()];
    buckets.forEach(function(bucket) {
        let row = bucket.getRowData();
        if(row !== null) {
            rows.push(row);
        }
    });
    chart.load({
        rows: rows
    });
}

// Adds a new element to `buckets` aligned to duration
// kBucketPeriod. `now` must be of type `Date`.
function addNewBucket(now) {
    let alignedMillis = now.getTime() - (now.getTime() % kBucketPeriod);
    buckets.push(new DataBucket(new Date(alignedMillis)));
    setTimeout(updateChart, kBucketPeriod / 2);
}

function recordError(error) {
    console.log(error);
}

function performPing() {
    let now = new Date();
    if (buckets.length == 0 ||
        buckets[buckets.length - 1].startDate.getTime() + kBucketPeriod < now.getTime()) {
        addNewBucket(now);
    }
    let currentBucket = buckets[buckets.length - 1];
    let start_time = performance.now();
    let ping_time = 0.0;
    fetch("/api/ping")
        .then(response => {
            ping_time = performance.now() - start_time;
            return response.json();
        })
        .then(data => currentBucket.push(ping_time))
        .catch(error => recordError(error));
}

let intervalID = setInterval(performPing, kPingPeriod);
let pingRateIntervalID = setInterval(updatePingRate, kPingPeriod);
