public class WrapperClass {
    
    public static void wrapperMethod(){
        try{
            List<Account> acclist =[Select Name,AccountNumber,	Contact__c	FROM Account LIMIT 10];
            System.debug('acclist>>>'+acclist);
            WrapperClass1 newWrapperClass1 = new WrapperClass1();
            if(!acclist.isEmpty()){
                newWrapperClass1.objList=acclist;
            }
            System.debug('acclist>>>'+newWrapperClass1.objList);
        }catch(Exception ex){
            System.debug('Line> '+ex.getLineNumber()+ '  error ' +ex.getMessage() +' cause '+ex.getCause());   
        }
    }
    public class WrapperClass1{
        public List<sobject> objList;
        public String labelName;
        public string valueName;        
    }
}