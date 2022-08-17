package co.nodb.sol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import co.nodb.sol.dao.StudentDao;
import co.nodb.sol.student.Student;

@Component
public class StudentRegisterService {

	@Autowired(required = false)
	private StudentDao studentDao;
	
	public StudentRegisterService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public void register(Student student) {
		String sNum = student.getsNum();
		if(verify(student.getsNum())) {
			studentDao.insert(student);
		} else {
			System.out.println("The student has already registered.");
		}
	}
	
	public boolean verify(String sNum){
		Student student = studentDao.select(sNum);
		return student == null ? true : false;
	}
}
