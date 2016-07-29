var net = require('net');
var Promise = require('bluebird');
var config = require('../config');
var open = require('opener');

var port = process.env.PORT || config.dev.port;

function checkConnection(host, port, timeout) {
    return new Promise(function (resolve, reject) {
        timeout = timeout || 10000;     // default of 10 seconds
        var timer = setTimeout(function () {
            reject("timeout");
            socket.end();
        }, timeout);
        var socket = net.createConnection(port, host, function () {
            clearTimeout(timer);
            resolve();
            socket.end();
        });
        socket.on('error', function (err) {
            clearTimeout(timer);
            reject(err);
        });
    });
}

checkConnection("localhost", port, 1000).then(function () {
    var p = open("http://localhost:" + port, function () {
        console.log("Server already running. Opening browser...");
    });

}, function (err) {
    // if port isn't open, run the dev-server that opens it
    var server = require('./dev-server');
    open("http://localhost:" + port);
});