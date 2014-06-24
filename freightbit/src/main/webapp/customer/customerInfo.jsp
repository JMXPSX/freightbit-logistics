<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- MIDDLE -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="page-header">Customer Profile</h1>

    <!-- MAIN BOX -->

    <div class="row">
        <div class="col-md-12">
            <div class="main-box">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><s:property value="customer.customerName" /></h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 " align="center">
                                <img alt="User Pic" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100" class="img-circle">
                            </div>
                            <div class=" col-md-9 col-lg-9 ">
                                <table class="table table-user-information">
                                    <tbody>
                                    <tr>
                                        <s:property value="customer.customerId" />
                                        <td>Name:</td>
                                        <td><s:property value="customer.customerId" /></td>
                                    </tr>
                                    <tr>
                                        <td>Customer Code:</td>
                                        <td><s:property value="customer.customerCode" /></td>
                                    </tr>
                                    <tr>
                                        <td>Customer Type:</td>
                                        <td><s:property value="customer.customerType" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><a href="mailto:info@support.com"><s:property value="customer.email" /></a></td>
                                    </tr>
                                    <tr>
                                        <td>Contact Number</td>
                                        <td>
                                            <s:property value="customer.phone" />(Landline)<br><br><s:property value="customer.mobile" />(Mobile)<br><br><s:property value="customer.fax" />(Fax)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Documents</td>
                                        <td>
                                            Signature Card(Done)<br><br>DTI(Done)<br><br>Mayor's Permit(Done)
                                        </td>
                                    </tr>
                                    </tbody>
                                    <%--<s:set name="customerId" value="%{customer.customerId}" scope="session"/>--%>

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
								<span class="pull-right">
								<a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
								<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
								</span>
                    </div>
                </div>
            </div>
            <!-- SIDEBAR -->

            <div class="sidebar-box">
                <div class="panel booking panel-info">
                    <div class="booking panel-heading">
                        <img src="images/calendar.png" class="box-icon">
                        <span class="booking panel-title">Process</span>
                    </div>

                    <div class="panel-body">

                        <ul class="nav">
                            <li><a href="customer-add.html" class="side-help"><img src="images/1.png" class="img-sidehelp">Personal Information</a></li>
                            <li><a href="viewCustomerContacts" class="side-help"><img src="images/2.png" class="img-sidehelp">Contact Person</a></li>
                            <li><a href="viewAddress" class="side-help"><img src="images/3.png" class="img-sidehelp">Address</a></li>
                            <li><a href="viewItem" class="side-help"><img src="images/4.png" class="img-sidehelp">Items</a></li>
                            <li><a href="viewRates" class="side-help"><img src="images/5.png" class="img-sidehelp">Rates</a></li>
                            <li><a href="customer-add7.html" class="side-help"><img src="images/6.png" class="img-sidehelp">Consignee Infomation</a></li>
                        </ul>

                    </div>
                </div>
            </div>


            <!-- END SIDEBAR -->

        </div>
    </div>
</div>


<!-- END OF MAIN BOX -->



<!-- END OF THE MIDDLE -->
		
