public with sharing class PermissionClass {
    
    public static void permissionMethod(){
        try{
            List<Object1__c> Object1 = [SELECT Name FROM Object1__c];
            system.debug('Object1:: '+Object1);
        }catch(Exception ex){
            system.debug('Error: '+ ex.getMessage()+ ' line '+ex.getLineNumber());  
        }
    }
}