/*
Copyright (c) 2013 Litle & Co.
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
public class PrimaryContact {
	
	private String firstName;
	private String LastName;
    private String emailAddress;
    private String phone;
    private Boolean isFirstNameFromOpportunity;
    private Boolean isLastNameFromOpportunity;
    private Boolean isEmailAddressFromOpportunity;
    private Boolean isPhoneFromOpportunity;
    
    public PrimaryContact(){
    	isFirstNameFromOpportunity = false;
	    isLastNameFromOpportunity = false;
	    isEmailAddressFromOpportunity = false;
	    isPhoneFromOpportunity = false;
    }
    
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmailAddress() {
        return emailAddress;
    }
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public Boolean getIsFirstNameFromOpportunity() {
        return isFirstNameFromOpportunity;
    }
    public void setIsFirstNameFromOpportunity(Boolean isFirstNameFromOpportunity) {
        this.isFirstNameFromOpportunity = isFirstNameFromOpportunity;
    }
    public Boolean getIsLastNameFromOpportunity() {
        return isLastNameFromOpportunity;
    }
    public void setIsLastNameFromOpportunity(Boolean isLastNameFromOpportunity) {
        this.isLastNameFromOpportunity = isLastNameFromOpportunity;
    }
    public Boolean getIsEmailAddressFromOpportunity() {
        return isEmailAddressFromOpportunity;
    }
    public void setIsEmailAddressFromOpportunity(
            Boolean isEmailAddressFromOpportunity) {
        this.isEmailAddressFromOpportunity = isEmailAddressFromOpportunity;
    }
    public Boolean getIsPhoneFromOpportunity() {
        return isPhoneFromOpportunity;
    }
    public void setIsPhoneFromOpportunity(Boolean isPhoneFromOpportunity) {
        this.isPhoneFromOpportunity = isPhoneFromOpportunity;
    }
}
