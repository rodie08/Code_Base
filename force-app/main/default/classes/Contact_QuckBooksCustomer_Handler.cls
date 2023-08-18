public class Contact_QuckBooksCustomer_Handler {
    public static void create_QuickCustomer(){
        //List<Account> accountList
        String access_Token =QuickBooks_Authentication_handler.get_AuthenticationCode();
        System.debug('access_Token>>>'+access_Token);
        String body='';
        List<QuickBooks__c> quickBooks_CS = QuickBooks__c.getall().values(); // custom Setting
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(quickBooks_CS[0].Sandbox_Base_URL__c+'/v3/company/'+quickBooks_CS[0].Realm_ID__c+'/customer');
        req.setMethod('POST');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Content-Type', 'application/json');
        body='"{\"DisplayName\":\"JohnDoe\",\"GivenName\":\"John\",\"FamilyName\":\"Doe\",\"PrimaryEmailAddr\":{\"Address\":\"johndoe@example.com\"},\"PrimaryPhone\":{\"FreeFormNumber\":\"555-555-5555\"},\"BillAddr\":{\"Line1\":\"123MainSt\",\"City\":\"Anytown\",\"CountrySubDivisionCode\":\"CA\",\"PostalCode\":\"12345\",\"Country\":\"USA\"}}"';
        req.setBody(body);
        System.debug('req Endpoint>>> '+req.getEndpoint());
        System.debug('req body>>> '+req.getBody());
        
        HttpResponse res = h.send(req);
        system.debug('res>>'+res.getBody()); 
        system.debug('res>>'+res.getStatusCode());
        
    }
}