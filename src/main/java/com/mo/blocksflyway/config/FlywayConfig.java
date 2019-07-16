package com.mo.blocksflyway.config;

import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class FlywayConfig {

    @Value("${migration.url}")
    public String HOST;

    @Value("${migration.port}")
    public String PORT;

    @Value("${migration.schema}")
    public String SCHEMA;

    @Value("${migration.username}")
    public String ID;

    @Value("${migration.password}")
    public String PW;

    @Value("${migration.location}")
    public String LOCATION;

    @PostConstruct
    public void init() {
        /*System.out.println("FlywayConfig init() call");
        System.out.println("HOST : " + HOST);*/
        getFlyway();
    }

    @Bean
    public Flyway getFlyway() {
        Flyway flyway = new Flyway();
        flyway.setDataSource("jdbc:mysql://" + HOST + ":" + PORT + "/" + SCHEMA, ID, PW);
        flyway.setLocations(LOCATION);
        flyway.clean();
        flyway.migrate();
        return flyway;
    }
}
