public class VinayDevAccess {
     public static void getOrgLimits(){
        HttpRequest req = new HttpRequest();
        //req.setEndpoint('callout:SF_Named_Creds/services/data/v58.0/sobjects/Account/0015i000006VrocAAC');
       // req.setEndpoint('callout:Vinaydev/services/data/v59.0/jobs/ingest/');
       req.setEndpoint('callout:devOrg/services/data/v59.0/limits'); //to get limits of an org
      // req.setEndpoint('callout:chucknorris/'); //to get limits of an org

        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
    }

}