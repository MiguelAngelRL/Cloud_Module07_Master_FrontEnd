var express = require('express');

var PORT = 8888;

var app = express();

app.get('/', function (req, res) {
  //console.log(req);
  console.log("Home page called");
  res.send('Bienvenid@ a la imagen docker de Miguel Angel Romero');
});

app.get('/:name', function (req, res) {
  //console.log(req);
  console.log("Detail page called");
  res.send('Hola ' + req.params.name);
});

const server = app.listen(PORT);

process.on('SIGUSR1', async function() {
    console.log('Received STOPSIGNAL signal (SIGUSR1), shutting down properly after 3 seconds');
    await setTimeout(() => {
        server.close(() => {
          console.log('Closed out remaining connections');
          process.exit(0);
        });
    }, 3000);
    
});

console.log('Running on http://localhost:' + PORT);
