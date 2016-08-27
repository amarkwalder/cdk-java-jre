
JAVA_VERSION_MAJOR=7
JAVA_VERSION_MINOR=80
JAVA_VERSION_BUILD=15

.DEFAULT_GOAL := build

clean:
	-docker rmi amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}
	-docker rmi amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}
.PHONY: clean

build:
	docker build \
		-t amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD} \
		-t amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR} \
		.
.PHONY: build

tag:
	-git tag -d ${JAVA_VERSION_MAJOR} 
	git tag -a -m "Java Version: ${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}" ${JAVA_VERSION_MAJOR} 
	git push origin ${JAVA_VERSION_MAJOR}
.PHONY: tag

run: build
	docker run -it --rm amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}
.PHONY: run
