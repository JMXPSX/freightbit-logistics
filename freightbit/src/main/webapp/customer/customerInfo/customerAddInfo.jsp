<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-male"></i> Customer Module</h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"> Customer</li>
            <li class="active"><a href="<s:url action='customerList' />"> Customer List </a></li>
            <li class="active"> Add Customer</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-plus"></i> Add Customer</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive list-table">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addCustomer">

                        <div class="col-lg-12">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px !important; margin-top: 0px !important;">Company Name / Customer Name<span class="asterisk_red"></span></label>
                                    <div class="col-lg-8" >

                                        <s:textfield  required="true" name="customer.customerName" cssClass="form-control" id="customer.customerName"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px;">Company Code<span class="asterisk_red"></span></label>
                                    <div class="col-lg-8" >

                                        <s:textfield required="true" maxLength="3" name="customer.customerCode" cssStyle="text-transform:uppercase" cssClass="form-control" id="customer.customerCode" onkeypress="return alphaKeyOnly(event)"
                                                title="Company Code Must be 3 Capital Letters Only."/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px;">Customer Type<span class="asterisk_red"></span></label>
                                    <div class="col-lg-8" >
                                        <s:select name="customer.customerType" id="customer.customerType" listKey="key" listValue="value" list="customerTypeList" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px;">Phone Number<span class="asterisk_red"></span></label>
                                    <div class="col-lg-8" >
                                        <s:textfield required="true" name="customer.phone" cssClass="form-control" id="customer_phone" maxLength="14"
                                                     placeholder="(XXX) XXX-XXXX" title="(XXX) XXX-XXXX Contact Number should not contain special characters and/or letters."/>
                                    </div>
                                    </div>

                                <div class="form-group">
                                <label class="col-lg-4  control-label" style="padding-top:0px;">DTI</label>
                                <div class="col-lg-8" >
                                    <s:textfield name="customer.dti" cssClass="form-control" id="customer_dti"
                                                 placeholder="XXXXXXXX" maxLength="8"/>
                                </div>
                                </div>

                                <div class="form-group">

                                    <label class="col-lg-4  control-label" style="padding-top:0px;">Signature Card</label>
                                    <div class="col-lg-8" >
                                        <s:textfield name="customer.signatureCard" cssClass="form-control" id="customer_signatureCard" placeholder="Signature Card"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px;">Mobile Number<span class="asterisk_red"></span></label>
                                    <div class="col-lg-8" >
                                        <s:textfield required="true" name="customer.mobile" cssClass="form-control" id="customer_mobile" maxLength="19"
                                                     placeholder="(+639XX)(XXX-XXXX)"
                                                     title="(+639XX) (XXX-XXXX) Mobile should not contain special characters and/or letters."/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px;">Fax  Number</label>
                                    <div class="col-lg-8" >
                                        <s:textfield   name="customer.fax" cssClass="form-control" id="customer_fax" maxLength="14"
                                                       title="(XXX) XXX-XXXX Fax should not contain special characters and/or letters." placeholder="(XXX) XXX-XXXX"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px;">Email Address<span class="asterisk_red"></span></label>
                                    <div class="col-lg-8" >
                                        <s:textfield required="true" name="customer.email" cssClass="form-control" id="customer.email" type="email" maxLength="50"
                                                     placeholder="E-mail" pattern="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label" style="padding-top:0px;">Website</label>
                                    <div class="col-lg-8" >
                                        <s:textfield name="customer.website" cssClass="form-control" id="customer.website"/>
                                    </div>
                                </div>
                                <div class="form-group">

                                        <label class="col-lg-4 control-label" style="padding-top:0px;">Mayor's Permit Number</label>
                                        <div class="col-lg-8" >
                                        <s:textfield name="customer.mayorsPermit" cssClass="form-control" id="customer_mayorsPermit" placeholder="Mayor's Permit"/>
                                        </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-lg-4  control-label" style="padding-top:0px;">Account Application Form</label>
                                    <div class="col-lg-8" >
                                        <s:textfield name="customer.aaf" cssClass="form-control" id="customer_aaf" placeholder="Account Application Form"/>
                                    </div>
                                    </div>
                            </div>





                        <%--<div class="col-lg-9 col-lg-offset-2">--%>
                            <%--<div class="panel panel-info" >--%>
                                <%--<div class="panel-heading">--%>
                                    <%--<h3 class="panel-title"><i class="fa fa-file-text"></i> Documents</h3>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>

                                    <%--<div class="col-lg-4 col-lg-offset-2" >--%>
                                        <%--<s:checkbox name="customer_dti" fieldValue="true" label="DTI"/>--%>
                                        <%--<s:if test = "customer_dti == true">--%>
                                            <%--<s:hidden name="customer.dti" value="1" />--%>
                                        <%--</s:if>--%>
                                        <%--<s:else>--%>
                                            <%--<s:hidden name="customer.dti" value="0" />--%>
                                        <%--</s:else>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-lg-4 col-lg-offset-1">--%>
                                        <%--<s:checkbox name="customer_mayorsPermit" fieldValue="true" label="Mayor's Permit"/>--%>
                                    <%--</div>--%>


                                    <%--<div class="col-lg-4 col-lg-offset-2" >--%>
                                        <%--<s:checkbox name="customer_aaf" fieldValue="true" label="Account Application Form"/>--%>
                                    <%--</div>--%>
                                    <%--<div class="col-lg-4 col-lg-offset-1">--%>
                                        <%--<s:checkbox name="customer_signatureCard" fieldValue="true" label="Signature Card"/>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                    </div>
                </div>
            </div>

            <div class="panel-footer">
                <div class="pull-right">
                    <a href="customerList" class="btn btn-default" id ="groups-btn">Cancel</a>

                    <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
                </div>
            </div>
            </s:form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){

        $("#customer_phone").mask("(999) 999-9999");
        $("#customer_mobile").mask("(+63999)(999-9999)");
        $("#customer_fax").mask("(999) 999-9999");
        $("#customer_dti").mask("99999999");
        $("#customer_mayorsPermit").mask("99-999999");


    });

    $("#customer_customerCode").keyup(function(){
       this.value=this.value.toUpperCase();
    });

    function isNumberKey(evt)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if ((charCode > 32 && charCode < 57)||(charCode > 57 && charCode <65) || (charCode > 90 && charCode < 97) )
            return false;

        return true;
    }

</script>