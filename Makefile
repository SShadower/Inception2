all : Run

Run : 
	@docker-compose -f docker-compose.yml up 

remove_containter : 
	sudo docker-compose -f docker-compose.yml down

stop_running : 
	sudo docker-compose -f docker-compose.yml stop

start_stoped_container : 
	sudo docker-compose -f docker-compose.yml start

lists_container : 
	sudo docker ps
