global  class CallFromButton {
    webservice static String myMethod(String studentId){
        system.debug('studentId::: '+studentId);
        return 'Test';
    }
}