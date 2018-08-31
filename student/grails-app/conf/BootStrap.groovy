import student.Student

class BootStrap {

    def init = { servletContext ->
		
		new Student(firstName:"Arif",lastName:"islam",email:"ariful.sec@gmail.com").save()
		new Student(firstName:"Imran",lastName:"Vuiyan",email:"imran.suet@gmail.com").save()
    }
    def destroy = {
    }
}
