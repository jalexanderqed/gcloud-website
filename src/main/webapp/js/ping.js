function getPingElement() {
    return document.getElementById("current-ping");
}

function getErrorElement() {
    return document.getElementById("ping-error");
}

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
    getPingElement().innerHTML = pingTime.toFixed(2);
    getErrorElement().innerHTML = "&nbsp;";
}

function recordError(error) {
    getErrorElement().innerHTML = "Request error";
}

let intervalID = setInterval(performPingTest, 1000);
performPingTest();