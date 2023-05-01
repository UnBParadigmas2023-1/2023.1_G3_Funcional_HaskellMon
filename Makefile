build: clean
	docker build . -t haskellmon-img:latest

clean: clean-container	
	-docker image rm haskellmon-img:latest

clean-container:
	-docker rm haskellmon

run: clean-container
	docker run --name haskellmon -it haskellmon-img:latest 

build_run: build run

