# container-siege
siege stress testing tool based on ubuntu

### Building the image
```
docker build -t siege .
```

### Usage
To show valid parameters/help:
```
docker run --rm siege
```
#### 1. Run siege on a single url:
```
# Run for 10s simulating 50 concurrent users
docker run --rm siege -t10s -c50 https://www.google.com
```

#### 2. Randomly hit urls from a list
```
# Run for 10s simulating 50 concurrent users, using example list specified in the Dockerfile
docker run --rm siege -t10s -c50 -i -f urls.txt
```
