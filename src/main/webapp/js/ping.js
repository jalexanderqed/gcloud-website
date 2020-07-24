function performPingTest() {
    let start_time = performance.now();
    let ping_time = 0.0;
    fetch("/api/ping")
        .then(response => {
            ping_time = performance.now() - start_time;
            return response.json();
        })
        .then(data => recordPing(data, ping_time))
        .catch(error => recordError(error));
}

function recordPing(data, pingTime) {
    document.getElementById("current-ping").innerHTML = pingTime.toFixed(2);
}

function recordError(error) {
    console.log(error);
}

let intervalID = setInterval(performPingTest, 1000);
performPingTest();