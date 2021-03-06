<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-book"></i> Booking Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewOrders' />"> Booking List </a></li>
            <li class="active"> New Booking</li>
        </ol>
        <div id="ajaxResponse"></div>
    </div>
</div>

<div class="row">
<div class="col-lg-12">
<div class="panel panel-primary">
<div class="panel-heading">
     <i class="fa fa-book"></i>
    <span class="panel-title">Booking Information</span>
</div>
<div class="panel-body">

<div class="container">

    <div class="row setup-content" id="step-1">
        <div class="col-lg-12">

            <div class="col-lg-12 text-center">

                <div class="well">
                    <fieldset class="inputs">
                        <legend style="text-align: left;">
                            <span >
                                Basic Information
                            </span>
                        </legend>
                        <s:form action="addOrder" theme="bootstrap">

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Freight Type<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="order_freightType"
                                          cssClass="form-control"
                                          style="margin-bottom: 15px !important;"
                                          name="order.freightType"
                                          list="freightTypeList"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                        />

                            </div>
                        </div>

                        <div class="form-group" style="margin-top: 15px;">
                            <label class="col-lg-2 control-label">Service Requirement <span class="asterisk_red"></span> </label>

                            <div class="col-lg-10">

                                <s:select cssClass="form-control"
                                          style="margin-bottom: 15px !important;"
                                          name="order.serviceRequirement"
                                          list="serviceRequirementList"
                                          id="order_serviceRequirement"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Service Mode<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="order_modeOfService"
                                          cssClass="form-control"
                                          style="margin-bottom: 15px !important;"
                                          name="order.modeOfService"
                                          list="modeOfServiceList"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                />

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Payment Mode<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="order_modeOfPayment"
                                          cssClass="form-control step1"
                                          style="margin-bottom: 15px !important;"
                                          name="order.modeOfPayment"
                                          list="modeOfPaymentList"
                                          listKey="key"
                                          listValue="value"
                                          required="true"
                                          emptyOption="true"
                                />

                            </div>
                        </div>

                        <div class="form-group">

                            <label class="col-lg-2 control-label">Customer Name<span class="asterisk_red"></span></label>

                            <div class="col-lg-10">

                                <s:select id="customerName"
                                          cssClass="form-control step1"
                                          style="margin-bottom: 15px !important;"
                                          name="order.customerId"
                                          list="customerList"
                                          listKey="customerId"
                                          listValue="customerName"
                                          emptyOption="true"
                                          required="true"
                                />

                            </div>
                            <%--<div id="ajaxResponse"></div>--%>
                        </div>

                    </fieldset>
                </div>

                <legend style="text-align: left;">
                            <span >
                                Booking Information
                            </span>
                </legend>

                <div class="form-group">

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Date<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >
                        <input type="text" class="from_date form-control step2" id="datepicker1" name="order.pickupDate" required="true" placeholder="Select Pick-up date" contenteditable="false" style="margin-bottom: 15px !important;">

                    </div>

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Date<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >
                        <input type="text" class="to_date form-control step2" id="datepicker2" name="order.deliveryDate" required="true" placeholder="Select Deliver date" contenteditable="false" style="margin-bottom: 15px !important;">
                    </div>

                </div>

                <div class="form-group">

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Origin Port<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >

                        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                  id="select1" name="order.originationPort" list="portsList" listKey="key"
                                  listValue="value" required="true"/>

                    </div>

                    <label class="col-lg-3 control-label" style="margin-top: 5px;">Destination Port<span class="asterisk_red"></span></label>
                    <div class="col-lg-3" >

                        <s:select cssClass="form-control" style="margin-bottom: 15px !important;"
                                  id="select2" name="order.destinationPort" list="portsList" listKey="key"
                                  listValue="value" required="true"/>

                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Notification Type<span class="asterisk_red"></span></label>

                        <div class="col-lg-9" style="text-align:left !important;">
                            <%--<s:select cssClass="form-control step2" style="margin-bottom: 15px !important;"
                                      name="order.notifyBy" list="notifyByList" listKey="key" listValue="value" id ="notification_type"/>--%>
                            <s:checkboxlist list="notifyByList" listKey="key" listValue="value" name="order.notifyBy" id="notifyBy" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Comments </label>

                        <div class="col-lg-9">
                            <s:textarea  name="order.comments" cssClass="form-control" cssStyle="resize: none; margin-bottom: 15px !important; height: 100px;" id="Comments" />
                        </div>
                    </div>

                </div>

                <div id="2ndPartOnLoad" style="clear:both;">

                    <legend style="text-align: left;">
                            <span >
                                Shipper Information
                            </span>
                    </legend>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Contact Person<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">

                                <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;" id="shipperContact" name="order.shipperContactId"
                                          list="contactsList" listKey="contactId" listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
                        </div>

                        <div class="col-lg-2">

                            <div class="pull-right">
                                <a data-toggle="modal" data-target="#createContact"  class="btn btn-info" id="idCustomer"> Add Contact Person</a>
                            </div>

                        </div>

                    </div>

                    <div class="form-group" style="clear: both;">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Pickup Address<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">
                            <s:select cssClass="form-control step2" style="margin-bottom: 15px !important;" id="shipperAddress" name="order.shipperAddressId"
                                      list="addressList" listKey="addressId" listValue="addressLine1 + ' ' + addressLine2" required="true"/>
                        </div>

                        <div class="col-lg-2">

                            <div class="pull-right">
                                <a data-toggle="modal" data-target="#createAddress" class="btn btn-info" id="idAddress" style="width: 151px !important;"> Add Address</a>
                            </div>

                        </div>

                    </div>

                    <legend style="text-align: left;">
                            <span >
                                Consignee Information
                            </span>
                    </legend>

                    <div class="form-group">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Consignee Name<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="shipperConsignee" name="order.consigneeContactId"
                                      list="consigneeList" listKey="contactId"
                                      listValue="firstName +' '+ middleName +' '+ lastName" required="true"/>
                        </div>

                        <div class="col-lg-2">

                            <div class="pull-right">
                                <a data-toggle="modal" data-target="#createConsignee" class="btn btn-info" id="idConsignee" style="width: 151px !important;"> Add Consignee</a>
                            </div>

                        </div>

                    </div>

                    <div class="form-group" style="clear:both;">
                        <label class="col-lg-3 control-label" style="margin-top: 5px;">Delivery Address<span class="asterisk_red"></span></label>

                        <div class="col-lg-7">

                            <%--<s:textfield cssClass="form-control"
                                         name="order.consigneeAddressId"
                                         id="order_consigneeAddressId_textfield"
                                         disabled="true" />--%>
                            <s:select cssClass="form-control" style="margin-bottom: 15px !important;" id="consigneeAddress" name="order.consigneeAddressId"
                                      list="consigneeAddressList" listKey="addressId"
                                      listValue="addressLine1 + ' ' + addressLine2" required="true" />

                        </div>

                    </div>

                <div style="clear: both;">

                </div>

                </div>

            </div>

        </div>
    </div>

</div>

</div>

<div class="panel-footer">

    <div class="pull-right">
        <button type="button" id="Cancel" class="btn" data-toggle="modal" data-target="#cancelBooking">
            Cancel
        </button>

        <s:submit name="submit" cssClass="btn btn-primary" value="Next" />
        </s:form>
    </div>

</div>

</div>
</div>
</div>

<!-- Cancel Booking Modal -->
<div class="modal fade" id="cancelBooking" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Cancel Booking</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to cancel the booking?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <%--<button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>--%>
                <s:property value="order.orderId"/>
                <s:url var="deleteOrderUrl" action="deleteOrder">
                    <s:param name="orderIdParam" value="order.orderId"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{deleteOrderUrl}" rel="tooltip">
                    <button type="button" class="btn btn-primary">Yes</button>
                </s:a>
            </div>
        </div>
    </div>
</div>

<%--start add contact person--%>
<div class="modal fade" id="createContact" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Contact Person</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form action="addCustomerContact" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="contact.referenceId" id="custIdHolder"/>
                      <div class="form-group">
                        <label class="col-lg-3">Last name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Last Name" name="contact.lastName"
                                 id="contact.lastName" required="true" maxLength="30" autofocus="true"
                                 pattern="[a-zA-Z\s ]+"
                                 title="Name should not contain special characters and/or numbers."/>
                        </div>
                      </div>
                       <div class="form-group">
                        <label class="col-lg-3">First Name<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="First Name" name="contact.firstName"
                                     id="contact.firstName" maxLength="30" pattern="[a-zA-Z\s ]+"
                                     title="Name should not contain special characters and/or numbers."
                                     required="true"/>
                            </div>
                       </div>
                     <div class="form-group">
                        <label class="col-lg-3">Middle Name</label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Middle Name" name="contact.middleName"
                                     id="contact.middleName" maxLength="30" pattern="[a-zA-Z\s ]+"
                                     title="Name should not contain special characters and/or numbers."/>
                            </div>
                     </div>
                        <div class="form-group">
                        <label class="col-lg-3">Phone<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.phone"
                                     maxLength="14" required="true" id="contact_phone"
                                     title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">Mobile<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(+639XX)(XXX-XXXX)" name="contact.mobile"
                                     maxLength="19" required="true" id="contact_mobile"
                                     title="(+639XX)(XXX-XXXX) Mobile should not contain special characters and/or letters."/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">Fax</label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="(XXX) XXX-XXXX" name="contact.fax"
                                     maxLength="14" id="contact_fax"
                                     title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">Email<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="email" name="contact.email"
                                     type="email" required="true"/>
                            </div>
                          </div>
                        <div class="form-group">
                        <label class="col-lg-3">Position<span class="asterisk_red"></span></label>
                        <div class="col-lg-9">
                            <s:textfield cssClass="form-control" placeholder="Position" name="contact.position"
                                     type="text" required="true"/>
                            </div>
                        </div>
                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
                </div>
        </div>
    </div>
</div>
<%--end add contact person---%>

<%--START OF MODAL ADD ADDRESS--%>

<div class="modal fade" id="createAddress" role="form" aria-labelledby="myModalLabel2" >
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">Add Address</h4>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                    <s:form action="addCustomerAddress" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="address.referenceId" id="custAddIdHolder"/>
                        <div class="form-group">
                        <label class="col-lg-3">Address Type<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                            <s:select name="address.addressType" list="addressTypeList" listValue="value"
                                      listKey="key"
                                      cssClass="form-control" id="address.addressType" emptyOption="true"/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">Address Line 1<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                            <s:textfield name="address.addressLine1" id="address.addressLine1" cssClass="form-control" required="true"/>
                                </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">Address Line 2</label>
                            <div class="col-lg-9">
                            <s:textfield name="address.addressLine2" id="address.addressLine2" cssClass="form-control"/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">City<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                            <s:textfield name="address.city" id="address.city" cssClass="form-control" required="true"/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">Region</label>
                            <div class="col-lg-9">
                            <s:textfield name="address.state" id="address.state" cssClass="form-control"/>
                            </div>
                            </div>
                        <div class="form-group">
                        <label class="col-lg-3">Zip<span class="asterisk_red"></span></label>
                            <div class="col-lg-9">
                            <s:textfield name="address.zip" id="address.zip" cssClass="form-control" required="true"/>
                        </div>
                            </div>
                </div>
            </div>
            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
                </s:form>
            </div>
        </div>
    </div>
</div>

<%--END OF MODAL ADD ADDRESS--%>

<%--START OF Third modal Consignee--%>

<div class="modal fade" id="createConsignee" role="form" aria-labelledby="myModalLabel3" >
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel3">Add Consignee</h4>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                    <div class="form-group">
                <s:form action="addConsigneeBooking" cssClass="form-horizontal" theme="bootstrap">
                    <s:hidden name="consignee.referenceId1" id="consigneeAddIdHolder"/>
                    <div class="form-group">
                    <label class="col-lg-3">First name<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                  <s:textfield name="consignee.firstName" cssClass="form-control" id="consignee.firstName"
                                 placeholder="First Name" maxLength="30" autofocus="true" required="true"
                                 pattern="[a-zA-Z\s ]+"
                                 title="Name should not contain special characters and/or numbers."/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Middle Name</label>
                    <div class="col-lg-9">
                  <s:textfield name="consignee.middleName" cssClass="form-control"
                                 id="consignee.middleName"
                                 placeholder="Middle Name" maxLength="30" pattern="[a-zA-Z\s ]+"
                                 title="Name should not contain special characters and/or numbers."/>
                        </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Last Name<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                  <s:textfield name="consignee.lastName" cssClass="form-control" id="consignee.lastName"
                                 placeholder="Last Name" maxLength="30" required="true"
                                 pattern="[a-zA-Z\s ]+"
                                 title="Name should not contain special characters and/or numbers."/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Phone<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                  <s:textfield name="consignee.phone" cssClass="form-control" id="consignee_phone"
                                 placeholder="(XXX) XXX-XXXX" maxLength="14" required="true"
                                  title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Mobile<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                  <s:textfield name="consignee.mobile" cssClass="form-control" id="consignee_mobile"
                                 placeholder="(+639XX) (XXX-XXXX)" maxLength="19" required="true"
                                 title="(+639XX) (XXX-XXXX) Mobile should not contain special characters and/or letters."/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Email<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                  <s:textfield name="consignee.email" cssClass="form-control" id="consignee.email"
                                 placeholder="Email Address" type="email" required="true" maxLength="50"
                                 pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Fax</label>
                    <div class="col-lg-9">
                    <s:textfield name="consignee.fax" cssClass="form-control" id="consignee_fax"
                                 placeholder="(XXX) XXX-XXXX" maxLength="14"
                                  title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters."/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Address<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                    <s:textfield name="consignee.addressLine1" cssClass="form-control"
                                 id="consignee.addressLine1" placeholder="Address 1" required="true"
                                 maxLength="50"/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Address Line 2</label>
                    <div class="col-lg-9">
                    <s:textfield name="consignee.addressLine2" cssClass="form-control"
                                 id="consignee.addressLine2" placeholder="Address 2" maxLength="50"/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">City<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                    <s:textfield name="consignee.city" cssClass="form-control"
                                 id="consignee.city" placeholder="City" required="true"
                                 pattern="[a-zA-Z ]+" maxLength="50"
                                 title="City should not contain special characters and/or numbers."/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Region</label>
                    <div class="col-lg-9">
                    <s:textfield name="consignee.state" cssClass="form-control"
                                 id="consignee.state" placeholder="Region" maxLength="50" pattern="[a-zA-Z ]+"
                                 title="State should not contain special characters and/or numbers."/>
                    </div>
                        </div>
                    <div class="form-group">
                    <label class="col-lg-3">Zip<span class="asterisk_red"></span></label>
                    <div class="col-lg-9">
                    <s:textfield name="consignee.zip" cssClass="form-control"
                                 id="consignee.zip" placeholder="ZIP" required="true"
                                 pattern="[0-9]+" maxLength="4"
                                 title="ZIP should not contain special characters and/or letters."/>
                    </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>
<%--END OF Third modal Consignee--%>

<%--alert modals--%>

<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertlabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>--%>
                <center><h4 class="modal-title" id="alertlabel"><li class="fa fa-info"/> Warning</h4></center>
            </div>
            <div class="modal-body">
                <center><p>Select a Customer first</p></center>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>

            </div>
        </div>
    </div>
</div>



<script type="text/javascript">


$(document).ready(function() {

    // Customer Dropdown
    $('#customerName').change(function(event) {
        var custId = $("#customerName").val();
        /*alert(custId);*/

        $.getJSON('customerAction', {
            customerID : custId
        },
            function(jsonResponse) {
               /* alert(jsonResponse.dummyMsg);*/

            $('#ajaxResponse').text(jsonResponse.dummyMsg);

            var select = $('#shipperContact');

            select.find('option').remove();

            var select2 = $('#shipperAddress');

            select2.find('option').remove();

            var select3 = $('#shipperConsignee');

            select3.find('option').remove();

            var select4 = $('#consigneeAddress');

            select4.find('option').remove();

            // populate customer contacts list
            $.each(jsonResponse.customerContactsMap, function(key, value) {

                $('<option>').val(key).text(value).appendTo(select);

            });
            // populate customer address list
            $.each(jsonResponse.customerAddressMap, function(key, value) {

                if($("#order_modeOfService").val() == 'DOOR TO PIER') {
                    $("#shipperAddress").prop('disabled', false);
                    $("#consigneeAddress").prop('disabled', true);
                    $('<option>').val(key).text(value).appendTo(select2);
                }else if ($("#order_modeOfService").val() == 'PIER TO DOOR') {
                    $("#shipperAddress").prop('disabled', true);
                    $("#consigneeAddress").prop('disabled', false);
                }else if ($("#order_modeOfService").val() == 'PIER TO PIER'){
                    $("#consigneeAddress").prop('disabled', true);
                    $("#shipperAddress").prop('disabled', true);
                }else if ($("#order_modeOfService").val() == 'PICKUP') {
                    $("#shipperAddress").prop('disabled', false);
                    $("#consigneeAddress").prop('disabled', true);
                    $('<option>').val(key).text(value).appendTo(select2);
                }else if ($("#order_modeOfService").val() == 'DELIVERY'){
                    $("#consigneeAddress").prop('disabled', false);
                    $("#shipperAddress").prop('disabled', true);
                }else{
                    $("#shipperAddress").prop('disabled', false);
                    $("#consigneeAddress").prop('disabled', false);
                    $('<option>').val(key).text(value).appendTo(select2);
                }

            });
            // populate customer consignee list
            $.each(jsonResponse.customerConsigneeMap, function(key, value) {

                $('<option>').val(key).text(value).appendTo(select3);
            });

            // populate customer consignee address list
            $.each(jsonResponse.consigneeAddressMap, function(key, value) {

                if($("#consigneeAddress").val() != ''){
                    if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER' || $("#order_modeOfService").val() == 'DELIVERY'){
                        $('<option>').val(null).text("").appendTo(select4);
                    }
                    $('<option>').val(key).text(value).appendTo(select4);
                }else{
                    $('<option>').val(key).text(value).appendTo(select4);
                }

                var consignAdd = $("#consigneeAddress").val();
                document.getElementById("order_consigneeAddressId_textfield").value = consignAdd;

            });

        });

    });

    //Consignee on Select
    $('#shipperConsignee').change(function(event) {
        var custId = $("#customerName").val();
        var consignee_Id = $("#shipperConsignee").val();

        $.getJSON('consigneeAction', {
            customerID : custId,
            consigneeId : consignee_Id
        },
        function(jsonResponse) {
            /*alert(consignee_Id);*/
        var select4 = $('#consigneeAddress');

        select4.find('option').remove();

        // populate consignee address
        $.each(jsonResponse.consigneeAddressMap, function(key, value) {

            if($("#order_modeOfService").val() == 'DOOR TO DOOR' || $("#order_modeOfService").val() == 'PIER TO DOOR' || $("#order_modeOfService").val() == 'PICKUP' || $("#order_modeOfService").val() == 'DELIVERY' || $("#order_modeOfService").val() == 'INTER-WAREHOUSE' ) {

                if ($("#shipperConsignee").val() != '') {
                    $('<option>').val(key).text(value).appendTo(select4);
                } else {
                    if ($("#consigneeAddress").val() != '') {
                        $('<option>').val(null).text("").appendTo(select4);
                    }
                    $('<option>').val(key).text(value).appendTo(select4);
                }

            }
        });

        });

    });

    //Consignee Address on Select
    $('#consigneeAddress').change(function(event) {
        var custId = $("#customerName").val();
        var address_Id = $("#consigneeAddress").val();
        /*alert(address_Id);*/
        $.getJSON('addressAction', {
            customerID : custId,
            addressId: address_Id
        },
            function (jsonResponse) {
                /*alert(address_Id);*/
                var select3 = $('#shipperConsignee');

                select3.find('option').remove();

                // populate consignee field
                $.each(jsonResponse.customerConsigneeMap, function (key, value) {

                    if($("#consigneeAddress").val() != ''){
                        $('<option>').val(key).text(value).appendTo(select3);
                    }else{
                        if($("#shipperConsignee").val() != ''){
                            $('<option>').val(null).text("").appendTo(select3);
                        }
                        $('<option>').val(key).text(value).appendTo(select3);
                    }

                });

            });

    });

    // Date Time Picker
    var fromDatePickUp = $('#datepicker1');
    var toDateDelivery = $('#datepicker2');

    //pick up date validation
    fromDatePickUp.datepicker({

        // on 5:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {

            if (toDateDelivery.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    toDateDelivery.datetimepicker('setDate', testStartDate);

                }

            else {
                toDateDelivery.val(dateText);
                }
            },

        onSelect: function (selectedDateTime){
            toDateDelivery.datetimepicker('option', 'minDate', fromDatePickUp.datetimepicker('getDate') );
            }

    });

    // delivery date validation -jp
    toDateDelivery.datepicker({

        // on 6:00pm
        timeFormat: 'h:mm TT',
        minDate: 0,
        onClose: function(dateText, inst) {

            if (fromDatePickUp.val() != '') {
                var testStartDate = fromDatePickUp.datetimepicker('getDate');
                var testEndDate = toDateDelivery.datetimepicker('getDate');

                if (testStartDate > testEndDate)
                    fromDatePickUp.datetimepicker('setDate', testEndDate);

                }

            else {
                fromDatePickUp.val(dateText);
                }
            },

        onSelect: function (selectedDateTime){
            fromDatePickUp.datetimepicker('option', 'maxDate', toDateDelivery.datetimepicker('getDate') );
            }

        });

});
    // For Service Mode Dropdown selection

    function dynamicDropdown(select, index) {

    var opt = select.options,
            lent = opt.length;

    while ( lent-- ){
        opt[ lent ].disabled = false;
    }

        if (select.options[ index ].value === 'DOOR TO PIER'){

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").val('');
            $("#consigneeAddress").prop('disabled', true);

        }else if (select.options[ index ].value === 'PIER TO DOOR'){

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', true);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');

        }else {

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');
        }

//        if Pickup was selected
        if (select.options[index].value === 'PICKUP'){

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', false);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").val('');
            $("#consigneeAddress").prop('disabled', true);
        }else if (select.options[index].value === 'DELIVERY'){

            $("#customerName").val('');
            $("#shipperContact").val('');
            $("#shipperAddress").prop('disabled', true);
            $("#shipperAddress").val('');
            $("#shipperConsignee").val('');
            $("#consigneeAddress").prop('disabled', false);
            $("#consigneeAddress").val('');

        }




    // If Service Mode is Pier to Pier
    if (select.options[ index ].value === 'PIER TO PIER') {

        for (var i = 0; i < sType.options.length; i++){
            /*if(sType.options[i].value != "SHIPPING"){
                sType.options[i].disabled = true;
            }else{
                sType.options[i].disabled = false;
                sType.options[i].selected = true;
            }*/
            if(sType.options[i].value == "SHIPPING"){
                sType.options[i].disabled = false;
                sType.options[i].selected = true;
            }
        }

        $("#customerName").val('');
        $("#shipperContact").val('');
        $("#shipperAddress").prop('disabled', true);
        $("#shipperAddress").val('');
        $("#shipperConsignee").val('');
        $("#consigneeAddress").prop('disabled', true);
        $("#consigneeAddress").val('');

    }else{
        for (var i = 0; i < sType.options.length; i++){
            /*if(sType.options[i].value != "SHIPPING"){
             sType.options[i].disabled = true;
             }else{
             sType.options[i].disabled = false;
             sType.options[i].selected = true;
             }*/
            if(sType.options[i].value == "SHIPPING AND TRUCKING"){
                sType.options[i].disabled = false;
//                sType.options[i].selected = true;
            }
        }
    }

    // If Service Type is Shipping
    if (select.options[ index ].value === 'SHIPPING'){
        $("#select1").val('');
        $("#select2").val('');
        for (var i = 0; i < sMode.options.length; i++){
            /*$("#order_modeOfService").val('');*/
            if(sMode.options[i].value == "PIER TO PIER"){
                sMode.options[i].style.display = "block";
                sMode.options[i].selected = true;
            }else{
                sMode.options[i].style.display = "none";
            }
        }

        for (var i = 0; i < sReq.options.length; i++){
            $("#order_serviceRequirement").val('');
            if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                sReq.options[i].style.display = "none";
            }else{
                sReq.options[i].style.display = "block";
            }
        }

        }
    // If Service Type is Shipping and Trucking
    if (select.options[ index ].value === 'SHIPPING AND TRUCKING') {
        $("#select1").val('');
        $("#select2").val('');
        $("#order_modeOfService").val('');
            for (var i = 0; i < sMode.options.length; i++) {
                $("#order_modeOfService").val('');
                if(sMode.options[i].value == "DOOR TO DOOR" || sMode.options[i].value == "DOOR TO PIER" || sMode.options[i].value == "PIER TO DOOR"){
                    sMode.options[i].style.display = "block";
                }else{
                    sMode.options[i].style.display = "none";
                }
            }

            for (var i = 0; i < sReq.options.length; i++){
                $("#order_serviceRequirement").val('');
                if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                    sReq.options[i].style.display = "none";
                }else{
                    sReq.options[i].style.display = "block";
                    }
            }



        }
    // If Service Type is Trucking
    if (select.options[ index ].value === 'TRUCKING'){
        $("#select1").val('');
        $("#select2").val('');
        for (var i = 0; i < sMode.options.length; i++){
            $("#order_modeOfService").val('');
            if(sMode.options[i].value == "PICKUP" || sMode.options[i].value == "DELIVERY" || sMode.options[i].value == "INTER-WAREHOUSE"){
                sMode.options[i].style.display = "block";
            }else{
                sMode.options[i].style.display = "none";
            }
        }

        for (var i = 0; i < sReq.options.length; i++){
            $("#order_serviceRequirement").val('');
            if(sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD"){
                sReq.options[i].style.display = "block";
            }else{
                sReq.options[i].style.display = "none";
            }
        }

    }

    }

    var sReq = select = document.getElementById('order_serviceRequirement');
    var sType = select = document.getElementById('order_freightType');
    var sMode = select = document.getElementById('order_modeOfService');


    $( window ).load(function() {
        //sets local storage data
        setThis();

        //prevents from loading different dropdown values if Trucking is selected as requirement
        for (var i = 0; i < sMode.options.length; i++) {
            if (document.getElementById('order_freightType').value != "TRUCKING") {
                if (sMode.options[i].value == "PICKUP" || sMode.options[i].value == "DELIVERY" || sMode.options[i].value == "INTER-WAREHOUSE") {
                    sMode.options[i].style.display = "none";
                } else {
                    sMode.options[i].style.display = "block";
                }
            }else{
                if (sMode.options[i].value == "PICKUP" || sMode.options[i].value == "DELIVERY" || sMode.options[i].value == "INTER-WAREHOUSE") {
                    sMode.options[i].style.display = "block";
                } else {
                    sMode.options[i].style.display = "none";
                }
            }
         }



        for (var i = 0; i < sReq.options.length; i++) {
            if (document.getElementById('order_freightType').value != "TRUCKING") {
                if (sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD") {
                    sReq.options[i].style.display = "none";
                } else {
                    sReq.options[i].style.display = "block";
                }
            }else{
                if (sReq.options[i].value == "FULL TRUCK LOAD" || sReq.options[i].value == "LESS TRUCK LOAD") {
                    sReq.options[i].style.display = "block";
                } else {
                    sReq.options[i].style.display = "none";
                }

            }
        }
    });

    sReq.onchange = function() {
        dynamicDropdown.call(this, sReq ,this.selectedIndex);
    };

    sType.onchange = function() {
        dynamicDropdown.call(this, sType ,this.selectedIndex);
    };

    sMode.onchange = function() {
        dynamicDropdown.call(this, sMode, this.selectedIndex);
    };


// Avoid selecting duplicate ports

    function preventDuplicatePort(select, index) {

        var options = select.options,
                len = options.length;
        var fType = $('#order_freightType').val();
        /*alert(fType);*/
        /*will only warn duplicate ports if not trucking service type*/
        if(fType != "TRUCKING") {
            while ( len-- ){
                options[ len ].disabled = false;
            }

            select.options[ index ].disabled = true;

            if (index === select.selectedIndex) {
                alert('You already selected the same port "' + select.options[index].text + '". Please choose another');
                this.selectedIndex = 0;
                select2.value = '';
            }
        }

    }

    var select1 = select = document.getElementById('select1');
    var select2 = select = document.getElementById('select2');

    select2.value = '';

    select1.onchange = function () {
        preventDuplicatePort.call(this, select2, this.selectedIndex);
    };

    select2.onchange = function () {
        preventDuplicatePort.call(this, select1, this.selectedIndex);
    };

//to get the customer id
$(document).ready(function(){
    $("#idCustomer").click(function(){
        var custId = $("#customerName").val();
        getThis();
        if (custId == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
           return false;
        }
      $("#custIdHolder").val(custId);
    });
});

$(document).ready(function(){
    $("#idAddress").click(function(){
        var custId1 = $("#customerName").val();
        getThis();
        if (custId1 == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
            return false;
        }
        $("#custAddIdHolder").val(custId1);
    });
});

$(document).ready(function(){
    $("#idConsignee").click(function(){
        var custId2 = $("#customerName").val();
        getThis();
        if (custId2 == "" || null ){
            alert("Select Customer First");
            $("#customerName").focus();
            return false;
        }
        $("#consigneeAddIdHolder").val(custId2);
    });
});

function getThis(){
    var ServiceReqField = $("#order_serviceRequirement").val();
    var ServiceModeField =$("#order_modeOfService").val();
    var FreightTypeField = $("#order_freightType").val();
    var PaymentModeField = $("#order_modeOfPayment").val();
    var CustNameField = $("#customerName").val();
    var Pickdatefield = $("#datepicker1").val();
    var Deldatefield = $("#datepicker2").val();
    var OriginPortField = $("#select1").val();
    var DestinationPortField = $("#select2").val();
    var NotificationField = $("#notification_type").val();
    var CommentsField = $("#Comments").val();

    localStorage.setItem("ServiceReqField",ServiceReqField);
    localStorage.setItem("ServiceModeField",ServiceModeField);
    localStorage.setItem("FreightTypeField",FreightTypeField);
    localStorage.setItem("PaymentModeField",PaymentModeField);
    localStorage.setItem("CustNameField", CustNameField);
    localStorage.setItem("Pickdatefield",Pickdatefield);
    localStorage.setItem("Deldatefield",Deldatefield);
    localStorage.setItem("OriginPortField",OriginPortField);
    localStorage.setItem("DestinationPortField",DestinationPortField);
    localStorage.setItem("NotificationField",NotificationField);
    localStorage.setItem("CommentsField",CommentsField);

}
function setThis()
{
    $("#order_serviceRequirement").val(localStorage.getItem("ServiceReqField"));
    $("#order_modeOfService").val(localStorage.getItem("ServiceModeField"));
    $("#order_freightType").val(localStorage.getItem("FreightTypeField"));
    $("#order_modeOfPayment").val(localStorage.getItem("PaymentModeField"));
    $("#customerName").val(localStorage.getItem("CustNameField"));
    $("#datepicker1").val(localStorage.getItem("Pickdatefield"));
    $("#datepicker2").val(localStorage.getItem("Deldatefield"));
    $("#select1").val(localStorage.getItem("OriginPortField"));
    $("#select2").val(localStorage.getItem("DestinationPortField"));
    $("#notification_type").val(localStorage.getItem("NotificationField"));
    $("#Comments").val(localStorage.getItem("CommentsField"));
}

$(document).ready(function(){
    $(window).load(function(){
//        sets the form values
        var custId = $("#customerName").val();

        $.getJSON('customerAction', {
                    customerID : custId
                },
                function(jsonResponse) {
                    /*alert(jsonResponse.dummyMsg);*/

//                    $('#ajaxResponse').text(jsonResponse.dummyMsg);

                    var select = $('#shipperContact');

                    select.find('option').remove();

                    var select2 = $('#shipperAddress');

                    select2.find('option').remove();

                    var select3 = $('#shipperConsignee');

                    select3.find('option').remove();

                    var select4 = $('#consigneeAddress');

                    select4.find('option').remove();

                    // populate customer consignee list
                    $.each(jsonResponse.customerContactsMap, function(key, value) {

                        $('<option>').val(key).text(value).appendTo(select);

                    });
                    // populate customer address list
                    $.each(jsonResponse.customerAddressMap, function(key, value) {

                        if($("#order_modeOfService").val() == 'DOOR TO PIER') {
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }else if ($("#order_modeOfService").val() == 'PIER TO DOOR') {
                            $("#shipperAddress").prop('disabled', true);
                            $("#consigneeAddress").prop('disabled', false);
                        }else if ($("#order_modeOfService").val() == 'PIER TO PIER'){
                            $("#consigneeAddress").prop('disabled', true);
                            $("#shipperAddress").prop('disabled', true);
                        }else if ($("#order_modeOfService").val() == 'PICKUP') {
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', true);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }else if ($("#order_modeOfService").val() == 'DELIVERY'){
                            $("#consigneeAddress").prop('disabled', false);
                            $("#shipperAddress").prop('disabled', true);
                        }else{
                            $("#shipperAddress").prop('disabled', false);
                            $("#consigneeAddress").prop('disabled', false);
                            $('<option>').val(key).text(value).appendTo(select2);
                        }

                    });
                    // populate customer consignee list
                    $.each(jsonResponse.customerConsigneeMap, function(key, value) {
                        //alert($("#shipperConsignee").val());

                        if($("#shipperConsignee").val() != ''){
                            //$('<option>').val(null).text("").appendTo(select3);
                            $('<option>').val(key).text(value).appendTo(select3);
                        }else{
                            $('<option>').val(key).text(value).appendTo(select3);
                        }
                    });

                    // populate customer address list
                    $.each(jsonResponse.consigneeAddressMap, function(key, value) {
                        /*alert($("#consigneeAddress").val());*/

                        if($("#consigneeAddress").val() != ''){
                            if($("#order_modeOfService").val() == 'PIER TO PIER' || $("#order_modeOfService").val() == 'DOOR TO PIER' ||  $("#order_modeOfService").val() == 'DELIVERY'){
                                $('<option>').val(null).text("").appendTo(select4);
                            }
                            $('<option>').val(key).text(value).appendTo(select4);
                        }else{
                            $('<option>').val(key).text(value).appendTo(select4);
                        }
                    });
                });

        localStorage.clear();
    });
});

/*Mask input fields*/
$(document).ready(function(){
    $("#contact_phone").mask("(999) 999-9999");
    $("#contact_mobile").mask("(+63999)(999-9999)");
    $("#contact_fax").mask("(999) 999-9999");
    $("#consignee_phone").mask("(999) 999-9999");
    $("#consignee_mobile").mask("(+63999)(999-9999)");
    $("#consignee_fax").mask("(999) 999-9999");
});

</script>