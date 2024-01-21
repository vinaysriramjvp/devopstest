public class SearchAndReplace implements Database.Batchable<sObject>{


  
   public Database.QueryLocator start(Database.BatchableContext BC){
       string query ='select id,Name from account limit 3';
      return Database.getQueryLocator(query);
   }

   public void execute(Database.BatchableContext BC, List<Account> scope){
       list<Account> accupdate = new list <Account>();
     for(Account s : scope){
         system.debug('s'+s.Name);
         s.name= s.name+1;
         
         accupdate.add(s);
             
     //s.put(Field,Value); 
     }
       update accupdate;
     //update scope;
    }

   public void finish(Database.BatchableContext BC){
   }
}