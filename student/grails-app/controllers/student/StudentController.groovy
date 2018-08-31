package student

import grails.converters.JSON

class StudentController {

    def index() { 
		def listStudents=Student.list()
		render (view:"index",model:[listStudents:listStudents])
	}
	def listStudent(){
		def listStudents=Student.list()
		render (template:"listStudent",model:[listStudents:listStudents])
	}
        def getStudent(){
		Student student=Student.get(params.id)
		render student as JSON
	}
	def addStudent(){
		def result=[:]
		Student student
		if(params.id){
			student=Student.get(params.id)
		
		}else{
		student=new Student()
		}
		student.firstName=params.firstName
		student.lastName=params.lastName
		student.email=params.email
		student.validate()
		if(!student.hasErrors()){
			student.save()
			result["msg"]="OK"
		}else{
		result["msg"]="ERROR"
		}
		render result as JSON
		
	}
	
	def deleteStudent(){
		
		def result=[:]
		Student student= Student.get(params.id)
		try{
			student.delete(flush:true)
			result["msg"]="OK"
		}catch(Exception e){
		result["msg"]="ERROR"
		}
		render result as JSON
	}
	
	def searchStudent(){
		
		List<Student> students =Student.findAllByFirstName(params.search)
		
			render students as JSON
	
	}
}
