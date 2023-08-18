public class CreateSalesProcess {
    
    public static void craeteAccount_Contact_Opportunity(List<Lead> leadList){
        try{
            List<Account> accList = new List<Account>();
            List<Contact> conList = new List<Contact>();
            List<Opportunity> oppList = new List<Opportunity>();
            List<OpportunityContactRole> ocrList = new List<OpportunityContactRole>();
            Account acc;
            Contact con;
            Opportunity opp;
            OpportunityContactRole ocr;
            
            for(Lead leadObj : leadList) {
                acc = new Account(Name = leadObj.Company,Phone = leadObj.Phone);
                con = new Contact(LastName =leadObj.Company,Email=leadObj.Email,Phone=leadObj.Phone,AccountId=acc.Id);
                opp= new Opportunity(Name=leadObj.Company,CloseDate= System.today(),StageName='Prospecting',AccountId=acc.Id);
                ocr= new OpportunityContactRole(ContactId=con.Id,OpportunityId=opp.Id);
                accList.add(acc);
                conList.add(con);
                oppList.add(opp);
                ocrList.add(ocr);
                system.debug('accList:::: '+accList);
                system.debug('conList:::: '+conList);
                system.debug('oppList:::: '+oppList);
                system.debug('ocrList:::: '+ocrList);
                if(!accList.isEmpty() && accList.size() > 0 && !conList.isEmpty() && conList.size() > 0 && !ocrList.isEmpty() && ocrList.size() > 0 && !ocrList.isEmpty() && ocrList.size() > 0){
                    INSERT accList;
                    INSERT conList;
                    INSERT oppList;
                    INSERT ocrList;
                }
            }
        }catch(Exception exp){
            system.debug('error:::'+exp.getMessage()+' line number::::'+exp.getLineNumber());
        }
    }
}