FROM alpine
RUN echo "hello"
RUN mkdir /tmp/tcs
WORKDIR /tmp/tcs
ADD . /tmp/tcs
CMD ["echo","hello","dear"]
ENTRYPOINT []
EXPOSE 8080 80/tcp 80/udp
COPY . /tmp/tcs
LABEL
MAINTAINER


FROM <image name>:<tag name>
A FROM command allows you to create a base image such as an operating system, a programming language, etc. All the instructions executed after this command take place on this base image. It contains an image name and an optional tag name. 
FROM ubuntu
FROM centos
FROM python:3

RUN
A RUN instruction is used to run specified commands. You can use several RUN instructions to run different commands. But it is an efficient approach to combine all the RUN instructions into a single one.
Each RUN command creates a new cache layer or an intermediate image layer and hence chaining all of them into a single line, becomes efficient. 

RUN apt−get −y install vim
RUN apt−get −y update

You can chain multiple RUN instructions in the following way −

RUN apt−get −y update \
&& apt−get −y install firefox \
&& apt−get −y install vim


CMD
If you want to run a docker container by specifying a default command that gets executed for all the containers of that image by default, you can use a CMD command. In case you specify a command during the docker run command, it overrides the default one. Specifying more than one CMD instructions, will allow only the last one to get executed.

Example of a CMD command −

CMD echo "Welcome to TutorialsPoint"

If you specify the above line in the dockerfile and run the container using the following command without specifying any arguments, the output will be “Welcome to TutorialsPoint”

sudo docker run −it <image_name>
Output − “Welcome to TutorialsPoint”

In case you try to specify any other arguments such as /bin/bash, etc, the default CMD command will be overridden.


ENTRYPOINT
The difference between ENTRYPOINT and CMD is that, if you try to specify default arguments in the docker run command, it will not ignore the ENTRYPOINT arguments. The exec form of an ENTRYPOINT command is −

ENTRYPOINT [“<executable-command>”, “<parameter 1>”, “<parameter 2>”, ….]

If you have used the exec form of the ENTRYPOINT instruction, you can also set additional parameters with the help of CMD command. For example −

ENTRYPOINT ["/bin/echo", "Welcome to TutorialsPoint"]
CMD ["Hello World!"]
Running docker run command without any argument would output −

Welcome to TutorialsPoint Hello World!

If you specify any other CLI arguments, “Hello World!” will get overridden.


WORKDIR
You can specify your working directory inside the container using the WORKDIR instruction. Any other instruction after that in the dockerfile, will be executed on that particular working directory only.

For example,
WORKDIR /usr/src/app
Sets the working directory to /usr/src/app inside the container.

COPY
This instruction allows you to copy a directory from your local machine to the docker container.

For example,

FROM ubuntu
WORKDIR /usr/src/app
COPY ∽/Desktop/myapp .
This would copy all the files inside the directory ∽/Desktop/myapp in your local machine to your current working directory inside the docker container.

ADD
Similar to COPY instruction, you can use ADD to copy files and folders from your local machine to docker containers. However, ADD also allows you to copy files from a URL as well as a tar file.

For example,

ADD ∽/Desktop/myapp/practice.tar.gz /usr/src/app
Would copy all the contents inside the tar file to /usr/src/app inside the container.

ADD <URL such as a github url> <Destination path inside the container>
This command would copy all the files inside the github url to the destination.


EXPOSE
The EXPOSE instruction inside the dockerfile informs that the container is listening to the specified port in the network. The default protocol is TCP.

Example

EXPOSE 8080
Will map the 8080 port to the container.

You can use the −p flag with the docker run command to make the container listen to another container or the host machine.

LABEL
You can use a LABEL instruction to add description or meta data for a docker image. Its a key−value pair.

Example −

LABEL description="This is a sample image"  

VOLUME
ARG
ONBUILD
STOPSIGNAL

