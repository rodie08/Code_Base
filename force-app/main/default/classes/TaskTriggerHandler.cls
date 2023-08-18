/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-23-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class TaskTriggerHandler {
    public static void preventUserToDeleteTask(List<Task> taskList) {
        try {
            Profile loggedInUserDetails =[SELECT Name from profile where id =: userinfo.getProfileId()];
            System.debug('loggedInUserDetails: ' + loggedInUserDetails);
            if(loggedInUserDetails != null){
            if(loggedInUserDetails.Name != 'System Administrator'){
                taskList[0].addError('You cannot delete the record');
            }

            }
        } catch (Exception ex) {
            System.debug('line no.::::: ' + ex.getLineNumber()+' error ::::'+ ex.getMessage());
              }

    }
}