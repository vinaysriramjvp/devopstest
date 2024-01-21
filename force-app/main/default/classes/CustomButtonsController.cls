public class CustomButtonsController {
    
    @AuraEnabled
    public static string getNextRecord (Id recordId){
        system.debug('rcordId'+recordId);
        String sObjName = recordId.getSObjectType().getDescribe().getName();
        system.debug('objname'+sObjName);
      string query = 'select' +' Name'+ ' From' + ' ' + String.escapeSingleQuotes(sObjName) + '  Where Id'+' =: recordId' +' limit 1';
      system.debug('query'+query);
      Sobject rec = Database.query(query);
      system.debug('name'+rec.get('Name'));
      string autoNumVal =(String) rec.get('Name');
      system.debug('autoNumVal'+rec.get('Name'));
     /**  for(Sobject record :rec){
        system.debug('obj'+record);
        system.debug('name'+record.get('Name'));
        string autoNumVal = record.get('Name');
    }*/
     // string autoNumVal = rec.Name;
      string num =string.valueof(integer.valueof(autoNumVal.substringAfter('-')));
      system.debug('num'+num);
      Integer numVal = integer.valueOf(autoNumVal.substringAfter('-'))+1;
      string nextautoNum = autoNumVal.substringBefore(num) + string.valueof(numVal);
      system.debug('numVal'+nextautoNum);
      string nextquery ='select' +' Name'+ ' From ' + String.escapeSingleQuotes(sObjName) + '  Where Name'+' =: nextautoNum' +' limit 1';
      system.debug('nextquery'+nextquery);
      string nextId;
      SObject nextRecord;
      try{
      nextRecord = Database.query(nextquery);
      }
      catch(Exception e){
        nextId ='';
      }
      
      if( nextRecord != null){
      nextId = (string)nextRecord.get('Id');
      }
      else{
        nextId='';
          
      }
      system.debug('nextId'+nextId);
     /**  for(Sobject nexrecord :nextRecord){
        system.debug('nexrecord'+obj);
        system.debug('name'+nexrecord.get('Id'));
        string nextId = nexrecord.get('Id');
        system.debug('nextId'+nextId);
    }*/
      return nextId;
    }
    @AuraEnabled
    public static string getPreviousRecord (Id recordId){
        String sObjName = recordId.getSObjectType().getDescribe().getName();
        system.debug('objname'+sObjName);
      string query = 'select' +' Name'+ ' From' + ' ' + String.escapeSingleQuotes(sObjName) + '  Where Id'+' =: recordId' +' limit 1';
      system.debug('query'+query);
      Sobject rec = Database.query(query);
      system.debug('name'+rec.get('Name'));
      string autoNumVal =(String) rec.get('Name');
      system.debug('autoNumVal'+rec.get('Name'));
     /**  for(Sobject record :rec){
        system.debug('obj'+record);
        system.debug('name'+record.get('Name'));
        string autoNumVal = record.get('Name');
    }*/
     // string autoNumVal = rec.Name;
      string num =string.valueof(integer.valueof(autoNumVal.substringAfter('-')));
      system.debug('num'+num);
      Integer numVal = integer.valueOf(autoNumVal.substringAfter('-'))-1;
      string nextautoNum = autoNumVal.substringBefore(num) + string.valueof(numVal);
      system.debug('numVal'+nextautoNum);
      string nextquery ='select' +' Name'+ ' From ' + String.escapeSingleQuotes(sObjName) + '  Where Name'+' =: nextautoNum' +' limit 1';
      system.debug('nextquery'+nextquery);
      string nextId;
      SObject nextRecord;
      try{
      nextRecord = Database.query(nextquery);
      }
      catch(Exception e){
        nextId ='';
      }
      
      if( nextRecord != null){
      nextId = (string)nextRecord.get('Id');
      }
      else{
        nextId='';
          
      }
      system.debug('nextId'+nextId);
     /**  for(Sobject nexrecord :nextRecord){
        system.debug('nexrecord'+obj);
        system.debug('name'+nexrecord.get('Id'));
        string nextId = nexrecord.get('Id');
        system.debug('nextId'+nextId);
    }*/
      return nextId;
    }@AuraEnabled
    public static string getObjectName( String recordId ){
       id ids =id.valueOf(recordId);
        String sObjName = ids.getSObjectType().getDescribe().getName();

        return sObjName;
    }

}