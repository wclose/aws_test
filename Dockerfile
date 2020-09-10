FROM continuumio/miniconda3:4.7.12

SHELL ["/bin/bash", "-c", "-l"]

RUN apt-get update && \
	apt-get install -y procps=2:3.3.15-2 && \
	apt-get clean -y

COPY env/r.yaml /opt/biorad/env/
RUN conda env create -f /opt/biorad/env/r.yaml && \
	conda clean -afy

RUN rm root/.bashrc
RUN echo "source /etc/container.bashrc" >> /etc/bash.bashrc && \
	echo ". /opt/conda/etc/profile.d/conda.sh" > /etc/container.bashrc && \
	echo "conda activate r" >> /etc/container.bashrc

ENV BASH_ENV /etc/container.bashrc
ENV ENV /etc/container.bashrc
