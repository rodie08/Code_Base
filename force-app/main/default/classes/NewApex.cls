public class NewApex {
    
    public static void testMethod1(){
        
        List<String> strList= new List<String>{'a','b','c','d','a'};
            system.debug('strList:: '+strList);
        Set<String> newSet = new Set<String>();
        newSet.addAll(strList);
        system.debug('newSet:: '+newSet);
        
    }
}