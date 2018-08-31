package student

class Student {
	String firstName
	String lastName
	String email

    static constraints = {
       firstName(blank:false,minSize:2,unique:true)
       lastName(blank:false,minSize:2,unique:true)
       email(blank:false,email:true,unique:true)
    }
}
