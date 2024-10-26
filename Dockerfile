FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && apt-get install -y python3-venv

RUN git clone https://github.com/chaitanya-0799/django.git /app/django

RUN python3 -m venv /app/myenv
RUN /bin/bash -c "source /app/myenv/bin/activate && pip3 install django"

RUN /bin/bash -c " source /app/myenv/bin/activate && python3 /app/django/manage.py migrate"

EXPOSE 8000

CMD [ "/bin/bash", "-c", "source /app/myenv/bin/activate && python3 /app/django/manage.py runserver 0.0.0.0:8000"]



