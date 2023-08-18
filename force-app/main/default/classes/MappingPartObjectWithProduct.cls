global class MappingPartObjectWithProduct implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query='SELECT Name,Part_Number__c,Product__c, Active__c FROM Part__c WHERE Product__c = null ';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Part__c> scope) {
        try{
            Set<String> productName = new Set<String>();
            Set<String> productCode = new Set<String>();
            List<Product2> insertProductRecords = new List<Product2>();
            List<Part__c> updatePartRecords = new List<Part__c>();
            // List<sObject> dmlList = new List<sObject>();
            
            Map<String,Product2> productNameVsProduct = new Map<String,Product2>();
            for(Part__c partObj : scope){
                productName.add(partObj.Name);
                productCode.add(partObj.Part_Number__c); // Product is similer to PartNumber
            }
            system.debug('productName::: '+productName);
            system.debug('productCode::: '+productCode);
            if(!productName.isEmpty() && !productCode.isEmpty()){
                for(Product2 productObj : [SELECT Name, ProductCode ,IsActive FROM Product2 WHERE Name IN: productName AND ProductCode IN: productCode]){
                    if(!productNameVsProduct.containsKey(productObj.ProductCode))
                        productNameVsProduct.put(productObj.ProductCode,productObj);
                    
                }
            }
            system.debug('productNameVsProduct::: '+productNameVsProduct);
            
            for(Part__c partObj : scope){
                if(!productNameVsProduct.isEmpty() && productNameVsProduct.size() > 0){
                    if(productNameVsProduct.containsKey(partObj.Part_Number__c)){
                        partObj.Product__c =productNameVsProduct.get(partObj.Part_Number__c).Id;
                        updatePartRecords.add(partObj);      
                    }
                }else{
                    Product2 newProduct = new Product2();
                    newProduct.name=partObj.Name;
                    newProduct.IsActive=partObj.Active__c;
                    newProduct.ProductCode=partObj.Part_Number__c;
                    insertProductRecords.add(newProduct);
                }
            }
            system.debug('updatePartRecords::: '+updatePartRecords);
            system.debug('insertProductRecords::: '+insertProductRecords);
            if(!insertProductRecords.isEmpty() && insertProductRecords.size() > 0){
                //Database.update(updatePartRecords);
                Database.insert(insertProductRecords);
            }
            for(Part__c partObj : scope){
                if(!insertProductRecords.isEmpty() && insertProductRecords.size() > 0){
                    for(Integer  i=0;i<=insertProductRecords.size()-1; i++){
                        system.debug('insertProductRecords data:: '+insertProductRecords[i]);
                        if(insertProductRecords[i].ProductCode == partObj.Part_Number__c)
                        partObj.Product__c=insertProductRecords[i].Id;
                        updatePartRecords.add(partObj);
                    }
                }
            }
            if(!updatePartRecords.isEmpty() && updatePartRecords.size() > 0){
                //Database.update(updatePartRecords);
                Database.update(updatePartRecords);
            }
        }catch(Exception exp){
            system.debug('Error:::: '+ exp.getMessage()+' line ::: '+exp.getLineNumber());
        }
    }       
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
    }
}