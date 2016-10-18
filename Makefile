
all: glibc-bin.tar.gz

.has_xenial32:
	@if [ -z "`docker images -q ubuntu32:xenial`" ]; then \
	  echo "ubuntu32:xenial docker image is missing"; \
	  exit 100; \
	fi
	@echo "Found ubuntu32:xenial docker image"
	@touch $@

.built: .has_xenial32
	@if [ -z "`docker images -q glibc32-builder:latest`" ]; then \
	  echo "Building docker container..."; \
	  docker build -t glibc32-builder .;\
	  echo "Docker container built!"; \
	else \
	  echo "Found glibc32-builder:latest docker image"; \
	fi
	@touch $@

glibc-bin.tar.gz: .built
	@echo "Building glibc32. This will take some time!..."
	docker run --rm -e STDOUT=1 glibc32-builder /builder 2.23 /usr/glibc-compat >glibc-bin.tar.gz
	@echo "Done!"

clean:
	rm -f glibc-bin.tar.gz .has_xenial32 .built

clean-docker: clean
	docker rmi glibc32-builder:latest
