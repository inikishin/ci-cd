lint:
	echo "make lint"

test:
	echo "make test"

build:
	echo "make build"
	@if [ $VER = "test" ]; then\
		echo "Hello world";\
    	fi

deploy:
	echo "make deploy"

restart:
	echo "make restart"
