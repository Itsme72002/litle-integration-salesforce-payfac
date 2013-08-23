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
public class ResetController {
	public ResetService resetService;
	
	public ResetController(){
		resetService = new ResetService();
	}
	
	public PageReference resetAll(){
		try{
			//delete all request response logs
			resetService.deleteAllLitleRequestResponseLogs();
			//delete all opportunities
			resetService.deleteAllOpportunities();
			//delete all account
			resetService.deleteAllAccounts();
			//delete mapping logs
			resetService.deleteAllLitleMappingsSaveLogs();
			//delete mappings
			resetService.deleteAllSalesforceLitleMappingsObjects();
			//create default mapping
			resetService.createDefaultMapping();
			//create demo account
			String accountId = resetService.createDefaultAccount(); 
			//create demo opportunity
			resetService.createDefaultOpportunityWithLinkedAccount(accountId);
			ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.CONFIRM,'Instance Reset Successful.'));
		}catch(DmlException e){
			System.debug(e.getMessage());
			ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.ERROR,'Error resetting all values.'));
		}
		return null;
	}

}