package org.example.server_masc;

import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface CustomerRepository extends CrudRepository<Customer, Integer> {

    List<Customer> findByLastName(String lastName);

    Customer findById(int id);

    Customer findCustomerById(Integer id);
}