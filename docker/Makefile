NAME = inception
COMPOSE_FILE = srcs/docker-compose.yml
VOLUMES_PATH = /home/mboulagh/inception_volumes

all : up

up : 
	@echo "--- STEP 1: Creating local volume directories"
	@mkdir -p $(VOLUMES_PATH)/mariadb
	@mkdir -p $(VOLUMES_PATH)/wordpress
	
	@echo "--- STEP 2: Running docker compose up and re-build"
	@docker compose -f $(COMPOSE_FILE) up --build -d

	@echo "--- STATUS: $(NAME) is up and running ✅️✅️"
	
down :
	@echo "Stopping and removing containers/networks"
	@docker compose -f $(COMPOSE_FILE) down

clean :
	@echo "Removing containers, networks, and internal Docker volumes"
	@docker compose -f $(COMPOSE_FILE) down --volumes

fclean : clean
	@echo "Removing $(NAME) Docker images"
	@docker compose -f $(COMPOSE_FILE) down --rmi all
	@echo "Removing physical data folders from the host system"
	@sudo rm -rf $(VOLUMES_PATH)
	@echo "Deep cleanup finished ✅️✅️"

re : fclean all

.PHONY: all down clean fclean re up
