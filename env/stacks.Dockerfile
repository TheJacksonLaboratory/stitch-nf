FROM continuumio/miniconda
LABEL Sam Widmayer <sjwidmay@gmail.com>


RUN  apt-get --allow-releaseinfo-change update \
    && apt-get install -y automake \
    autoconf \
    libpcre3-dev \
    libssl-dev \
    make

RUN wget https://catchenlab.life.illinois.edu/stacks/source/stacks-2.64.tar.gz --no-check-certificate
RUN tar xfvz stacks-2.64.tar.gz
RUN cd stacks-2.64 && chmod 775 configure && ls -l
RUN ./configure
RUN make

#RUN conda install -c bioconda stacks
#RUN conda install -c "bioconda/label/main" stacks-2.61
RUN conda install -c bioconda seqtk
RUN conda install -c "bioconda/label/cf201901" seqtk
