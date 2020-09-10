FROM continuumio/miniconda3:4.7.12

SHELL ["/bin/bash", "-c", "-l"]

RUN apt-get update && \
	apt-get install -y procps=2:3.3.15-2 && \
	apt-get clean -y

RUN rm root/.bashrc

COPY env/r.yaml /opt/biorad/env/
RUN conda env create -f /opt/biorad/env/r.yaml && \
	conda clean -afy 

COPY entrypoint.sh /opt/biorad/
ENTRYPOINT ["/opt/biorad/entrypoint.sh"]
