public class CallingFlow {
    
    public static void passingValue(){
        Account acc = new Account(Name ='FLown Account3');
        insert acc;
        //Create parameter
        Map<String, Object> inputs = new Map<String, object>();
        inputs.put('AccountRrecord', acc);
        system.debug('inputs:: '+inputs);
        Flow.Interview.Create_Contact myFlow =new Flow.Interview.Create_Contact(inputs);
        myFlow.start();  
    }
}