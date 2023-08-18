public class MyFutureClass {


    public static void testmethod1(){
        firstFutureMethod();
    }

    @future
    public static void firstFutureMethod() {
        // Code to be executed asynchronously
        secondFutureMethod();
    }

    @future
    public static void secondFutureMethod() {
        // Code to be executed asynchronously
        thirdFutureMethod();
    }

    @future
    public static void thirdFutureMethod() {
        // Code to be executed asynchronously
    }

}