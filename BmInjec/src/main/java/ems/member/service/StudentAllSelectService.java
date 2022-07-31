package ems.member.service;

import java.util.Map;

import org.springframework.stereotype.Component;

import ems.member.Student;
import ems.member.dao.StudentDao;

@Component
public class StudentAllSelectService {

	private StudentDao studentDao;
	
	public StudentAllSelectService(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public Map<String, Student> allSelect() {
		return studentDao.getStudentDB();
	}
	
}