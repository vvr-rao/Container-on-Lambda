# Container-on-Lambda

Docker Container which can be deployed on AWS Lambda. I have tested this with a Provisioned Concurrency of 200 and exposed this as a REST API via API Gateway

The code uses a pretrained NLP model to predict sentiment

Steps to Deploy(without using serverless cli):
1) Push the Docker Image to AWS Elastic Container Registry
2) Expose the Container in Lambda
3) Create a version and an Alias of the function and configure Provisioned Concurrency
4) Create an API Gateway endpoint to point to the created Lambda function

Steps to Deploy(using Serverless cli):
Official documentation here - https://www.serverless.com/framework/docs/getting-started
1) Download serverles cli. (curl -o- -L https://slss.io/install | bash  for Linux)
2) Download this repository (serverless create -u https://github.com/vvr-rao/Container-on-Lambda -n my-project)
3) cd into the project folder and deploy: (serverless deploy)
4) The serverless.yml should provision an image on ECR, create a Lambda with Provisioned and Reserved Concurrency, create an API Gateway endpoint and CloudFornt templates
5) Issues: I needed to log into the API Gateway and tweak it as follows:
        a) modified the Integration Request to uncheck "Use Lambda Proxy integration" (I guess I wrote my code to not use that)
        b) added a new Method Response - HTTP 200 - which did not get created by default (no clue why)
7) IMPORTANT!!! - Delete by using "serverless remove" or you will get a hefty bill!
      


### Sample Input (POST)
{
  "data": "plenty of funny quotes but ultimately fell flat"
}




