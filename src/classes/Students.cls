@isTest
public class Students {

    static testMethod void validateStudent () {
        Student__c stu = new Student__c(Student_Name__c='Dhriti Ojha', Pin__c=411027);
        System.debug('Student name inserting: ' + stu.Student_Name__c);
        // Insert book
        insert stu;
        // Retrieve the new book
        stu = [SELECT Name FROM Student__c WHERE Id =:stu.Id];
        System.debug('Student name after statement executed: ' + stu.Student_Name__c);
        // Test that the trigger correct
        System.assertEquals('Dhriti Ojha', stu.Student_Name__c);
    }
    
    static testMethod void validateSelectStmt () {
        // Retrieve the new book
        Student stu = [SELECT Name FROM Student__c WHERE Id =:stu.Student_Name__c = 'Vivek Ojha'];
        System.debug('Student statement executed and address is ' + stu.Student_Name__c);
        // Test that the trigger correct
        System.assertEquals('Vivek Ojha', stu.Student_Name__c);
    }
}