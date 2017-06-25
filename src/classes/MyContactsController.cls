public class MyContactsController {

    public String msg { get; set; }
    public List<Contact> myContacts;
    String mes;
    public List<Contact> getMyContacts() {
        myContacts= [SELECT Id, Name, Account.Name FROM Contact
                                 ORDER BY LastModifiedDate DESC LIMIT 10];
        if(myContacts<> null) {
            System.debug('@@@@@@@@@@@@@ Contact records are found');
            mes = 'Contact are fetched from database';
        } else {
            mes = 'Contacts are NOT Fetched from Database';
        }
        return myContacts;
    }
    
    String result='Click on an account to fetch the data';
   
    public String getFetchedData() {
       return result;
    }
    
    public PageReference invokeService() {
      Id id = System.currentPageReference().getParameters().get('id');
      result = [SELECT Name FROM Contact WHERE Id=:id].Name;
      //returning null indicates the same page should be returned - in place change
      return null;
   }
}