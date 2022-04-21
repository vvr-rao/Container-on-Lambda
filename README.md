# Container-on-Lambda

Docker Container which can be deployed on AWS Lambda. I have tested this with a Provisioned Concurrency of 200 and exposed this as a REST API via API Gateway

The code uses a pretrained NLP model to predict sentiment

Steps to Deploy;
1) Push the Docker Image to AWS Elastic Container Registry
2) Expose the Container in Lambda
3) Create a version and an Alias of the function and configure Provisioned Concurrency
4) Create an API Gateway endpoint to point to the created Lambda function

## Sample Input (POST)
{
  "data": "plenty of funny quotes but ultimately fell flat"
}




