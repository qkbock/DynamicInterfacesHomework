var http = require("http");
var fs = require('fs'); 
var path = require('path');
var url = require('url');

var mimeTypes = {
    "html": "text/html",
    "jpeg": "image/jpeg",
    "jpg": "image/jpeg",
    "png": "image/png",
    "js": "text/javascript",
    "css": "text/css"
};

http.createServer(function(req,res) {
	var fileToLoad;

	if(req.url == "/") {
		fileToLoad = "./index.html";
	}
	else {
		fileToLoad = "." + url.parse(req.url).pathname;
	}

	var fileBytes;
	var httpStatusCode = 200;

	// check to make sure a file exists
	fs.exists(fileToLoad,function(doesItExist) {

		// if it does not load error404.html
		if(!doesItExist) {
			httpStatusCode = 404;
			fileToLoad = "error404.html";
		}

		var fileBytes = fs.readFileSync(fileToLoad);

		var mimeType = mimeTypes[path.extname(fileToLoad).split(".")[1]];

		res.writeHead(httpStatusCode,{'Content-type':mimeType});
		res.end(fileBytes);
	});
}).listen(8080,'127.0.0.1');