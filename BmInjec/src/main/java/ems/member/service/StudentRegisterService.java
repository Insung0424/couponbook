package ems.member.service;

import org.springframework.stereotype.Component;

import ems.member.Student;
import ems.member.dao.StudentDao;

@Component
public class StudentRegisterService {

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
