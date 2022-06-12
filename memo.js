// jQuery
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "https://requestloggerbin.herokuapp.com/bin/075762eb-fdd1-4041-924a-3bfa17e63b43?foo=bar&foo=baz",
  "method": "POST",
  "headers": {
    "cookie": "foo=bar; bar=baz"
  },
  "data": {
    "foo": "bar",
    "bar": "baz"
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});

// fetch
fetch("https://requestloggerbin.herokuapp.com/bin/075762eb-fdd1-4041-924a-3bfa17e63b43?foo=bar&foo=baz", {
  "method": "POST",
  "headers": {
    "cookie": "foo=bar; bar=baz"
  },
  "body": {
    "foo": "bar",
    "bar": "baz"
  }
})
.then(response => {
  console.log(response);
})
.catch(err => {
  console.log(err);
});

// XMLHttpREquest
var data = "foo=bar&bar=baz";

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function () {
  if (this.readyState === this.DONE) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "https://requestloggerbin.herokuapp.com/bin/075762eb-fdd1-4041-924a-3bfa17e63b43?foo=bar&foo=baz");
xhr.setRequestHeader("cookie", "foo=bar; bar=baz");

xhr.send(data);

// HTTP
var qs = require("querystring");
var http = require("https");

var options = {
  "method": "POST",
  "hostname": "requestloggerbin.herokuapp.com",
  "port": null,
  "path": "/bin/075762eb-fdd1-4041-924a-3bfa17e63b43?foo=bar&foo=baz",
  "headers": {
    "cookie": "foo=bar; bar=baz"
  }
};

var req = http.request(options, function (res) {
  var chunks = [];

  res.on("data", function (chunk) {
    chunks.push(chunk);
  });

  res.on("end", function () {
    var body = Buffer.concat(chunks);
    console.log(body.toString());
  });
});

req.write(qs.stringify({foo: 'bar', bar: 'baz'}));
req.end();

// Request
var request = require("request");

var jar = request.jar();
jar.setCookie(request.cookie("foo=bar"), "https://requestloggerbin.herokuapp.com/bin/075762eb-fdd1-4041-924a-3bfa17e63b43");
jar.setCookie(request.cookie("bar=baz"), "https://requestloggerbin.herokuapp.com/bin/075762eb-fdd1-4041-924a-3bfa17e63b43");

var options = {
  method: 'POST',
  url: 'https://requestloggerbin.herokuapp.com/bin/075762eb-fdd1-4041-924a-3bfa17e63b43',
  qs: {foo: ['bar', 'baz']},
  headers: {
    accept: 'application/json',
    'content-type': 'application/x-www-form-urlencoded'
  },
  form: {foo: 'bar', bar: 'baz'},
  jar: 'JAR'
};

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
