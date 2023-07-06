FROM artifactory.momenta.works/docker/ubuntu:18.04
RUN apt-get update && apt-get install -y  wget 
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
RUN chmod a+x Anaconda3-2023.03-1-Linux-x86_64.sh
RUN ./Anaconda3-2023.03-1-Linux-x86_64.sh -b -p ~/anaconda
RUN cd ~/anaconda/bin && ./conda init
RUN /bin/bash -c "source ~/.bashrc" 
# ENV PYTHONPATH=/root/anaconda/bin/python

ENV CONDA_PREFIX=/root/anaconda
ENV CONDA_EXE=/root/anaconda/bin/conda
ENV CONDA_PYTHON_EXE=/root/anaconda/bin/python
ENV CONDA_PROMPT_MODIFIER=(base) 

ENV PATH=/root/anaconda/bin:/root/anaconda/condabin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV CONDA_DEFAULT_ENV=base
RUN pip install pytest allure-pytest
RUN mkdir node && cd node
RUN wget https://npm.taobao.org/mirrors/node/v15.8.0/node-v15.8.0-linux-x64.tar.gz
# 解压缩安装包
RUN tar -zxvf node-v15.8.0-linux-x64.tar.gz
RUN rm -rf node-v15.8.0-linux-x64.tar.gz
# 创建软链
RUN ln -s /node-v15.8.0-linux-x64/bin/npm /usr/bin/npm
RUN ln -s /node-v15.8.0-linux-x64/bin/node /usr/bin/node
RUN wget https://registry.npmjs.org/allure-commandline/-/allure-commandline-2.13.0.tgz

RUN tar -zxvf allure-commandline-2.13.0.tgz
RUN rm -f allure-commandline-2.13.0.tgz
RUN mv package allure
RUN chmod -R 777 allure
RUN ln -s /allure/bin/allure /usr/bin/allure

RUN apt-get install -y openjdk-8-jdk

# pytest  demo  --alluredir=./bxy
# allure serve ./bxy




