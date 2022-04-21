import json
import joblib

def handler(event, context):
    #import the model
    model = open('model/SVM_cv_model.pkl','rb')
    clf = joblib.load(model)
    
    #read the input string
    data = json.loads(json.dumps(event))
    payload = data['data']
    
    new_data = []
    
    string1 = payload.replace('\d+', '') # remove digits
    string1 = string1.replace('[^\w\s]', '') # remove punctuation
    new_data.append(string1)
    
    my_prediction = clf.predict(data)
    
    out = {1: 'Negative', 2: 'Neutral', 3: 'Positive'}
    
    output = out[my_prediction[0]]
    #Resp = [{"response": output}]
    #response = {"statusCode": 200, "body": json.dumps(Resp)}
    {"Sentiiment": output}
    return response
