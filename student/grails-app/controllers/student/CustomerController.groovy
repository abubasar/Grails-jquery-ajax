package student

class CustomerController {
 def index() {
    redirect (action:"addCustomer")
    }

    def addCustomer(){
	
		Customer customer
		
		
		customer=new Customer()
		
		customer.firstName=params.firstName
		customer.lastName=params.lastName
                customer.email=params.email
                customer.message=params.message
                customer.notify=params.notify
        
		customer.password=params.password
		
		customer.save(flush:true)
		
	}
        
    def list(){
        def customers=Customer.list()
        [listCustomers:customers]
        
    }
}
