package co.nodb.sol.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Student {
	
	@Autowired(required=false)
	private String sNum;
	@Autowired(required=false)
	private String sId;
	@Autowired(required=false)
	private String sPw;
	@Autowired(required=false)
	private String sName;
	@Autowired(required=false)
	private int sAge;
	@Autowired(required=false)
	private String sGender;
	@Autowired(required=false)
	private String sMajor;
	
	public Student() {}
	
	public Student(String sNum, String sId, String sPw, String sName, 
			int sAge, String sGender, String sMajor) {
		this.sNum = sNum;
		this.sId = sId;
		this.sPw = sPw;
		this.sName = sName;
		this.sAge = sAge;
		this.sGender = sGender;
		this.sMajor = sMajor;
		
	}

	public String getsNum() {
		return sNum;
	}

	public void setsNum(String sNum) {
		this.sNum = sNum;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsPw() {
		return sPw;
	}

	public void setsPw(String sPw) {
		this.sPw = sPw;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public int getsAge() {
		return sAge;
	}

	public void setsAge(int sAge) {
		this.sAge = sAge;
	}

	public String getsGender() {
		return sGender;
	}

	public void setsGender(String sGender) {
		this.sGender = sGender;
	}

	public String getsMajor() {
		return sMajor;
	}

	public void setsMajor(String sMajor) {
		this.sMajor = sMajor;
	}

	
}
