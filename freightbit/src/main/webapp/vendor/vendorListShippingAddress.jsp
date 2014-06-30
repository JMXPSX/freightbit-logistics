<%@ taglib prefix="s" uri="/struts-tags" %>
<%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Vendor Module</h1>

    <div class="col-md-12">
        <div class="panel panel-info">

            <div class="panel-heading">

                <img src="includes/images/listofusers.png" class="box-icon"/> <span
                    class="panel-title">List of Vendors</span>
            </div>

            <div class="panel-body">
                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered text-center" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black">Address Type</th>
                            <th class="tb-font-black">Address 1</th>
                            <th class="tb-font-black">Address 2</th>
                            <th class="tb-font-black">City</th>
                            <th class="tb-font-black">State</th>
                            <th class="tb-font-black">Zip</th>
                            <th class="tb-font-black">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="addresss" var="address">
                            <tr>
                                <td class="tb-font-black"><s:property value="addressType"/></td>
                                <td class="tb-font-black"><s:property value="addressLine1"/></td>
                                <td class="tb-font-black"><s:property value="addressLine2"/></td>
                                <td class="tb-font-black"><s:property value="city"/></td>
                                <td class="tb-font-black"><s:property value="state"/></td>
                                <td class="tb-font-black"><s:property value="zip"/></td>

                                <td>

                                    <s:url var="loadEditShippingAddressUrl" action="loadEditShippingAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a href="%{loadEditShippingAddressUrl}" class="icon-action-link" rel="tooltip"
                                         title="Edit this Vendor Address"><img src="includes/images/edit-user.png"
                                                                               class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteAddressUrl" action="deleteShippingAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                         title="Delete this Vendor Address"
                                         onclick="return confirm('Do you really want to delete?');"><img
                                            src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="panel-footer">

                <ul class="pagination">
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li class="disabled"><a href="#">&raquo;</a></li>
                </ul>

            <span class="pull-right">
                <s:url var="loadAddAddressUrl" action="loadAddShippingAddress">
                    <s:param name="vendorIdParam" value="vendorIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>
        </div>
    </div>
</div>--%>





<div class="row">
    <div class="col-lg-12">
        <h1>Vendor Module </h1>
        <ol class="breadcrumb">
            <li class="active" ><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-male"></i> Vendor</li>
            <li class="active"><a href="<s:url action='viewVendors' />"> <i class="fa fa-list"></i> Vendor List</a></li>
            <li class="active"><a href="<s:url action='viewInfoVendor' />"> <i class="fa fa-info-circle"></i> Vendor Profile</a></li>
            <li class="active"><i class="fa fa-home"></i> Address</li>
        </ol>

    </div>
</div><!-- /.row -->

<s:if test="hasActionMessages()">
    <%--<div class="row alert alert-success alert-dismissable">
        <s:actionmessage/>
    </div>--%>
    <div class="col-lg-10">
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                ×</button>
            <span class="fa fa-check"></span> <strong>Success Message</strong>
            <hr class="message-inner-separator">
            <s:actionmessage/>
        </div>
    </div>
</s:if>

<div class="row">
    <div class="col-lg-10">
        <div class="panel panel-primary">

            <div class="panel-heading" style="padding-bottom: 0px;">
                <h3 class="panel-title" style="position: relative; top: 10px;"><i class="fa fa-home"></i> Address</h3>
                <span class="pull-right">
                <a href="loadAddShippingAddress" class="icon-action-link" rel="tooltip" title="Add Vendor">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon" style="position: relative; bottom: 15px;">
                </a>
                </span>
            </div>

            <div class="panel-body">

                <div class="table-responsive list-table">
                    <table class="table table-striped table-bordered table-hover text-center tablesorter" id="customer-list">
                        <thead>
                        <tr class="header_center">
                            <th class="tb-font-black" style="text-align: center;">Address Type <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Address 1 <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Address 2 <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">City <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">State <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Zip <i class="fa fa-sort"></i></th>
                            <th class="tb-font-black" style="text-align: center;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="addresss" var="address">
                            <tr>
                                <td class="tb-font-black"><s:property value="addressType"/></td>
                                <td class="tb-font-black"><s:property value="addressLine1"/></td>
                                <td class="tb-font-black"><s:property value="addressLine2"/></td>
                                <td class="tb-font-black"><s:property value="city"/></td>
                                <td class="tb-font-black"><s:property value="state"/></td>
                                <td class="tb-font-black"><s:property value="zip"/></td>

                                <td>

                                    <s:url var="loadEditShippingAddressUrl" action="loadEditShippingAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a href="%{loadEditShippingAddressUrl}" class="icon-action-link" rel="tooltip"
                                         title="Edit this Vendor Address"><img src="includes/images/edit-user.png"
                                                                               class="icon-action circ-icon"> </s:a>

                                    <s:url var="deleteAddressUrl" action="deleteShippingAddress">
                                        <s:param name="addressIdParam" value="%{addressId}"></s:param>
                                    </s:url>
                                    <s:a class="icon-action-link" href="%{deleteAddressUrl}" rel="tooltip"
                                         title="Delete this Vendor Address"
                                         onclick="return confirm('Do you really want to delete?');"><img
                                            src="includes/images/remove-user.png" class="icon-action circ-icon"> </s:a>
                                </td>
                            </tr>
                        </s:iterator>
                        </tbody>
                    </table>
                </div>

            </div>

            <div class="panel-footer">


            <span class="pull-right">
                <s:url var="loadAddAddressUrl" action="loadAddShippingAddress">
                    <s:param name="vendorIdParam" value="vendorIdParam"> </s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{loadAddAddressUrl}" rel="tooltip" title="Add Contact">
                    <img src="includes/images/add-user.png" class="icon-action circ-icon">
                </s:a>
            </span>

            </div>
        </div>
    </div>

    <div class="col-lg-2">
        <div class="panel panel-primary">

            <%--<div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list-ol"></i> Vendor Details</h3>
            </div>--%>

            <ul class="nav nav-pills nav-stacked">
                <li><a href="#"><i class="fa fa-info-circle fa-fw"></i> Profile</a></li>
                <li class="active"><a href="viewShippingAddress"><i class="fa fa-home fa-fw"></i> Address</a></li>
                <li><a href="viewVendorShippingContacts"><i class="fa fa-group fa-fw"></i> Contact Persons</a></li>
                <li><a href="viewVessels"><i class="fa fa-anchor fa-fw"></i> Vessels</a></li>

            </ul>
        </div>
    </div>
</div><!-- /.row -->