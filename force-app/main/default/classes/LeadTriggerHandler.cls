/**
* @description       : 
* @author            : ChangeMeIn@UserSettingsUnder.SFDoc
* @group             : 
* @last modified on  : 05-24-2023
* @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class LeadTriggerHandler {
    public static void  sendEmail(List<Lead> leadList) {
        try {
            system.debug('leadList:::: '+leadList);
            for(Lead leadObj : leadList){
                if(leadObj.Email != null){
                    String htmlBody;
                    EmailTemplate emailTemplate =[SELECT Id,Subject,Description,HtmlValue,DeveloperName,Body FROM EmailTemplate WHERE Name ='Lead Welcome Letter' LIMIT 1];
                    System.debug('EmailTemplate::::: ' + EmailTemplate);
                    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                    message.setTargetObjectId(leadObj.id); 
                    message.setSenderDisplayName(leadObj.Name);
                    //message.htmlbody=;
                    htmlBody=emailTemplate.HtmlValue;
                    System.debug('htmlBody1-->'+htmlBody);
                    message.setUseSignature(false); 
                    htmlBody = htmlBody.replace('{!Lead.Name}',leadObj.FirstName);
                    htmlBody = htmlBody.replace('{!User.Name}','Rohit Rawat');
                    htmlBody = htmlBody.replace('{!User.Profile}','Admin');
                    htmlBody = htmlBody.replace('{!User.CompanyName}','CLoud');
                    message.htmlbody=htmlBody;
                    message.setBccSender(false); 
                    OrgWideEmailAddress obj1 =[SELECT Id FROM OrgWideEmailAddress WHERE Address = 'Rohit.Rawat@cloudanalogy.com' LIMIT 1];
                    message.setOrgWideEmailAddressId(obj1.Id);
                    message.setSaveAsActivity(false);
                    //message.setTemplateID(emailTemplate.Id);
                    message.toAddresses = new String[]{leadObj.Email};
                        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
                            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                    if (results[0].success) 
                    {
                        System.debug('The email was sent successfully.');
                    } else {
                        System.debug('he email failed to send: '+  results[0].errors[0].message);
                    }
                    
                }     
            }
        } catch(Exception e) {
            System.debug('error::::: '+e.getMessage()+' line number::::: '+e.getLineNumber());
        }
        
    }
}