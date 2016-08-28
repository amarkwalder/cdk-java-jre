
JAVA_VERSION_MAJOR=8
JAVA_VERSION_MINOR=102
JAVA_VERSION_BUILD=14

.DEFAULT_GOAL := build

clean:
	-docker rmi amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}
	-docker rmi amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}
	-docker rmi amarkwalder/cdk-java-jre:latest
.PHONY: clean

build:
	docker build \
		-t amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD} \
		-t amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR} \
		.
.PHONY: build

tag:
	docker pull amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}
	docker tag amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD} amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}
	docker push amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}
	docker tag amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD} amarkwalder/cdk-java-jre:latest
	docker push amarkwalder/cdk-java-jre:latest
.PHONY: tag

run: build
	docker run -it --rm amarkwalder/cdk-java-jre:${JAVA_VERSION_MAJOR}
.PHONY: run
