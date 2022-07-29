package co.nodb.sol.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import co.nodb.sol.student.Student;

@Component
public class StudentDao {

	private Map<String, Student> studentDB = new HashMap<String, Student>();
	
	public void insert(Student student) {
		studentDB.put(student.getsNum(), student);
	}
	
	public Student select(String sNum) {
		return studentDB.get(sNum);
	}
	
	public void update(Student student) {
		studentDB.put(student.getsNum(), student);
	}
	
	public void delete(String sNum) {
		studentDB.remove(sNum);
	}
	
	public Map<String, Student> getStudentDB() {
		return studentDB;
	}
	
}
