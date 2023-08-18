public class Object1_Handler {
    
    public static void objectConversion(List<Object1__c> Object1List){
        try{
            System.debug('Object1List:::'+Object1List);
            List<sObject> sobjList = (List<sObject>)Object1List;
            //List<Object2__c> objB = (List<Object2__c>) sobjList;
            
            //List<Sobject> sobjList = (List<SObject>)appointment_list;
            //List<Account> objB = (List<Account>) sobjList;
            
            String str = JSON.serialize(Object1List);
            List<Object2__c> objB1 = (List<Object2__c>) JSON.deserialize(str, List<Object2__c>.Class);
            if(!objB1.isEmpty()){
                INSERT objB1;
                //DataBase.insert(List<Sobject> objB);
            }
        }catch(Exception exp){
            system.debug('Error::::: '+exp.getMessage()+' line number::::: '+exp.getLineNumber() );
        }
    }
}