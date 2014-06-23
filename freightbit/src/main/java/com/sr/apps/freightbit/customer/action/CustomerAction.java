package com.sr.apps.freightbit.customer.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.customer.formbean.ItemBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.common.service.ParameterService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class CustomerAction extends ActionSupport implements Preparable {

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(CustomerAction.class);

    private List<CustomerBean> customers = new ArrayList<CustomerBean>();
    private List<AddressBean> addresss = new ArrayList<AddressBean>();
    private List<ItemBean> items = new ArrayList<ItemBean>();

    private List<Parameters> customerTypeList = new ArrayList<Parameters>();
    private List<Parameters> customerSearchList = new ArrayList<Parameters>();
    private List<Parameters> addressTypeList = new ArrayList<Parameters>();

    private Integer customersItemIdParam;
    private String customerCodeParam;
    private Integer addressIdParam;
    private String keyword; //search keyword for customer
    private String searchType; // get the search type
    private String customerKeyword;

    private CustomerBean customer = new CustomerBean();
    private ItemBean item = new ItemBean();
    private AddressBean address = new AddressBean();

    private CustomerService itemService;
    private CustomerService customerService;
    private ClientService clientService;
    private ParameterService parameterService;

    @Override
    public void prepare() {
        addressTypeList = parameterService.getParameterMap(ParameterConstants.ADDRESS_TYPE);
        customerTypeList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_TYPE);
        customerSearchList = parameterService.getParameterMap(ParameterConstants.CUSTOMER_SEARCH);
    }

    public Integer getCustomerSessionId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer customerId = (Integer) sessionAttributes.get("customerId");
        return customerId;
    }


    ////// START OF ITEMS ///////////////

    public String customerEditItem(){

        Items itemEntity = itemService.findItemByCustomerItemsId(customersItemIdParam);
        item = transformItemToFormBean(itemEntity);

        return  SUCCESS;
    }
    public String customerAddItems() {

        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer customerId = (Integer) sessionAttributes.get("customerId");

        List<Items> itemEntityList = itemService.findItemByCustomerId(customerId);
        for (Items itemElem : itemEntityList) {
            items.add(transformItemToFormBean(itemElem));
        }

        return SUCCESS;
    }

    public String customerEditItemExecute(){
        itemService.updateItems(transformItemToEntityBean(item));
        return SUCCESS;
    }
    public String customerDeleteItemExecute() {

        Items itemEntity = itemService.findItemByCustomerItemsId(customersItemIdParam);
        itemService.deleteItem(itemEntity);
        return SUCCESS;
    }

    public String customerAddItemExecute() throws Exception {
        itemService.addItem(transformItemToEntityBean(item));
        return SUCCESS;
    }

    //////////// END OF ITEMS //////////////


    public String customerSearch() {
        return SUCCESS;
    }

    public String customerInfo() {
        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customer = transformToFormBean(customerEntity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("customerId", customer.getCustomerId());

        return SUCCESS;

    }


    ////// START OF CUSTOMER ///////////////

    public String loadAddCustomerPage() {
        return SUCCESS;
    }

    public String loadEditCustomerPage() {
        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customer = transformToFormBean(customerEntity);
        return SUCCESS;
    }

    public String loadSaveCompletePage() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        return SUCCESS;
    }

    public String customerSearchExecute() {
        String column = getColumnFilter();
        List<Customer> customerEntityList = new ArrayList<Customer>();

        if (StringUtils.isNotBlank(column)) {
            customerEntityList = customerService.findCustomersByCriteria(column, customer.getCustomerKeyword(), getClientId());

        } else {
            customerEntityList = customerService.findAllCustomer();
        }

        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }

        return SUCCESS;
    }

    public String getColumnFilter() {
        String column = "";
        if ("customerName".equals(customer.getCustomerSearchCriteria())) {
                column = "customerName";
        } else if ("customerCode".equals(customer.getCustomerSearchCriteria())) {
                column = "customerCode";
        } else if ("customerType".equals(customer.getCustomerSearchCriteria())) {
                column = "customerType";
        } else if ("email".equals(customer.getCustomerSearchCriteria())) {
                column = "email";
        }
        return column;
    }

    public String customerDeleteExecute() {

        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customerService.deleteCustomer(customerEntity);
        return SUCCESS;
    }

    public String customerEdit() {

        Customer customerEntity = customerService.findCustomerByCustomerCode(customerCodeParam);
        customer = transformToFormBean(customerEntity);
        return SUCCESS;
    }

    public String customerEditExecute() {
        validateOnSubmit(customer);
        if (hasActionErrors())
            return INPUT;
        customerService.updateCustomer(transformToEntityBean(customer));
        return SUCCESS;

    }

    public String customerAdd() {
        return SUCCESS;
    }

    public String customerAddExecute() throws Exception {
        validateOnSubmit(customer);
        if (hasFieldErrors())
            return INPUT;
        Integer customerId = customerService.addCustomer(transformToEntityBean(customer));
        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("customerId", customerId);

        return SUCCESS;
    }

    public String customerList() {
        List<Customer> customerEntityList = customerService.findAllCustomer();
        for (Customer customerElem : customerEntityList) {
            customers.add(transformToFormBean(customerElem));
        }
        return SUCCESS;
    }

    ////// END OF ITEMS ///////////////

    //address
    public String addAddress() throws Exception{
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.addAddress(transformToEntityBeanAddress(address));
        return SUCCESS;
    }

    public String editAddress() {
        validateOnSubmitAddress(address);
        if (hasFieldErrors()) {
            return INPUT;
        }
        customerService.updateAddress(transformToEntityBeanAddress(address));
        return SUCCESS;
    }

    public String deleteAddress() {
        Address addressEntity = customerService.findAddressById(addressIdParam);
        customerService.deleteAddress(addressEntity);
        return SUCCESS;
    }

    public String loadAddAddress() {
        return SUCCESS;
    }

    public String loadSaveCompleteAddress() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressEntityList = new ArrayList<Address>();
        addressEntityList = customerService.findAllAddressByRefId(customerId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }
        return SUCCESS;
    }

    public String loadEditAddress() {
        Address addressEntity = customerService.findAddressById(addressIdParam);
        address = transformToFormBeanAddress(addressEntity);
        return SUCCESS;
    }

    public String viewAddress() {
        Integer customerId = getCustomerSessionId();
        List<Address> addressEntityList = new ArrayList<Address>();
        addressEntityList = customerService.findAllAddressByRefId(customerId);
        for (Address addressElem : addressEntityList) {
            addresss.add(transformToFormBeanAddress(addressElem));
        }
        return SUCCESS;
    }

    public void validateOnSubmitAddress(AddressBean addressBean) {
        clearErrorsAndMessages();
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getAddressLine1())) {
            addFieldError("address.addressLine1", getText("err.addressLine1.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getCity())) {
            addFieldError("address.city", getText("err.city.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getState())) {
            addFieldError("address.state", getText("err.state.required"));
        }
        if (org.apache.commons.lang.StringUtils.isBlank(addressBean.getZip())) {
            addFieldError("address.zip", getText("err.zip.required"));
        }
    }

    public AddressBean transformToFormBeanAddress(Address entity) {
        AddressBean formBean = new AddressBean();

        formBean.setAddressId(entity.getAddressId());
        formBean.setReferenceId(entity.getReferenceId());
        formBean.setReferenceTable(entity.getReferenceTable());
        formBean.setAddressLine1(entity.getAddressLine1());
        formBean.setAddressLine2(entity.getAddressLine2());
        formBean.setAddressType(entity.getAddressType());
        formBean.setCity(entity.getCity());
        formBean.setState(entity.getState());
        formBean.setZip(entity.getZip());
        return formBean;
    }

    public Address transformToEntityBeanAddress(AddressBean formBean) {
        Address entity = new Address();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClientId(client);

        if (formBean.getAddressId() != null) {
            entity.setAddressId(formBean.getAddressId());
        }

        Integer customerId = getCustomerSessionId();

        entity.setReferenceTable("CUSTOMER");
        entity.setReferenceId(customerId);
        entity.setAddressLine1(formBean.getAddressLine1());
        entity.setAddressLine2(formBean.getAddressLine2());
        entity.setAddressType(formBean.getAddressType());
        entity.setCity(formBean.getCity());
        entity.setState(formBean.getState());
        entity.setZip(formBean.getZip());
        entity.setCreatedTimestamp(new Date());
        entity.setCreatedBy("admin");
        entity.setModifiedTimestamp(new Date());
        entity.setModifiedBy("admin");

        return entity;
    }


    //utils
    public Integer getSessionCustomerId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer customerId = (Integer) sessionAttributes.get("customerId");

        return customerId;
    }

    //items


    public ItemBean transformItemToFormBean(Items entity) {

        ItemBean formBean = new ItemBean();
        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerItemsId(entity.getCustomerItemsId());
        formBean.setCriticalQuality(entity.getCriticalQuality());
        formBean.setItemCode(entity.getItemCode());
        formBean.setItemName(entity.getItemName());
        formBean.setSrp(entity.getSrp());
        formBean.setLength(entity.getLength());
        formBean.setWidth(entity.getWidth());
        formBean.setHeight(entity.getHeight());
        formBean.setBasePrice(entity.getBasePrice());
        formBean.setNote(entity.getNote());
        formBean.setDescription(entity.getDescription());

        return formBean;

    }

    public Items transformItemToEntityBean(ItemBean formBean) {

        Items entity = new Items();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);

        if (formBean.getCustomerItemsId() != null)
            entity.setCustomerItemsId(new Integer(formBean.getCustomerItemsId()));

        entity.setItemName(formBean.getItemName());
        entity.setItemCode(formBean.getItemCode());
        entity.setCustomerId(getCustomerSessionId());
        entity.setSrp(formBean.getSrp());
        entity.setLength(formBean.getLength());
        entity.setWidth(formBean.getWidth());
        entity.setHeight(formBean.getHeight());
        entity.setCriticalQuality(formBean.getCriticalQuality());
        entity.setBasePrice(formBean.getBasePrice());
        entity.setNote(formBean.getNote());
        entity.setDescription(formBean.getDescription());
        entity.setCreatedBy(getClientId().toString());
        entity.setModifiedBy(getClientId().toString());

        return entity;
    }


    private CustomerBean transformToFormBean(Customer entity) {

        CustomerBean formBean = new CustomerBean();
        formBean.setCustomerId(entity.getCustomerId());
        formBean.setCustomerCode(entity.getCustomerCode());
        formBean.setCustomerName(entity.getCustomerName());
        formBean.setCustomerType(entity.getCustomerType());
        formBean.setPhone(entity.getPhone());
        formBean.setEmail(entity.getEmail());
        formBean.setWebsite(entity.getWebsite());
        formBean.setFax(entity.getFax());
        formBean.setMobile(entity.getMobile());

        return formBean;
    }

    private Customer transformToEntityBean(CustomerBean formBean) {
        Customer entity = new Customer();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        if (formBean.getCustomerId() != null)
            entity.setCustomerId(new Integer(formBean.getCustomerId()));
        entity.setCustomerName(formBean.getCustomerName());
        entity.setCustomerCode(formBean.getCustomerCode());
        entity.setCustomerType(formBean.getCustomerType());
        entity.setWebsite(formBean.getWebsite());
        entity.setPhone(formBean.getPhone());
        entity.setMobile(formBean.getMobile());
        entity.setFax(formBean.getFax());
        entity.setEmail(formBean.getEmail());
        entity.setCreatedBy(getClientId().toString());
        entity.setModifiedBy(getClientId().toString());

        return entity;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public void validateOnSubmit(CustomerBean customerBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(customerBean.getCustomerName())) {
            addFieldError("customer.customerName", getText("err.customerName.required"));
        }
        if (StringUtils.isBlank(customerBean.getPhone())) {
            addFieldError("customer.phone", getText("err.phone.required"));
        }
        if (StringUtils.isBlank(customerBean.getMobile())) {
            addFieldError("customer.mobile", getText("err.mobile.required"));
        }
        if (StringUtils.isBlank(customerBean.getEmail())) {
            addFieldError("customer.email", getText("err.email.required"));
        }
    }


    public Integer getCustomersItemIdParam() {
        return customersItemIdParam;
    }

    public void setCustomersItemIdParam(Integer customersItemIdParam) {
        this.customersItemIdParam = customersItemIdParam;
    }

    public void setItemService(CustomerService itemService) {
        this.itemService = itemService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public List<CustomerBean> getCustomers() {
        return customers;
    }

    public void setCustomers(List<CustomerBean> customers) {
        this.customers = customers;
    }

    public List<ItemBean> getItems() {
        return items;
    }

    public void setItems(List<ItemBean> items) {
        this.items = items;
    }

    public List<Parameters> getCustomerTypeList() {
        return customerTypeList;
    }

    public void setCustomerTypeList(List<Parameters> customerTypeList) {
        this.customerTypeList = customerTypeList;
    }

    public List<Parameters> getCustomerSearchList() {
        return customerSearchList;
    }

    public void setCustomerSearchList(List<Parameters> customerSearchList) {
        this.customerSearchList = customerSearchList;
    }

    public String getCustomerCodeParam() {
        return customerCodeParam;
    }

    public void setCustomerCodeParam(String customerCodeParam) {
        this.customerCodeParam = customerCodeParam;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public CustomerBean getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerBean customer) {
        this.customer = customer;
    }

    public ItemBean getItem() {
        return item;
    }

    public void setItem(ItemBean item) {
        this.item = item;
    }

    public String getCustomerKeyword() {
        return customerKeyword;
    }

    public void setCustomerKeyword(String customerKeyword) {
        this.customerKeyword = customerKeyword;
    }

    public AddressBean getAddress() {
        return address;
    }

    public void setAddress(AddressBean address) {
        this.address = address;
    }

    public List<AddressBean> getAddresss() {
        return addresss;
    }

    public void setAddresss(List<AddressBean> addresss) {
        this.addresss = addresss;
    }

    public Integer getAddressIdParam() {
        return addressIdParam;
    }

    public void setAddressIdParam(Integer addressIdParam) {
        this.addressIdParam = addressIdParam;
    }

    public List<Parameters> getAddressTypeList() {
        return addressTypeList;
    }

    public void setAddressTypeList(List<Parameters> addressTypeList) {
        this.addressTypeList = addressTypeList;
    }
}