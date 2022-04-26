public with sharing class GetSentController {

    @AuraEnabled
    public static String serverEcho(String recordId) {
        
        Review__c recs = [SELECT  Review__c, Sentiment__c FROM Review__c WHERE Id = :recordId];
         
        

        
        String endPointURL = <INSERT URL HERE>;

        Httprequest request = new HttpRequest();
        Http http = new Http();
        
        string body = '{\"data\":\"';
        body = body + recs.Review__c;
        body = body + '\"}';
        
        request.setMethod('POST');
        request.setEndpoint(endPointURL);
        request.setHeader('Content-Type', 'text/plain');
     
        request.setTimeout(120000); 
        request.setBody(body);     
        system.debug(body);
        HttpResponse response = http.send(request);  
        
        system.debug(response);
        
        Map<String, Object> values = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        
        String temp = (String)values.get('Sentiment');
        
        recs.Sentiment__c = temp;
        //recs.Sentiment__c = 'Update';
        update(recs);
        
        return ('Response: ' + temp);
    }

}