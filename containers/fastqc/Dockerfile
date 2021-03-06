# Starting with image already containing conda
FROM continuumio/miniconda3:4.7.12

# Building image using bash shell
SHELL ["/bin/bash", "-c", "-l"]

# Name of conda environment being created (must match env.yaml filename)
ARG CONDA_ENV="fastqc"

# Installing image dependencies
RUN apt-get update && \
	apt-get install -y procps=2:3.3.15-2 && \
	apt-get clean -y

# Building the conda environment
COPY $CONDA_ENV.yaml /opt/biorad/env/
RUN conda env create -f /opt/biorad/env/$CONDA_ENV.yaml && \
	conda clean -afy

# Removing default acitvation commands and setting correct ones
RUN rm root/.bashrc
RUN echo "source /etc/container.bashrc" >> /etc/bash.bashrc && \
	echo ". /opt/conda/etc/profile.d/conda.sh" > /etc/container.bashrc && \
	echo "conda activate $CONDA_ENV" >> /etc/container.bashrc

# Activating environment when using non-login, non-interactive shell
ENV BASH_ENV /etc/container.bashrc
ENV ENV /etc/container.bashrc
