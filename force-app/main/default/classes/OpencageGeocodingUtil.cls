/**
 * @description       : 
 * @author            : Vinay Sriram
 * @group             : 
 * @last modified on  : 07-09-2023
 * @last modified by  : Vinay Sriram
**/
global with sharing class OpencageGeocodingUtil {
    @future(callout=true)
    public static void forwardgeocoding(string accountId){
        //https://api.opencagedata.com/geocode/v1/json?
        //q=Rua+Cafel%C3%A2ndia%2C+Carapicu%C3%ADba%2C+Brasil&key=373b99a4ccdb41c4b61a3090200b2860&pretty=1

        string endpoint =system.label.OpenCageEndPoint;
        string apiKey=system.label.OpenCagekey;
        string errormsg='';
        Account accrec=[SELECT id,ShippingCity,ShippingCountry,ShippingPostalCode,ShippingState,ShippingStreet,Location__Latitude__s,Location__Longitude__s FROM Account WHERE id=: accountId WITH SECURITY_ENFORCED];
        string address = accrec.ShippingStreet +','+accrec.ShippingCity+','+accrec.ShippingState+','+accrec.ShippingPostalCode+','+accrec.ShippingCountry;
        string encodedaddress=  EncodingUtil.urlEncode(address,'UTF-8');
        string finalendpoint=endpoint+'q='+ encodedaddress+'&key='+apikey+'&pretty=1&limit1';
        Http http = new Http();
        httprequest httpreq= new httprequest();
        httpreq.setMethod('GET');
        httpreq.setEndpoint(finalendpoint);
        httpreq.setHeader('Content-Type', 'application/json');
        Httpresponse response = new Httpresponse();
        try{
           response= http.send(httpreq);
            if(response.getStatusCode() == 200){
                string body= response.getBody();
               // system.debug('body'+body);
                system.debug(system.LoggingLevel.DEBUG,'body'+body);
                OpencageGeoCode opendata= OpencageGeoCode.parse(body);
                list<OpencageGeoCode.Results> results = opendata.results;
                system.debug('data'+opendata);
                if(results != null && results.size()>0){
                    OpencageGeoCode.Results result = results[0];
                    system.debug('result' +result);
                    accrec.Location__Longitude__s= result.geometry.lng;
                    accrec.Location__Latitude__s=result.geometry.lat;
                    update accrec;
                }

            }
            else{
                
            }
        }
        catch(System.Exception err){
            
        }
    }

}