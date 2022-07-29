package co.nodb.sol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import co.nodb.sol.dao.StudentDao;
import co.nodb.sol.student.Student;

@Component
public class StudentDeleteService {

	@Autowired(required = false)
	private StudentDao studentDao;
	
	public StudentDeleteService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public void delete(Student student) {
		if(verify(student.getsNum())) {
			studentDao.delete(student.getsNum());
		} else {
			System.out.println("Student information is not available.");
		}
	}
	
	public boolean verify(String sNum){
		Student student = studentDao.select(sNum);
		return student != null ? true : false;
	}
}
