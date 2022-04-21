import json
def handler(event, context):
    data = json.loads(json.dumps(event))
    payload = data['data']
    output = "Hello " + payload
    Resp = [{"response": output}]
    response = {"statusCode": 200, "body": json.dumps(Resp)}
    return response
