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
1) Download serverles cli. (curl -o- -L https://slss.io/install | bash  --  for Linux)
2) Download this repository (serverless create -u https://github.com/vvr-rao/Container-on-Lambda -n my-project)
3) cd into the project folder and deploy: (serverless deploy)
4) The serverless.yml should provision an image on ECR, create a Lambda with Provisioned and Reserved Concurrency, create an API Gateway endpoint and CloudFornt templates
5) Note: make sure your code is built to support the format of "Use Lambda Proxy Integration" or you get a number of annoying errors
6) IMPORTANT!!! - Delete by using "serverless remove" or you will get a hefty bill!
      

Also included code for a Lighting Aura Component to call the API from Salesforce. This can be exposed as an Action on a Record and is a way to consume the Model.

### Sample Input (POST)
{
  "data": "plenty of funny quotes but ultimately fell flat"
}




