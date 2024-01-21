@RestResource(urlMapping='/v1/Account/*')
global class AccountManager {
    @httpGet
    global static accountwrapper accountInfo() {
        RestRequest req = RestContext.request;
        String requestURI = req.requestURI;
        String accountId = requestURI.subStringAfterLast('/');
        List<Account> accountList = [
            SELECT id, Description, Name, Industry, Rating
            FROM Account
            WHERE id = :accountId
        ];
        List<Contact> contactList = [
            SELECT id, Name, Email, Phone
            FROM Contact
            WHERE AccountId = :accountList
        ];
        accountwrapper accwrap = new accountwrapper();
        if (!accountList.isEmpty()) {
            accwrap.accrecord = accountList[0];
            accwrap.conList = contactList;
        }
        return accwrap;
    }
    //@httpPost
    global static Account PostAccount(
        String accName,
        String accNumber,
        String industry,
        string description
    ) {
        Account accrecord = new Account(
            Name = accName,
            Industry = industry,
            Description = description,
            AccountNumber = accNumber
        );
        
        insert accrecord;
        return accrecord;
    }
    @httpDelete
    global static string deleteMethod() {
        RestRequest req = RestContext.request;
        String requestURI = req.requestURI;
        String accountId = requestURI.subStringAfterLast('/');
        List<Account> accountList = [
            SELECT id, Description, Name, Industry, Rating
            FROM Account
            WHERE id = :accountId
        ];
        if (!accountList.isEmpty()) {
            try {
                delete accountList;
                return '{"message":"Account Deleted"}';
            } catch (system.Exception e) {
                string errormsg = e.getMessage();
                return '{"message":"' + errormsg + '"}';
            }
        } else {
            return '{"message":"Account not found"}';
        }
    }
    @httpPatch
    global static UpdateWraper updateAccount(
        string rating,
        string accnumber,
        string description
    ) {
        UpdateWraper wrap = new UpdateWraper();
        RestRequest req = RestContext.request;
        String requestURI = req.requestURI;
        account accrec;
        String accountId = requestURI.subStringAfterLast('/');
        list<Account> accList = [SELECT id FROM Account WHERE Id = :accountId];
        if (!accList.isEmpty()) {
            accrec = new Account(
                id = accountId,
                Rating = rating,
                Description = description,
                AccountNumber = accnumber
            );
            wrap.accrecord = accrec;
            wrap.message = 'Account Updated';
            return wrap;
        } else {
            wrap.message = 'Account nOt found';
            return wrap;
        }
    }
    /**
* Sample JSON -->
* { "info":{
"accinfo":{
"Name": "Integration Test 122",
"AccountNumber": "Vinay8898998",
"Industry": "Banking",
"Description": "From Post"
}
}
}
*/
    @httpPost
    global static Account  accountInsert(AccountInfo info){
        Account accrec= info.accinfo;
        insert accrec;
        return accrec;
    }
    global class accountwrapper {
        global Account accrecord;
        global List<Contact> conList;
    }
    global class UpdateWraper {
        global Account accrecord;
        global string message;
    }
    global class AccountInfo{
        global Account accinfo{get;set;}
    }
}