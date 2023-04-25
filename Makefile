build: clean
	docker build . -t haskellmon-img:latest

clean:
	-docker rm haskellmon
	-docker image rm haskellmon-img:latest

run: 
	docker run -i --name haskellmon haskellmon-img:latest 

build_run: build run

