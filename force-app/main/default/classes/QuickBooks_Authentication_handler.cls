public class QuickBooks_Authentication_handler {
    
    public static string get_AuthenticationCode(){        
        try{
            String body='';
            List<QuickBooks__c> quickBooks_CS = QuickBooks__c.getall().values(); // custom Setting
            System.debug('quickBooks_CS>'+quickBooks_CS);
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(quickBooks_CS[0].Base_URL__c);
            req.setMethod('POST');
            req.setHeader('Content-Type','application/x-www-form-urlencoded');
            //body = 'grant_type=client_credentials&client_id=ABsSO3bUame2MWfLrqCaqtfse1lgZYVBWTq7e1Gk5T0pmLtuFc&client_secret=IkP1w2yKJVgGdW2WZFJo48PYsvz4VTwd7LxrSuVM';
            body = 'grant_type=client_credentials&client_id='+quickBooks_CS[0].Client_ID__c+'&client_secret='+quickBooks_CS[0].Client_Secret__c;
            req.setBody(body);
            System.debug('req Endpoint>>> '+req.getEndpoint());
            System.debug('req body>>> '+req.getBody());
            HttpResponse res = h.send(req);
            system.debug('res>>'+res.getBody()); 
            system.debug('res>>'+res.getStatusCode());
            Auth_Response obj= (Auth_Response)JSON.deserialize(res.getBody(), Auth_Response.class);
            system.debug('obj>>'+obj.access_token);
            return obj.access_token;
            
        }catch(Exception exp){
            System.debug('Error>>>'+exp.getMessage()+'line number>>>'+exp.getLineNumber());
        }
        return null;
    }  
    public class Auth_Response {
        
        public String access_token;
        public String token_type;
        public Integer expires_in;
    }
}