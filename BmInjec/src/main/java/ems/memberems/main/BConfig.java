package ems.memberems.main;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import ems.member.Student;
import ems.member.dao.StudentDao;

@Configuration
@ComponentScan( {"ems.member", "ems.member.assembler", "ems.member.service", "ems.member.dao"})
public class BConfig {
	
	@Bean
	public Student student() {
		return new Student();
	}

}
