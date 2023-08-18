/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 05-23-2023
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public with sharing class ContactHandler {
    
    public static void validateDuplicate(List<Contact> conList) {
        system.debug('conList>>>'+conList);
        try {
            List<Contact> fetchContactList = new List<Contact>();
            Map<String,Contact> emailVSContactMAp = new Map<String,Contact>();
            Map<String,Contact>  phoneVSContactMap = new  Map<String,Contact>();
            for(Contact con : conList){
                if(con.Email != null){
                    emailVSContactMAp.put(con.Email,con);
                }
                 if(con.Phone != null) {
                    phoneVSContactMap.put(con.Phone,con);
                }
            }
            System.debug('emailVSContactMAp::::: ' + emailVSContactMAp);
            System.debug('phoneVSContactMap::::: ' + phoneVSContactMap);
            fetchContactList =[SELECT Email,Phone FROM Contact WHERE Email IN : emailVSContactMAp.keySet() OR Phone IN : phoneVSContactMap.keySet()];
            if((emailVSContactMAp.size() > 0  && emailVSContactMAp != null) || (phoneVSContactMap.size() > 0 &&  phoneVSContactMap != null)){
                System.debug(' inside the bif confdiotion');
                
            }
            System.debug('fetchContactList::::: ' + fetchContactList);
            if(!fetchContactList.isEmpty()){
                for(Contact con :fetchContactList){
                    if(con.Email != null){
                        if (emailVSContactMAp.containsKey(con.Email)) {
                            emailVSContactMAp.get(con.Email).Email.addError('Duplicate Record !! Record aleady exists'); 
                        }
                    }
                    else if(con.Phone != null){
                        if (phoneVSContactMap.containsKey(con.Phone)) {
                            phoneVSContactMap.get(con.Phone).Phone.addError('Duplicate Record !! Record aleady exists'); 
                        }
                    }
                }
            }
           
        } catch (Exception  e) {
            System.debug('e.getMessage(): ' + e.getMessage());
            System.debug('e.getStackTraceString(): ' + e.getStackTraceString());
        }
    }
}