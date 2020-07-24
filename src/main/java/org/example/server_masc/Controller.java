package org.example.server_masc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;


@RestController
public class Controller {

    @Autowired
    private CustomerRepository customerRepository;

    @PostMapping("/add")
    public String addCustomer(@RequestParam String first, @RequestParam String last) {
        Customer customer = new Customer();
        customer.setFirstName(first);
        customer.setLastName(last);
        customerRepository.save(customer);
        return "Added new customer to repo!";
    }

    @GetMapping("/list")
    public Iterable<Customer> getCustomers() {
        return customerRepository.findAll();
    }

    @GetMapping("/find/{id}")
    public Customer findCustomerById(@PathVariable Integer id) {
        return customerRepository.findCustomerById(id);
    }

    @PostMapping("/listarRecursos")
    public String listarRecursos(@RequestParam String data) {
        String data2=data.replaceAll("'", "");
        String[] valores = data2.split(";");
        System.out.println("postou "+data);
        String comando;
        String tipoUser, tipoDef;
        String result="";
        tipoUser="";
        tipoDef="";

        comando ="SELECT nome, ((ACOS( SIN( "+valores[2]+" * PI( ) /180 ) * "
                + "SIN( latitude * PI( ) /180 ) + COS( "+valores[2]+" * PI( ) /180 ) * "
                + "COS( latitude * PI( ) /180 ) * COS( ("
                + valores[3] +" - longitude) * PI( ) /180 ) ) *180 / PI( )) * "
                + "60 * 1.1515) *1000 AS `distance`,_masc_tipo_def.descricao,"
                + "_masc_recurso_outdoor.latitude,_masc_recurso_outdoor.longitude,"
                + "_masc_tipo_recurso.icone "
                + "FROM `_masc_recurso_outdoor` "
                + "RIGHT JOIN _masc_tipo_def "
                + "ON _masc_tipo_def.id_tipodef = _masc_recurso_outdoor.id_tipodef "
                + "RIGHT JOIN _masc_tipo_recurso "
                + "ON _masc_tipo_recurso.id_tipoRecurso = _masc_recurso_outdoor.id_tiporecurso "
                + "WHERE _masc_tipo_def.Descricao = '"+valores[1]+"' "
                + "HAVING `distance` <=15000 ORDER BY `distance` ASC ;";

        System.out.println("resultado ="+result);
        System.out.println("comando ="+comando);
        String linha,nome,dist,desc,lat,lon,icone;

        try{
            Connection con = Database.getConnection("dissys");
            Statement stmt = con.createStatement();
            stmt = con.createStatement();
            ResultSet r;
            r = stmt.executeQuery(comando);
            while(r.next()){
                nome = r.getString("nome");
                dist = r.getString("distance");
                desc = r.getString("descricao");
                lat = r.getString("latitude");
                lon = r.getString("longitude");
                icone = r.getString("icone");
                linha = nome+";"+dist+";"+desc+";"+lat+";"+lon+";"+icone;
                result+=linha+"\n";
            }

            con.close();
        }catch (Exception e){
            //System.out.println("Erro na comunicação "+sistemaIp +" "+sistemaUser+" "+ e.getMessage());
            //System.out.println("Erro SQL "+comando+"");
            e.printStackTrace();
            result="no;";
        }
        result = result+tipoUser+";"+tipoDef;
        //return Response.status(201).entity(result).build();
        return result;
    }



}
