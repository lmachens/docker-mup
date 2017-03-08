# docker-mup

This image uses [meteor-up](https://github.com/kadirahq/meteor-up/).  
I recommend the following folder structure:

- deployments
  - live
    - mup.js
    - settings.json
  - staging
    - mup.js
    - settings.json
- source
  - .meteor
  - client
  - server
  - imports

The mup.js files need absolute paths like this:

``` js
module.exports = {
  meteor: {
    path: '/home/mup/source',
}
```

Run the container with deployments and source volumes:
```
docker run -dit \
  --name deploy \
  -v deployments:/home/mup/deployments \
  -v source:/home/mup/source \
  lmachens/mup
```


Now you can exec mup.  
Setting up the servers: 
```
docker exec deploy \
  mup setup \
  --config=/home/mup/deployments/live/mup.js 
```

Deploying an App:  
```
docker exec deploy \
  mup deploy \
  --config=/home/mup/deployments/live/mup.js \
  --settings=/home/mup/deployments/live/settings.json
```
