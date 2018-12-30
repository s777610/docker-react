## We need two Docker Containers
Dockerfile.dev is for development model, Dockerfile is for production model. Using Dokcer is able to make workflow easy<br>

## The workflow of deployment is
### Push changes to feature branch => Pull Request => Master Branch => Travis CI FLow => AWS Elastic Beanstalk<br>
- The Travis CI will test our app automatically if we provide .travis.yml
- Create EB env, then create User for EB, then get AWS_ACCESS_KEY and AWS_SECRET_KEY and put them on travis CI as env variable. Remember to expose port 80 for nginx.
- Whenever make poll requests, we can see pending checks from Travis CI. Travis CI will test our code for new changes.
- After passing all test, we can merge pull request. Then, new version will be automatically deploy to AWS Elastic Beanstalk again.

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
Build and Run
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
### Run producation server, nginx use port 80 as default
```
docker run -p 8080:80 <image id>
```
