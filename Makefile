
JAVA_VERSION_MAJOR=8
JAVA_VERSION_MINOR=102
JAVA_VERSION_BUILD=14

.DEFAULT_GOAL := build

clean:
	-docker rmi amarkwalder/cdk-java-server-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}
	-docker rmi amarkwalder/cdk-java-server-jre:${JAVA_VERSION_MAJOR}
.PHONY: clean

build:
	docker build \
		-t amarkwalder/cdk-java-server-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD} \
		-t amarkwalder/cdk-java-server-jre:${JAVA_VERSION_MAJOR} \
		.
.PHONY: build

tag: clean build
	git tag ${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}
	git tag ${JAVA_VERSION_MAJOR} 
	git push origin ${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD} 
.PHONY: tag

run: build
	docker run -it --rm amarkwalder/cdk-java-server-jre:${JAVA_VERSION_MAJOR}
.PHONY: run
