# Fetch python3.8 docker base image from AWS ECR

FROM public.ecr.aws/lambda/python:3.8
COPY app.py ./

# You can overwrite command in `serverless.yml` template
CMD ["app.handler"]
