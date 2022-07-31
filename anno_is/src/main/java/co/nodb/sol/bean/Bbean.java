package co.nodb.sol.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import co.nodb.sol.DBCon.DataBaseConnectionInfo;
import co.nodb.sol.service.EMSInformationService;

@Configuration
@ComponentScan( basePackages = "co.nodb.sol.dao" )
@ComponentScan( basePackages = "co.nodb.sol.DBCon" )
@ComponentScan( basePackages = "co.nodb.sol.service" )
@ComponentScan( basePackages = "co.nodb.sol.student" )

public class Bbean {
	
	
	@Bean
	public EMSInformationService info() {
		EMSInformationService informationService = new EMSInformationService();
		informationService.setInfo("Education Management System program was developed in 2015.");
		informationService.setCopyRight("COPYRIGHT(C) 2015 EMS CO., LTD. ALL RIGHT RESERVED. CONTACT MASTER FOR MORE INFORMATION.");
		informationService.setVer("The version is 1.0");
		informationService.setsYear(2015);
		informationService.setsMonth(1);
		informationService.setsDay(1);
		informationService.seteYear(2015);
		informationService.seteMonth(2);
		informationService.seteDay(28);
		List<String> developers = new ArrayList<>();
		developers.add("Cheney.");
		developers.add("Eloy.");
		developers.add("Jasper.");
		developers.add("Dillon.");
		developers.add("Kian.");
		informationService.setDevelopers(developers);
		
		Map<String, String> administrators = new HashMap<>();
		administrators.put("Cheney", "cheney@springPjt.org");
		administrators.put("Jasper", "jasper@springPjt.org");
		
		informationService.setAdministrators(administrators);
		
		Map<String, DataBaseConnectionInfo> dbInfos = new HashMap<>();
		
		DataBaseConnectionInfo dbinfo = new DataBaseConnectionInfo();
		dbinfo.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		dbinfo.setUserId("scott");
		dbinfo.setUserPw("tiger");
		dbInfos.put("dev", dbinfo);
		
		DataBaseConnectionInfo dbinfo2 = new DataBaseConnectionInfo();
		dbinfo2.setJdbcUrl("jdbc:oracle:thin:@192.168.0.1:1521:xe");
		dbinfo2.setUserId("masterid");
		dbinfo2.setUserPw("masterpw");
		dbInfos.put("real", dbinfo2);
		
		informationService.setDbInfos(dbInfos);
		
		return informationService;
	}

}
