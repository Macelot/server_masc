package org.example.server_masc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.core.JdbcTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;

@Controller
@EnableAutoConfiguration
@ComponentScan()
@SpringBootApplication
public class Main implements CommandLineRunner{

    private static final Logger log = LoggerFactory.getLogger(Main.class);

    public static void main(String[] args){
        System.out.println("Iniciando");
        SpringApplication.run(Main.class, args);
    }

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public void run(String... strings) throws Exception {

        //create();


    }

    public void create(){
        log.info("Creating DATABASE");
        String sql="Drop DATABASE dissys;;";
        jdbcTemplate.execute(sql);
        sql="CREATE DATABASE dissys;;";
        jdbcTemplate.execute(sql);
        String s = new String();
        StringBuffer sb = new StringBuffer();
        try {
            //FileReader fr = new FileReader(new File("tabelasBancoDados.sql"));
            FileReader fr = new FileReader(new File("dissys.sql"));
            // be sure to not have line starting with "--" or "/*" or any other non aplhabetical character
            BufferedReader br = new BufferedReader(fr);
            while((s = br.readLine()) != null){
                if(!s.startsWith("--")) {
                    sb.append(s);
                }
            }
            br.close();

            // here is our splitter ! We use ";" as a delimiter for each request
            // then we are sure to have well formed statements
            String[] inst = sb.toString().split(";");
            System.out.println("t "+inst.length);

            Connection c = Database.getConnection("dissys");
            Statement st = c.createStatement();

            for(int i = 0; i<inst.length; i++) {
                st = c.createStatement();
                // we ensure that there is no spaces before or after the request string
                // in order to not execute empty statements
                st.executeUpdate(inst[i]);
                //System.out.println(">>" + inst[i]);
            }
        }
        catch(Exception e) {
            System.out.println("*** Error : " + e.toString());
            System.out.println("*** ");
            System.out.println("*** Error : ");
            e.printStackTrace();
        }
    }
}