# Dockerfile to build Docker Jupyter Image #

FROM jupyter/base-notebook
RUN pip install pandas
RUN pip install matplotlib
RUN pip install numpy
