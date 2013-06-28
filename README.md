# Celluloid::Reel issue reproduction

You need to manually install the 'reel' and ' net-http-pipeline' gems.

After that, run the server with ```ruby handler.rb```

Check everything is ok by running ```curl localhost:5005```, you should get some fake JSON data.

To reproduce the issue, run ```ruby break.rb``` and note that those request do not fail, but if you try to run a cURL request from the CLI again, the server has stopped responding.