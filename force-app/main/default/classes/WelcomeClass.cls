/**
 *  URL--> https://maantic2-dev-ed.my.salesforce.com/service/apexrest/v1/welcome/ui
 * */
@RestResource(urlMapping='/v1/welcome/*')
global with sharing class WelcomeClass {
  global final static String welcomemsg = 'This is testig Rest Resource';
  @httpGet
  global static String greetingmessage() {
    return welcomemsg;
  }
}