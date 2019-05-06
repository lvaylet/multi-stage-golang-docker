# Building Minimal Docker Image for Go Applications

> Use multi-stage builds and the scratch base image for tiny Golang docker images

Build and tag the Docker image with:

```
docker build --tag lvaylet/simple-golang-app .
```

Confirm the Docker image is indeed very tiny with:

```
docker images | grep simple-golang-app
```

Finally, run the Golang application with:

```
docker run --rm -d -p 8080:8080 lvaylet/simple-golang-app
```

Browse http://localhost:8080 and confirm the web page shows "Home Page".

## References

- https://tutorialedge.net/golang/go-multi-stage-docker-tutorial/
- https://tachingchen.com/blog/building-minimal-docker-image-for-go-applications/
- https://thenewstack.io/dockerize-go-applications/
- https://hackernoon.com/golang-docker-microservices-for-enterprise-model-5c79addfa811
- https://docs.docker.com/samples/library/golang/
- https://docs.docker.com/develop/develop-images/multistage-build/
- https://medium.com/@petomalina/using-go-mod-download-to-speed-up-golang-docker-builds-707591336888
- https://medium.com/@pierreprinetti/the-go-1-11-dockerfile-a3218319d191
- https://container-solutions.com/faster-builds-in-docker-with-go-1-11/
