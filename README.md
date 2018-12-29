# Docket

## We need two Docker Container

## 1. Dockerfile.dev
### In order to build image
```
docker build -f Dockerfile.dev .
```

### Take that image id and create container with port
```
docker run -p 3000:3000 <image id>
```

### If we make change on src, the app will be updated
```
docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app <image id>
```

### After creating docker-compose.yml, we can run docker-compose up
```
run docker-compose up
```
build and run
```
docker-compose up --build
```

### Run some test by overwrtie default command
```
docker run <image id> npm run test
```
Add `it` in order to get full interactivity
```
docker run -it <image id> npm run test
```




## 2. Dockerfile
Using multistep docker 
### After creating Dockerfile, run this command and get image id
```
docker build .
```
### run producation server, nginx use port 80 as default
```
docker run -p 8080:80 <image id>
```
