package co.nodb.sol.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import co.nodb.sol.dao.StudentDao;
import co.nodb.sol.student.Student;

@Component
public class StudentAllSelectService {

	
	@Autowired(required = false)
	private StudentDao studentDao;
	
	public StudentAllSelectService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public Map<String, Student> allSelect() {
		return studentDao.getStudentDB();
	}
	
}