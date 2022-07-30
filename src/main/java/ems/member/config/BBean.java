package ems.member.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import ems.member.DataBaseConnectionInfo;
import ems.member.dao.StudentDao;
import ems.member.service.EMSInformationService;
import ems.member.service.StudentAllSelectService;
import ems.member.service.StudentDeleteService;
import ems.member.service.StudentModifyService;
import ems.member.service.StudentRegisterService;
import ems.member.service.StudentSelectService;

@Configuration
public class BBean {
	
	@Bean
	public StudentDao studentDao() {
		return new StudentDao();
	}
	@Bean
	public StudentRegisterService registerService() {
		return new StudentRegisterService(studentDao());
	}
	@Bean
	public StudentModifyService modifyService() {
		return new StudentModifyService(studentDao());
	}
	@Bean
	public StudentDeleteService deleteService() {
		return new StudentDeleteService(studentDao());
	}
	@Bean
	public StudentSelectService selectService() {
		return new StudentSelectService(studentDao());
	}
	@Bean
	public StudentAllSelectService allSelectService() {
		return new StudentAllSelectService(studentDao());
	}
	@Bean
	public DataBaseConnectionInfo dataBaseConnectionInfoDev() {    
		DataBaseConnectionInfo infoDev = new DataBaseConnectionInfo();
		infoDev.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		infoDev.setUserId("scott");
		infoDev.setUserPw("tiger");            
		return infoDev;
	}
	@Bean
	public DataBaseConnectionInfo dataBaseConnectionInfoReal() {    
		DataBaseConnectionInfo infoDev = new DataBaseConnectionInfo();    
		infoDev.setJdbcUrl("jdbc:oracle:thin:@192.168.0.1:1521:xe");              
		infoDev.setUserId("masterid");
		infoDev.setUserPw("masterpw");            
		return infoDev;
		}
	
	
	@Bean
	public EMSInformationService informationService() {
		EMSInformationService e=new EMSInformationService();
		e.setInfo("Education Management System program was developed in 2015.");
		e.setCopyRight("COPYRIGHT(C) 2015 EMS CO., LTD. ALL RIGHT RESERVED. CONTACT MASTER FOR MORE INFORMATION.");
		e.setVer("The version is 1.0");
		e.setsYear(2015);
		e.setsMonth(1);
		e.setsDay(1);
		e.seteYear(2015);
		e.seteMonth(2);
		e.seteDay(28);
		ArrayList<String>developers=new ArrayList<String>();
		developers.add("Cheney.");
		developers.add("Eloy.");
		developers.add("Jasper.");
		developers.add("Dillon.");
		developers.add("Kian.");
		e.setDevelopers(developers);
		Map<String,String>administrators=new HashMap<String, String>();
		administrators.put("Cheney", "cheney@springPjt.org");
		administrators.put("Jasper", "jasper@springPjt.org");
		e.setAdministrators(administrators);
		Map<String,DataBaseConnectionInfo>dbInfos=new HashMap<String, DataBaseConnectionInfo>();
		dbInfos.put("dev", dataBaseConnectionInfoDev());
		dbInfos.put("real", dataBaseConnectionInfoReal());
		e.setDbInfos(dbInfos);
		
		return e;
	}
}
