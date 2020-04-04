var http = require('http');
var exec = require('child_process').exec;
http.createServer(function (req, res) {
// 该路径与WebHooks中的路径部分需要完全匹配，实现简易的授权认证。
    let message = 'check your url is the right webhook url';
    if (req.url === '/push/blog') {
// 如果url匹配，表示认证通过，则执行 sh ./deploy.sh
        exec('sh ./deploy.sh');
        message = 'blog has been updated';
    }
    res.end(message);
}).listen('4001');
