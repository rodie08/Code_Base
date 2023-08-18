@RestResource(urlMapping='/ContactAPI/*')
global  class AccountRestService {
    @HTTPGet
    global static List<Account> FetchAccountDetailsMethod(){
        try{
            RETURN [SELECT NAME FROM Account LIMIT 10];
        }catch(Exception exp){
            system.debug('Error ::::'+exp.getMessage()+' Line Number'+exp.getLineNumber());
        }
        RETURN null;
    }
    @HTTPPOST
    global static List<Account> FetchAccountDetailsMethod(String recordID){
        try{
            RETURN [SELECT NAME FROM Account WHERE Id =: recordID];
        }catch(Exception exp){
            system.debug('Error ::::'+exp.getMessage()+' Line Number'+exp.getLineNumber());
        }
        RETURN null;
    }
}