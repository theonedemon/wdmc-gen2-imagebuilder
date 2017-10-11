1. For update docker image:
```
docker rmi theonedemon/wdmc-gen2-imagebuilder

docker build -t theonedemon/wdmc-gen2-imagebuilder .

docker image tag theonedemon/wdmc-gen2-imagebuilder:latest theonedemon/wdmc-gen2-imagebuilder:0.1

docker image push theonedemon/wdmc-gen2-imagebuilder
```