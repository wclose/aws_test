FROM continuumio/miniconda3:4.7.12

SHELL ["/bin/bash", "-c", "-l"]

RUN apt-get update && \
	apt-get install -y procps=2:3.3.15-2 && \
	apt-get clean -y

COPY env/r.yaml /opt/biorad/env/
RUN conda env create -f /opt/biorad/env/r.yaml && \
	conda clean -afy 
RUN echo "source /opt/conda/etc/profile.d/conda.sh" >> /etc/profile && \
	echo "conda activate r" >> /etc/profile && \
	echo "conda activate r" >> /root/.bashrc

# Setting default working directory and executing input commands via login shell so the correct conda env is loaded
ENTRYPOINT ["/bin/bash", "-c", "-l"]
