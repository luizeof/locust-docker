# Start with a base Python 2.7.13 image
FROM python:2.7.13
MAINTAINER Beau Lyddon <beau.lyddon@realkinetic.com>
# Add the external tasks directory into /locust-tasks
RUN mkdir locust-tasks
COPY locust-tasks /locust-tasks
WORKDIR /locust-tasks
# Install the required dependencies via pip
RUN pip install -r /locust-tasks/requirements.txt
# Set script to be executable
RUN chmod 755 run.sh
# Expose the required Locust ports
EXPOSE 5557 5558 8089
# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["./run.sh"]
