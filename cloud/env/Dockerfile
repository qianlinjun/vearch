FROM centos:7

COPY env.sh /env/env.sh

COPY app /env/app/


# 1
# ENV PATH $PATH:/usr/local/python3/bin/
# ENV PYTHONIOENCODING utf-8
# RUN set -ex \
# 	&& mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
# 	&& curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
# 	&& yum makecache \
# 	&& sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo \
# 	&& yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make wget \
# 	&& yum clean all \
# 	&& mkdir /usr/local/python3 \
# 	&& wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz \
# 	&& tar -xvJf  Python-3.6.8.tar.xz && rm -f Python-3.6.8.tar.xz \
# 	&& cd Python-3.6.8 \
# 	&& ./configure prefix=/usr/local/python3 \
# 	&& make && make install \
# 	&& cd .. \
# 	&& rm -rf Python-3.6.8


RUN /env/env.sh

# 2
RUN yum -y install epel-release && \
    yum -y install gcc && \
    yum -y install zlib-devel && \
    yum -y install bzip2-devel && \
    yum -y install openssl-devel && \
    yum -y install ncurses-devel && \
    yum -y install wget && \
    yum -y install zlib* && \
    yum -y install python3-devel
RUN wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz
RUN tar -zxvf Python-3.6.8.tgz
RUN mkdir -p /usr/local/python3
RUN cd /Python-3.6.8/ && \
    ./configure --prefix=/usr/local/python3 --enable-optimizations && \
    make && \
    make install
RUN ln -s /usr/local/python3/bin/python3.6 /usr/bin/python3 && \
    ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
RUN pip3 install --upgrade pip
RUN pip3 install numpy