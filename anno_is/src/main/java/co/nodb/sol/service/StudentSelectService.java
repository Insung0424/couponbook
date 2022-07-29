package co.nodb.sol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import co.nodb.sol.dao.StudentDao;
import co.nodb.sol.student.Student;

@Component
public class StudentSelectService {

	@Autowired(required = false)
	private StudentDao studentDao;
	
	public StudentSelectService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public Student select(String sNum) {
		if(verify(sNum)) {
			return studentDao.select(sNum);
		} else {
			System.out.println("Student information is not available.");
		}
		
		return null;
	}
	
	public boolean verify(String sNum){
		Student student = studentDao.select(sNum);
		return student != null ? true : false;
	}
}
