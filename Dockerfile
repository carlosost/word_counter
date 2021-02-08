FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install git python3.6 python3-pip -y
RUN pip3 install flask
RUN git clone https://github.com/carlosost/word_counter.git
RUN chmod -R 777 word_counter/
ENV PYTHONPATH=word_counter:$PYTHONPATH
CMD ./word_counter/app.py