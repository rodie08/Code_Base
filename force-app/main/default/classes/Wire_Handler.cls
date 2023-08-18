public class Wire_Handler {
    
    @AuraEnabled( cacheable=true)
    public static Wrapper_Class wire_Method(String ojectName){
        try{
            System.debug(ojectName);
            Wrapper_Class Wrapper_ClassObj = new Wrapper_Class();
            if(String.isNotEmpty(ojectName)){
                String query ='SELECT Id, Name FROM '+ojectName+' LIMIT 5';
                List<sObject> sObjectList = Database.query(query);
                Wrapper_ClassObj.objectList=sObjectList;
                System.debug('Wrapper_ClassObj>>>'+Wrapper_ClassObj);
                RETURN Wrapper_ClassObj;
            }
            else{
                Wrapper_ClassObj.error_Message ='Somthing went wrong';
                RETURN Wrapper_ClassObj;
            }
            // RETURN NULL;
        }catch(Exception exp){
            System.debug('Line >>'+exp.getLineNumber()+' error'+exp.getMessage());
        }
        RETURN NULL;
    }
    public class Wrapper_Class{
        @AuraEnabled   public List<sObject> objectList;
        @AuraEnabled  public String error_Message;
    }
}