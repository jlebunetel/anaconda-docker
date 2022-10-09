FROM continuumio/anaconda3

# Create default user
ARG USER_NAME=docker_user
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd ${USER_NAME} --non-unique --gid ${USER_GID}
RUN useradd ${USER_NAME} --non-unique --uid ${USER_UID} --gid ${USER_GID} --create-home

# Change directory
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
