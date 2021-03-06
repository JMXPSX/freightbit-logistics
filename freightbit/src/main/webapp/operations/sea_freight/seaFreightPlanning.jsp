<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span >
                <h1><i class="fa fa-anchor"></i> Sea Freight Planning </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />"> Dashboard </a></li>
            <li class="active"><a href="<s:url action='viewSeaFreightList' />"> Sea Freight Planning : Orders </a></li>
            <li class="active">
                <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                    <s:param name="orderIdParam"
                             value="#attr.order.orderId"></s:param>
                    <s:param name="orderNoParam"
                             value="#attr.order.orderNo"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                     title="Update Status">
                    <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                        Sea Freight Planning : Containers
                    </s:if>
                    <s:else>
                        Sea Freight Planning : Items
                    </s:else>
                </s:a>
            </li>
            <li class="active"> Sea Freight Planning</li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-book"></i>
            <span class="panel-title">Booking Information</span>
        </div>
        <div class="panel-body form-horizontal">
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Booking Number</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.orderNumber}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Type</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Customer Name</label>
                <div class="col-lg-10">
                    <s:textfield cssClass="form-control" value="%{order.customerName}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
            <div class="form-group">
                <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Consignee Name</label>
                <div class="col-lg-10" id="anchorDiv">
                    <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
                </div>
            </div>
        </div>

    </div>


    <s:if test="order.freightType=='SHIPPING'">
        <s:if test="order.modeOfService=='PIER TO PIER'">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Sea Operation</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: -50px;">
                        <c:out value="${sessionScope.vendorIdPass}" />
                        <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                        <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                        <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                        <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
                        <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}" />
                        <s:hidden name="operationsBean.classification" value="%{orderItem.classification}" />
                        <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}" />
                        <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}" />
                        <s:hidden name="operationsBean.comments" value="%{orderItem.comments}" />
                        <s:hidden name="operationsBean.rate" value="%{orderItem.rate}" />
                        <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}" />
                        <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}" />
                        <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}" />
                        <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}" />
                        <s:hidden name="operationsBean.status" value="%{orderItem.status}" />
                        <s:hidden name="operationsBean.weight" value="%{orderItem.weight}" />
                        <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                        <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />

                        <div class="form-group">
                            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                            </s:else>
                            <div class="col-lg-10">
                                <div class="form-control">
                                    <c:out value="${sessionScope.nameSizeParam}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a href="#" style="width: 135px;">
                                        <s:submit cssClass="btn btn-primary" name="submit" value="Search Schedule"/>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                        Add Vendor
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                        Add Schedule
                                    </a>
                                </div>
                            </div>
                        </div>
                    </s:form>
                    <div class="form-group" style="padding-top: 50px;">
                        <hr>
                        <h4 style="text-align:center;">List of Schedules</h4>
                        <hr>
                    </div>
                    <s:if test="hasActionMessages()">
                        <div class="col-lg-12" id="successDiv">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                            </div>
                        </div>
                    </s:if>
                    <display:table id="vesselSchedule" name="vesselSchedules"
                                   requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                   style="margin-top: 15px;">
                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                <s:param name="vesselScheduleIdParam"
                                         value="#attr.vesselSchedule.vesselScheduleId">
                                </s:param>
                                <s:param name="vendorIdParam"
                                         value="#attr.vesselSchedule.vendorId">
                                </s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip"
                                 title="Update Status">
                                Choose this vessel...
                            </s:a>
                        </display:column></td>
                    </display:table>
                </div>
            </div>
        </s:if>
    </s:if>

    <s:if test="order.freightType=='SHIPPING AND TRUCKING'">
        <s:if test="order.modeOfService=='DOOR TO DOOR'">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Sea Operation</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: -50px;">
                        <c:out value="${sessionScope.vendorIdPass}" />
                        <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                        <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                        <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                        <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
                        <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}" />
                        <s:hidden name="operationsBean.classification" value="%{orderItem.classification}" />
                        <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}" />
                        <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}" />
                        <s:hidden name="operationsBean.comments" value="%{orderItem.comments}" />
                        <s:hidden name="operationsBean.rate" value="%{orderItem.rate}" />
                        <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}" />
                        <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}" />
                        <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}" />
                        <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}" />
                        <s:hidden name="operationsBean.status" value="%{orderItem.status}" />
                        <s:hidden name="operationsBean.weight" value="%{orderItem.weight}" />
                        <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                        <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />

                        <div class="form-group">
                            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                            </s:else>
                            <div class="col-lg-10">
                                <div class="form-control">
                                    <c:out value="${sessionScope.nameSizeParam}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a href="#" style="width: 135px;">
                                        <s:submit cssClass="btn btn-primary" name="submit" value="Search Schedule"/>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                        Add Vendor
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                        Add Schedule
                                    </a>
                                </div>
                            </div>
                        </div>
                    </s:form>
                    <div class="form-group" style="padding-top: 50px;">
                        <hr>
                        <h4 style="text-align:center;">List of Schedules</h4>
                        <hr>
                    </div>
                    <s:if test="hasActionMessages()">
                        <div class="col-lg-12" id="successDiv">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                            </div>
                        </div>
                    </s:if>
                    <display:table id="vesselSchedule" name="vesselSchedules"
                                   requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                   style="margin-top: 15px;">
                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                <s:param name="vesselScheduleIdParam"
                                         value="#attr.vesselSchedule.vesselScheduleId">
                                </s:param>
                                <s:param name="vendorIdParam"
                                         value="#attr.vesselSchedule.vendorId">
                                </s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip"
                                 title="Update Status">
                                Choose this vessel...
                            </s:a>
                        </display:column></td>
                    </display:table>
                </div>
            </div>

            <%--Origin--%>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-truck"></i>
                    <span class="panel-title">Inland Operation : Origin</span>
                </div>
                <div class="panel-body form-horizontal">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.vendorOrigin}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.driverOrigin}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.truckOrigin}" disabled="true" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.finalPickupDate}" disabled="true" />
                        </div>
                    </div>
                </div>
            </div>

            <%--Destination--%>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-truck"></i>
                    <span class="panel-title">Inland Operation : Destination</span>
                </div>
                <div class="panel-body form-horizontal">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.vendorDestination}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.driverDestination}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.truckDestination}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Dropoff Date</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.finalDeliveryDate}" disabled="true" />
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="pull-right">
                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                             title="Update Status">

                            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                <button type="button" class="btn">
                                    Back to Sea Freight Planning : Containers
                                </button>
                            </s:if>
                            <s:else>
                                <button type="button" class="btn">
                                    Back to Sea Freight Planning : Items
                                </button>
                            </s:else>

                        </s:a>
                    </div>
                </div>
            </div>
        </s:if>
        <s:elseif test="order.modeOfService=='DOOR TO PIER'">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Sea Operation</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: -50px;">
                        <c:out value="${sessionScope.vendorIdPass}" />
                        <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                        <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                        <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                        <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
                        <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}" />
                        <s:hidden name="operationsBean.classification" value="%{orderItem.classification}" />
                        <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}" />
                        <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}" />
                        <s:hidden name="operationsBean.comments" value="%{orderItem.comments}" />
                        <s:hidden name="operationsBean.rate" value="%{orderItem.rate}" />
                        <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}" />
                        <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}" />
                        <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}" />
                        <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}" />
                        <s:hidden name="operationsBean.status" value="%{orderItem.status}" />
                        <s:hidden name="operationsBean.weight" value="%{orderItem.weight}" />
                        <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                        <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />

                        <div class="form-group">
                            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                            </s:else>
                            <div class="col-lg-10">
                                <div class="form-control">
                                    <c:out value="${sessionScope.nameSizeParam}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a href="#" style="width: 135px;">
                                        <s:submit cssClass="btn btn-primary" name="submit" value="Search Schedule"/>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                        Add Vendor
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                        Add Schedule
                                    </a>
                                </div>
                            </div>
                        </div>
                    </s:form>
                    <div class="form-group" style="padding-top: 50px;">
                        <hr>
                        <h4 style="text-align:center;">List of Schedules</h4>
                        <hr>
                    </div>
                    <s:if test="hasActionMessages()">
                        <div class="col-lg-12" id="successDiv">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                            </div>
                        </div>
                    </s:if>
                    <display:table id="vesselSchedule" name="vesselSchedules"
                                   requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                   style="margin-top: 15px;">
                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                <s:param name="vesselScheduleIdParam"
                                         value="#attr.vesselSchedule.vesselScheduleId">
                                </s:param>
                                <s:param name="vendorIdParam"
                                         value="#attr.vesselSchedule.vendorId">
                                </s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip"
                                 title="Update Status">
                                Choose this vessel...
                            </s:a>
                        </display:column></td>
                    </display:table>
                </div>
            </div>

            <%--Origin--%>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-truck"></i>
                    <span class="panel-title">Inland Operation : Origin</span>
                </div>
                <div class="panel-body form-horizontal">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.vendorOrigin}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.driverOrigin}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.truckOrigin}" disabled="true" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Pickup Date</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.finalPickupDate}" disabled="true" />
                        </div>
                    </div>
                </div>
            </div>
        </s:elseif>
        <s:elseif test="order.modeOfService=='PIER TO DOOR'">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-anchor"></i>
                    <span class="panel-title">Sea Operation</span>
                </div>
                <div class="panel-body">
                    <s:form cssClass="form-horizontal" action="findVesselSchedule" theme="bootstrap" style="margin-bottom: -50px;">
                        <c:out value="${sessionScope.vendorIdPass}" />
                        <s:hidden name="operationsBean.orderItemId" value="%{orderItem.orderItemId}" />
                        <s:hidden name="operationsBean.clientId" value="%{orderItem.clientId}" />
                        <s:hidden name="operationsBean.nameSize" value="%{orderItem.nameSize}" />
                        <s:hidden name="operationsBean.orderId" value="%{order.orderId}" />
                        <s:hidden name="operationsBean.quantity" value="%{orderItem.quantity}" />
                        <s:hidden name="operationsBean.classification" value="%{orderItem.classification}" />
                        <s:hidden name="operationsBean.commodity" value="%{orderItem.commodity}" />
                        <s:hidden name="operationsBean.declaredValue" value="%{orderItem.declaredValue}" />
                        <s:hidden name="operationsBean.comments" value="%{orderItem.comments}" />
                        <s:hidden name="operationsBean.rate" value="%{orderItem.rate}" />
                        <s:hidden name="operationsBean.createdTimestamp" value="%{orderItem.createdTimestamp}" />
                        <s:hidden name="operationsBean.createdBy" value="%{orderItem.createdBy}" />
                        <s:hidden name="operationsBean.modifiedTimestamp" value="%{orderItem.modifiedTimestamp}" />
                        <s:hidden name="operationsBean.modifiedBy" value="%{orderItem.modifiedBy}" />
                        <s:hidden name="operationsBean.status" value="%{orderItem.status}" />
                        <s:hidden name="operationsBean.weight" value="%{orderItem.weight}" />
                        <s:hidden name="operationsBean.modeOfService" value="%{order.modeOfService}" />
                        <s:hidden name="operationsBean.freightType" value="%{order.freightType}" />
                        <div class="form-group">
                            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Container Size</label>
                            </s:if>
                            <s:else>
                                <label class="col-lg-2 control-label" style="padding-top:0px;">Item Name</label>
                            </s:else>
                            <div class="col-lg-10">
                                <div class="form-control">
                                    <c:out value="${sessionScope.nameSizeParam}"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="operationsBean.vendorList" class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                            <div class="col-lg-4">
                                <div>
                                    <s:select list="vendorShippingList" name="operationsBean.vendorList"
                                              id="operationsBean_vendorList"
                                              listKey="vendorId" listValue="vendorCode" cssClass="form-control"
                                              emptyOption="true"
                                            ></s:select>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a href="#" style="width: 135px;">
                                        <s:submit cssClass="btn btn-primary" name="submit" value="Search Schedule"/>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#createVendor" class="btn btn-info" style="width: 135px;">
                                        Add Vendor
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-2" style="text-align: center;">
                                <div>
                                    <a data-toggle="modal" data-target="#addSchedule" id="createSchedule" class="btn btn-info" style="width: 135px;">
                                        Add Schedule
                                    </a>
                                </div>
                            </div>
                        </div>
                    </s:form>
                    <div class="form-group" style="padding-top: 50px;">
                        <hr>
                        <h4 style="text-align:center;">List of Schedules</h4>
                        <hr>
                    </div>
                    <s:if test="hasActionMessages()">
                        <div class="col-lg-12" id="successDiv">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">x</button>
                                <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
                            </div>
                        </div>
                    </s:if>
                    <display:table id="vesselSchedule" name="vesselSchedules"
                                   requestURI="/viewSeaFreightPlanning.action" pagesize="10"
                                   class="table table-striped table-hover table-bordered text-center tablesorter"
                                   style="margin-top: 15px;">
                        <td><display:column property="voyageNumber" title="Voyage #" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="originPort" title="Origin" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="destinationPort" title="Destination" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="departureDate" title="Departure" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column property="arrivalDate" title="Arrival" class="tb-font-black"
                                            style="text-align: center;"> </display:column></td>
                        <td><display:column title="Action">
                            <s:url var="editOrderItemsSeaUrl" action="editOrderItemsSea">
                                <s:param name="vesselScheduleIdParam"
                                         value="#attr.vesselSchedule.vesselScheduleId">
                                </s:param>
                                <s:param name="vendorIdParam"
                                         value="#attr.vesselSchedule.vendorId">
                                </s:param>
                            </s:url>
                            <s:a class="icon-action-link" href="%{editOrderItemsSeaUrl}" rel="tooltip"
                                 title="Update Status">
                                Choose this vessel...
                            </s:a>
                        </display:column></td>
                    </display:table>
                </div>
            </div>

            <%--Destination--%>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <i class="fa fa-truck"></i>
                    <span class="panel-title">Inland Operation : Destination</span>
                </div>
                <div class="panel-body form-horizontal">
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Vendor</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.vendorDestination}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Driver</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.driverDestination}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Truck</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.truckDestination}" disabled="true" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 control-label" style="padding-top:0px;">Dropoff Date</label>
                        <div class="col-lg-10">
                            <s:textfield cssClass="form-control" value="%{orderItem.finalDeliveryDate}" disabled="true" />
                        </div>
                    </div>
                </div>

                <div class="panel-footer">
                    <div class="pull-right">
                        <s:url var="viewSeaFreightItemListUrl" action="viewSeaFreightItemList">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>
                        </s:url>
                        <s:a class="icon-action-link" href="%{viewSeaFreightItemListUrl}" rel="tooltip"
                             title="Update Status">

                            <s:if test="order.serviceRequirement=='FULL CARGO LOAD'">
                                <button type="button" class="btn">
                                    Back to Sea Freight Planning : Containers
                                </button>
                            </s:if>
                            <s:else>
                                <button type="button" class="btn">
                                    Back to Sea Freight Planning : Items
                                </button>
                            </s:else>

                        </s:a>
                    </div>
                </div>
            </div>
        </s:elseif>
    </s:if>





    </div>
</div>

<%--Start Add Vendor Modal--%>

<div class="modal fade" id="createVendor" role="form" aria-labelledby="myModalLabel1">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">Add Vendor</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <%--<s:property  value="%{orderItem.orderItemId}"/>--%>
                    <%--<s:textfield id="itemIdHolder"  value="%{orderItem.orderItemId}"/>--%>
                            <s:form action="addVendor" cssClass="form-horizontal" theme="bootstrap">
                            <label>Name<span class="asterisk_red"></span></label>

                                <s:textfield cssClass="form-control" id="vendor.vendorName" placeholder="Vendor Name"
                                             name="vendor.vendorName"></s:textfield>

                            <label>Code<span class="asterisk_red"></span></label>

                                <s:textfield cssClass="form-control" id="vendor.vendorCode" placeholder="Vendor Code"
                                             name="vendor.vendorCode" maxLength="3" pattern="[A-Z]+" title="Must be letters only and CAPS."></s:textfield>

                            <label>Class Name<span class="asterisk_red"></span></label>

                                <s:select cssClass="form-control" id="vendor.vendorClass" list="vendorClassList" listKey="key"
                                          listValue="value"
                                          name="vendor.vendorClass"/>

                            <label>Status<span class="asterisk_red"></span></label>

                                <s:select cssClass="form-control" id="vendor.vendorStatus" list="statusList"
                                          listKey="key" listValue="value"
                                          name="vendor.vendorStatus"/>

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

<%--End Add Vendor Modal--%>

<%--Start Add Schedule--%>

<div class="modal fade" id="addSchedule" role="form" aria-labelledby="myModalLabel2">
    <div class="modal-dialog modal-form">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">Add Schedule</h4>
            </div>

            <div class="modal-body">
                <div class="panel-body">

                    <s:form cssClass="form-horizontal" theme="bootstrap" action="addVesselScheduleInPlanning">

                            <label>Voyage Number<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" name="vesselSchedule.voyageNumber"/>

                            <s:hidden id="vendorIdHolder" name="vesselSchedule.vendorId" />

                            <label> Departure Date<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" id="departureDate"
                                         name="vesselSchedule.departureDate"/>

                            <label> Departure Time<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" id="departureTime"
                                         name="vesselSchedule.departureTime" readonly="true"/>

                            <label>Arrival Date<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" id="arrivalDate" name="vesselSchedule.arrivalDate" readonly="true"/>

                            <label> Arrival Time<span class="asterisk_red"></span></label>

                            <s:textfield cssClass="form-control" id="arrivalTime"
                                         name="vesselSchedule.arrivalTime"/>

                            <label>Origin Pier<span class="asterisk_red"></span></label>

                        <s:select emptyOption="true" id="vesselSchedule_originPort"
                                  value="vesselSchedule.originPort"
                                  name="vesselSchedule.originPort"
                                  list="portsList" listValue="value" listKey="key"
                                  cssClass="form-control"/>

                            <label>Destination Pier<span class="asterisk_red"></span></label>

                            <s:select emptyOption="true" id="vesselSchedule_destinationPort"
                                      value="vesselSchedule.destinationPort"
                                      name="vesselSchedule.destinationPort"
                                      list="portsList" listValue="value" listKey="key"
                                      cssClass="form-control"/>

                </div>
            </div>

            <div class="modal-footer">
                <div>
                    <s:submit cssClass="btn btn-primary" name="submit" value="Save"/>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--End Add Schedule--%>

<script type="text/javascript">

    $("#date").datepicker({dateFormat: 'yy-dd-mm'});

    // Anchor on successDiv on every schedule load
    if ($('#successDiv').length !== 0){
        window.location.href = '#anchorDiv';
    }

    // User must choose a vendor first before adding vessel schedule
    $(document).ready(function(){
        $("#createSchedule").click(function() {
            var vendorId = $("#operationsBean_vendorList").val();

            if (vendorId == "" || null){
                alert("Select a vendor first");
                $("#operationsBean_vendorList").focus();
                return false;
            }

            $("#vendorIdHolder").val(vendorId);
        });
    });

    var departureDate = $('#departureDate');
    var arrivalDate = $('#arrivalDate');
    // departure date
    departureDate.datepicker({

                dateFormat: 'mm-dd-yy',
                minDate: 0,

                onClose: function(dateText, inst) {
                    if (arrivalDate.val() != '') {
                        var testStartDate = departureDate.datepicker('getDate');
                        var testEndDate = departureDate.datepicker('getDate');

                        if (testStartDate > testEndDate)
                            arrivalDate.datepicker('setDate', testStartDate);
                    }
                    else {
                        arrivalDate.val(dateText);
                    }
                },

                onSelect: function (selectedDateTime){
                    arrivalDate.datepicker('option', 'minDate', departureDate.datepicker('getDate') );
                }
            }

    );
    // arrival date
    arrivalDate.datepicker(
            {
                dateFormat: 'mm-dd-yy',
                minDate: 0,

                onClose: function(dateText, inst) {

                    if (departureDate.val() != '') {
                        var testStartDate = departureDate.datepicker('getDate');
                        var testEndDate = arrivalDate.datepicker('getDate');

                        if (testStartDate > testEndDate)
                            departureDate.datepicker('setDate', testEndDate);

                    }

                    else {
                        departureDate.val(dateText);
                    }
                },

                onSelect: function (selectedDateTime){
                    departureDate.datepicker('option', 'maxDate', arrivalDate.datepicker('getDate') );
                }
            });

    $('#arrivalTime').timepicker( {
        timeFormat: 'h:mm TT'

    });

    $('#departureTime').timepicker( {
        timeFormat: 'h:mm TT'

    });

    // Avoid selecting duplicate ports

    function preventDuplicatePort(select, index) {

        var options = select.options,
                len = options.length;

        while ( len-- ){
            options[ len ].disabled = false;
        }

        select.options[ index ].disabled = true;

        if( index === select.selectedIndex ){
            alert('You already selected the same port "' + select.options[index].text + '". Please choose another' );
            /*this.selectedIndex = 0;*/
            select2.value = '';
        }

    }

    var select1 = select = document.getElementById('vesselSchedule_originPort');
    var select2 = select = document.getElementById('vesselSchedule_destinationPort');

    select2.value = '';

    select1.onchange = function() {
        preventDuplicatePort.call(this, select2, this.selectedIndex);
    };

    select2.onchange = function() {
        preventDuplicatePort.call(this, select1, this.selectedIndex);
    };

</script>