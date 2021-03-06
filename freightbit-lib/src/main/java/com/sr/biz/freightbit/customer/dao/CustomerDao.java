package com.sr.biz.freightbit.customer.dao;

/**
 * Created by Jimmy on 5/13/14.
 */

import com.sr.biz.freightbit.customer.entity.Customer;

import java.util.List;

public interface CustomerDao {

    public Integer addCustomer(Customer customer);

    public void deleteCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public List<Customer> findAllCustomer();

    public Customer findCustomerById(Integer id);

    public List<Customer> findCustomerByClientId(Integer clientId);

    public List<Customer> findCustomerByName(String customer);

    public List<Customer> findCustomerByType(String customer);

    public Customer findCustomerByEmail(String customer);

    public List<Customer> findCustomersByCriteria(String column, String value, Integer clientId);

    public List<Customer> findCustomerByCustomerCode(String customerCode);

    public List<Customer> findDuplicateCustomerByCodeAndId(String customerCode, Integer customerId);
}