<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<%--
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <h1 class="booking page-header">
    Booking
    </h1>

    <div class="row">
        <div class="col-md-12">
            <div class="panel booking panel-info">
                <div class="booking panel-heading">
                    <img src="includes/images/booking.png" class="box-icon">
                    <span class="booking panel-title">List of Bookings</span>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered text-center">
                            <thead>
                                <tr class="header_center active">
                                  <th class="tb-font-black">Booking Date</th>
                                  <th class="tb-font-black">Booking Number</th>
                                  <th class="tb-font-black">Customer</th>
                                  <th class="tb-font-black">Consignee</th>
                                  <th class="tb-font-black">Destination</th>
                                  <th class="tb-font-black">Date / Time</th>
                                  <th class="tb-font-black">Status</th>
                                  <th class="tb-font-black">Processed By</th>
                                  <th class="tb-font-black">Action</th>
                                </tr>
                            </thead>
                        <tbody>

                            <tr>
                              <td class="tb-font-black">5-26-2014 </td>
                              <td class="tb-font-black">MTY-123 </td>
                              <td class="tb-font-black">Mighty Corp.</td>
                              <td class="tb-font-black">Palawan Co.</td>
                              <td class="tb-font-black">Palawan, Puerto Princesa</td>
                              <td class="tb-font-black">5-28-2014 / 7:45:00</td>
                              <td class="tb-font-black">Active</td>
                              <td class="tb-font-black">Merlin</td>

                              <td class="tb-font-black">
                                  <a href="#"><img src="includes/images/edit-booking.png" title="Edit Booking"> </a>
                                  <a href="#"><img src="includes/images/delete-booking.png" title="Delete Booking"> </a>
                                  <a href="#"><img src="includes/images/info-booking.png" title="Booking Info"> </a>
                              </td>

                            </tr>

                        </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel-footer">

                    <span class="pull-right">
                        <button type="button" class="btn btn-info new-booking" onclick="location.href='bookingSearch'">
                              Search Booking
                        </button>
                        <button type="button" class="btn btn-info new-booking" onclick="location.href='loadAddOrderPage'">
                              New Booking
                        </button>
                    </span>
                </div>
            </div>
        </div>

    </div>

</div>
--%>

<div class="row" style=" margin-top: -15px; ">
    <div class="col-lg-12">
        <h1>Booking Module </h1>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='home' />"> <i class="fa fa-dashboard"></i> Dashboard </a></li>
            <li class="active"><i class="fa fa-list"></i> Booking List</li>
        </ol>

    </div>
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> Booking List</h3>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered text-center">
                        <tr>
                            <display:table id="order" name="orders" requestURI="/viewOrders.action" pagesize="10"
                                           class="table table-striped table-hover table-bordered text-center tablesorter"
                                           style="margin-top: 15px;">
                                <td><display:column property="orderNumber" title="Order #" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="shipperCode" title="Shipper" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="consigneeCode" title="Consignee" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="serviceType" title="Type" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="serviceMode" title="Mode" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td><display:column property="orderDate" title="Order Date" class="tb-font-black"
                                                    style="text-align: center;"> </display:column></td>
                                <td class="tb-font-black" style="text-align: center;">
                                    <display:column title="Actions">

                                        <s:url var="editVendorUrl" action="loadEditVendorPage">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{editVendorUrl}" rel="tooltip"
                                             title="Edit this vendor">
                                            <img src="includes/images/edit-user.png" class="icon-action circ-icon">
                                        </s:a>

                                        <s:url var="deleteVendorUrl" action="deleteVendor">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{deleteVendorUrl}" rel="tooltip"
                                             title="Delete this Vendor"
                                             onclick="return confirm('Do you really want to delete?');">
                                            <img src="includes/images/remove-user.png" class="icon-action circ-icon">
                                        </s:a>

                                        <s:url var="viewInfoVendorUrl" action="viewInfoVendor">
                                            <s:param name="vendorCodeParam" value="#attr.vendor.vendorCode"></s:param>
                                        </s:url>
                                        <s:a class="icon-action-link" href="%{viewInfoVendorUrl}" rel="tooltip"
                                             title="View Vendor Info">
                                            <img src="includes/images/info-b.png" class="icon-action circ-icon">
                                        </s:a>
                                    </display:column>
                                </td>
                            </display:table>
                        </tr>
                    </table>


                </div>
            </div>

            <div class="panel-footer">

                    <span class="pull-right">
                        <button type="button" class="btn btn-info new-booking" onclick="location.href='bookingSearch'">
                            <i class="fa fa-search"></i> Search Booking
                        </button>
                        <button type="button" class="btn btn-info new-booking"
                                onclick="location.href='loadAddOrderPage'">
                            <i class="fa fa-book"></i> New Booking
                        </button>
                    </span>
            </div>
        </div>
    </div>
    <!-- /.row -->


