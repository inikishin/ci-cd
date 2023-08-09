registry = hub.pandoraresearch.com # адрес docker registry
image = demo # Название docker образа

# Команда создания образа. Может принимать в переменную ver текущую версию сборки `make build ver=1.1.1`
# В этом случае в docker registry будут отправлены две версии образов: latest и 1.1.1, иначе только latest
build:
	docker build -t $(registry)/$(image) .
	docker push $(registry)/$(image):latest

	if [ "$(ver)" != "" ]; then\
		echo "push $(registry)/$(image):$(ver)";\
		docker tag $(registry)/$(image) $(registry)/$(image):$(ver);\
		docker push $(registry)/$(image):$(ver);\
	fi

run:
	docker-compose pull
	docker-compose up -d
