/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-18-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class PlatformEventCtrl {
    
    public static void publishEvent(){
        Tech_Event__e event = new Tech_Event__e();
        event.Message__c = 'test';
        event.recordId__c = '0016F000041zsacacacTDQAY';
        event.status__c = 'Success';
        EventBus.publish(event);
    }
}