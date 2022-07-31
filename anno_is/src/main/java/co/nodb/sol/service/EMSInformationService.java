package co.nodb.sol.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import co.nodb.sol.DBCon.DataBaseConnectionInfo;

@Component
public class EMSInformationService {

	@Autowired(required = false)
	private String info;
	@Autowired(required = false)
	private String copyRight;
	@Autowired(required = false)
	private String ver;
	@Autowired(required = false)
	private int sYear;
	@Autowired(required = false)
	private int sMonth;
	@Autowired(required = false)
	private int sDay;
	@Autowired(required = false)
	private int eYear;
	@Autowired(required = false)
	private int eMonth;
	@Autowired(required = false)
	private int eDay;
	@Autowired(required = false)
	private List<String> developers;
	@Autowired(required = false)
	private Map<String, String> administrators;
	@Autowired(required = false)
	private Map<String, DataBaseConnectionInfo> dbInfos;
	
	public EMSInformationService() {

	}
	
	
	public void outputEMSInformation(){
		System.out.print("\n\n");
		String devPeriod = sYear + "/" + sMonth + "/" + sDay + " ~ " + eYear + "/" + eMonth + "/" + eDay;
		System.out.println(info + "(" + devPeriod + ")" + "\n" + copyRight + "\n" + ver);
		System.out.println("Developers : " + developers);
		System.out.println("Administrator : " + administrators);
		outputDataBaseInfo();
		System.out.print("\n\n");
	}

	void outputDataBaseInfo() {
		Set<String> keys = dbInfos.keySet();
		Iterator<String> iterator = keys.iterator();
		
		while (iterator.hasNext()) {
			String key = iterator.next();
			DataBaseConnectionInfo info = dbInfos.get(key);
			System.out.println("[" + key + "]");
			System.out.print("jdbcUrl:" + info.getJdbcUrl() + "\t");
			System.out.print("userId:" + info.getUserId() + "\t");
			System.out.print("userPw:" + info.getUserPw() + "\n");
		}
	}
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCopyRight() {
		return copyRight;
	}

	public void setCopyRight(String copyRight) {
		this.copyRight = copyRight;
	}

	public String getVer() {
		return ver;
	}

	public void setVer(String ver) {
		this.ver = ver;
	}

	public int getsYear() {
		return sYear;
	}

	public void setsYear(int sYear) {
		this.sYear = sYear;
	}

	public int getsMonth() {
		return sMonth;
	}

	public void setsMonth(int sMonth) {
		this.sMonth = sMonth;
	}

	public int getsDay() {
		return sDay;
	}

	public void setsDay(int sDay) {
		this.sDay = sDay;
	}

	public int geteYear() {
		return eYear;
	}

	public void seteYear(int eYear) {
		this.eYear = eYear;
	}

	public int geteMonth() {
		return eMonth;
	}

	public void seteMonth(int eMonth) {
		this.eMonth = eMonth;
	}

	public int geteDay() {
		return eDay;
	}

	public void seteDay(int eDay) {
		this.eDay = eDay;
	}

	public List<String> getDevelopers() {
		return developers;
	}

	public void setDevelopers(List<String> developers) {
		this.developers = developers;
	}

	public Map<String, String> getAdministrators() {
		return administrators;
	}

	public void setAdministrators(Map<String, String> administrators) {
		this.administrators = administrators;
	}

	public Map<String, DataBaseConnectionInfo> getDbInfos() {
		return dbInfos;
	}

	public void setDbInfos(Map<String, DataBaseConnectionInfo> dbInfos) {
		this.dbInfos = dbInfos;
	}

}
