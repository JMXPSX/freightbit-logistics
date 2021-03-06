<%--
  Created by IntelliJ IDEA.
  User: JMXPSX
  Date: 9/24/2014
  Time: 5:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<style>
    .pagebanner, .pagelinks {
        display: none;
    }

</style>

<div class="row">
    <div class="col-lg-12">

        <legend style="text-align: left;">
            <span >
               <h1><i class="fa fa-file-text"></i> Documents Module </h1>
            </span>
        </legend>
        <ol class="breadcrumb">
            <li class="active"><a href="<s:url action='../home' />">  Dashboard </a></li>
            <li class="active"><a href="<s:url action='../documentation/viewPendingDocuments' />"> Pending Documents List</a></li>
            <li class="active"> Pending Documents of Booking Number <s:property value="bookingNumber"/></li> <%--placeholder--%>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">

            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-file-text"></i> Document Stages</h3>
            </div>

            <div class="panel-body">

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
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Freight Type</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.freightType}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Requirement</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.serviceRequirement}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="book-num" class="col-lg-2 control-label" style="padding-top:0px;">Service Mode</label>
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.modeOfService}" name="book-num" disabled="true"></s:textfield>
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
                            <div class="col-lg-10">
                                <s:textfield cssClass="form-control" value="%{order.consigneeCode}" name="book-num" disabled="true"></s:textfield>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="well">

                    <div class="container">

                        <div class="row bs-wizard" style="border-bottom:0;">

                            <div class="col-xs-2 bs-wizard-step active" id="first">
                                <div class="text-center bs-wizard-stepnum">OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#outbound" class="bs-wizard-dot" data-toggle="tab" onclick="OutboundProgress()"></a>

                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled" id="second"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#inbound" class="bs-wizard-dot" data-toggle="tab" onclick="InboundProgress()"></a>

                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                <div class="text-center bs-wizard-stepnum">FINAL OUTBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalOutbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalOutboundProgress()"></a>

                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">FINAL INBOUND</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#finalInbound" class="bs-wizard-dot" data-toggle="tab" onclick="finalInboundProgress()"></a>

                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">ARCHIVE</div>
                                <div class="progress"><div class="progress-bar"></div></div>
                                <a href="#archive" class="bs-wizard-dot" data-toggle="tab" onclick="archiveProgress()"></a>

                            </div>

                            <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                <div class="text-center bs-wizard-stepnum">BILLING</div>
                                <div class="progress"><div class="progress-bar" data-toggle="tab" onclick="BillingProgress"></div></div>
                                <a href="#billing" class="bs-wizard-dot"></a>

                            </div>
                        </div>

                    </div>
                </div>

                <div class="well">
                    <div class="container">
                        <s:form action="addReferenceNumber" theme="bootstrap">
                            <label class="col-lg-2">Reference Number<span class="asterisk_red"></span></label>
                            <div class="col-lg-8">
                                <s:property value="%{document.documentId}" />
                                <s:property value="%{document.documentName}" />
                                <s:property value="%{document.documentType}" />
                                <s:property value="%{document.referenceId}" />
                                <s:hidden name="document.documentId" value="%{document.documentId}" />
                                <s:hidden name="document.documentName" value="%{document.documentName}" />
                                <s:hidden name="document.documentType" value="%{document.documentType}" />
                                <s:hidden name="document.referenceId" value="%{document.referenceId}" />
                                <s:hidden name="document.referenceTable" value="%{document.referenceTable}" />
                                <s:hidden name="document.orderNumber" value="%{document.orderNumber}" />
                                <s:textfield cssClass="form-control" placeholder="Reference Number" name="document.referenceNumber"
                                             id="document.referenceNumber" required="true" maxLength="30" autofocus="true"
                                             pattern="[a-zA-Z\s ]+"
                                             title="Name should not contain special characters and/or numbers."/>
                            </div>
                            <s:submit name="submit" cssClass="btn btn-primary" value="Save" />
                        </s:form>
                    </div>
                </div>

                </div>

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active" id="out"><a href="#outbound" role="tab" data-toggle="tab">Outbound</a></li>
                    <%--<li id="in"><a href="#inbound" role="tab" data-toggle="tab">Inbound</a></li>--%>
                    <%--Redirects to Inbound Stage--%>
                    <li>
                        <s:url var="inboundStageUrl" action="viewOrderDocumentsInbound">
                            <s:param name="orderIdParam"
                                     value="#attr.order.orderId"></s:param>
                            <%--<s:param name="orderNoParam"
                                     value="#attr.order.orderNo"></s:param>--%>
                        </s:url>
                        <s:a class="icon-action-link" href="%{inboundStageUrl}">
                            Inbound
                        </s:a>
                    </li>
                    <li id="fiOut"><a href="#finalOutbound" role="tab" data-toggle="tab">Final Set Outbound</a></li>
                    <li id="fiIn"><a href="#finalInbound" role="tab" data-toggle="tab">Final Set Inbound</a></li>
                    <li id="arch"><a href="#archive" role="tab" data-toggle="tab">Archive</a></li>
                    <li id="bill"><a href="#billing" role="tab" data-toggle="tab">Billing</a></li>
                </ul>

                <div class="tab-content">
                    <%--OUTBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade in active" id="outbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="document" name="outboundEntityList" requestURI="orderDocumentsInput.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px;">

                                    <td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            <%--<s:property value="%{#attr.document.documentProcessed}"/>--%>
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </display:column></td>

                                    <%--<td><display:column property="documentId" title="ID" class="tb-font-black"
                                                        style="text-align: center;" > </display:column></td>--%>

                                    <td>
                                        <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                            &lt;%&ndash;Input Reference ID&ndash;%&gt;
                                            <s:if test="#attr.document.documentName=='PROFORMA BILL OF LADING'">
                                                &lt;%&ndash;<a data-toggle="modal" data-target="#addReferenceNumber" >
                                                    <i class="fa fa-edit"></i>
                                                </a>&ndash;%&gt;
                                                <s:url var="addReferenceNumberUrl" action="addReferenceNumber">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a id="edit-icon" class="icon-action-link" href="%{addReferenceNumberUrl}" rel="tooltip" title ="Add Reference Number">
                                                    <i class="fa fa-edit"></i>
                                                </s:a>
                                            </s:if>
                                            &lt;%&ndash;Print Document&ndash;%&gt;
                                            <s:if test="#attr.document.documentName=='BOOKING REQUEST FORM' || #attr.document.documentName=='HOUSE BILL OF LADING' || #attr.document.documentName=='HOUSE WAYBILL ORIGIN' || #attr.document.documentName=='HOUSE WAYBILL DESTINATION' || #attr.document.documentName=='ACCEPTANCE RECEIPT' ">
                                                <a id="print-icon" href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                    <i class="fa fa-print"></i>
                                                </a>
                                            </s:if>
                                            &lt;%&ndash;Move Document&ndash;%&gt;
                                            <s:url var="checkDocumentUrl" action="checkDocument">
                                                <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                            </s:url>
                                            <s:a id="check-icon" class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Next Stage">
                                                <i class="fa fa-chevron-circle-right"></i>
                                            </s:a>

                                        </display:column>--%>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                            <i class="fa fa-ban"></i>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>
                    <%--INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="inbound">

                            <div class="panel-body">

                                <div class="table-responsive">
                                    <display:table id="InboundDocument" name="inboundEntityList" requestURI="orderDocumentsInput.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                                   style="margin-top: 15px; visibility:hidden;">

                                        <%--<td>
                                            <display:column title="" class="tb-font-black" style="text-align: center;" >
                                                <s:if test="#attr.document.documentProcessed == 0">
                                                    <s:url var="checkDocumentUrl" action="checkDocument">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                        <i class="fa fa-square-o"></i>
                                                    </s:a>
                                                </s:if>

                                                <s:else>
                                                    <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                        <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                    </s:url>
                                                    <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                        <i class="fa fa-check-square-o"></i>
                                                    </s:a>
                                                </s:else>
                                                &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                                <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                            </display:column>
                                        </td>--%>

                                        <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                        </display:column>
                                        </td>

                                        <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                            style="text-align: center;" > </i></display:column></td>--%>

                                        <td>
                                            <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                                <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                    <i class="fa fa-print"></i>
                                                </a>
                                                <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                                <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                            </display:column>--%>
                                            <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                                <i class="fa fa-ban"></i>
                                            </display:column>
                                        </td>

                                    </display:table>
                                </div>
                            </div>

                    </div>
                    <%--FINAL SET OUTBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="finalOutbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="finalOutboundEntityList" requestURI="orderDocumentsInput.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    <td>
                                        <%--<display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>--%>
                                    </td>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>--%>

                                    <td>
                                        <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>--%>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                            <i class="fa fa-ban"></i>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>
                    <%--FINAL SET INBOUND DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="finalInbound">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="finalInboundEntityList" requestURI="orderDocumentsInput.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    <%--<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>--%>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>--%>

                                    <td>
                                        <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>--%>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                            <i class="fa fa-ban"></i>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>
                    <%--ARCHIVE BEGIN--%>
                    <div class="tab-pane fade" id="archive">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="archiveEntityList" requestURI="orderDocumentsInput.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    <%--<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>--%>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>--%>

                                    <td>
                                        <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>--%>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                            <i class="fa fa-ban"></i>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>
                    <%--BILLING DOCUMENTS BEGIN--%>
                    <div class="tab-pane fade" id="billing">

                        <div class="panel-body">

                            <div class="table-responsive">
                                <display:table id="InboundDocument" name="billingEntityList" requestURI="orderDocumentsInput.action" pagesize="10" class="table table-striped table-hover table-bordered text-center tablesorter"
                                               style="margin-top: 15px; visibility:hidden;">

                                    <%--<td>
                                        <display:column title="" class="tb-font-black" style="text-align: center;" >
                                            <s:if test="#attr.document.documentProcessed == 0">
                                                <s:url var="checkDocumentUrl" action="checkDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{checkDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-square-o"></i>
                                                </s:a>
                                            </s:if>

                                            <s:else>
                                                <s:url var="uncheckDocumentUrl" action="unCheckDocument">
                                                    <s:param name="documentIdParam" value="%{#attr.document.documentId}"></s:param>
                                                </s:url>
                                                <s:a class="icon-action-link" href="%{uncheckDocumentUrl}" rel="tooltip" title ="Edit Booking">
                                                    <i class="fa fa-check-square-o"></i>
                                                </s:a>
                                            </s:else>
                                            &lt;%&ndash;<s:property value="%{#attr.document.documentProcessed}"/>&ndash;%&gt;
                                            <input type="hidden" id="documentProcess" value="${document.documentProcessed}" name="documentNameParam"/>

                                        </display:column>
                                    </td>--%>

                                    <td><display:column property="documentName" title="Document Name" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                    </td>

                                    <td><display:column property="referenceNumber" title="Reference Number" class="tb-font-black" style="text-align: center;">
                                </display:column>
                                </td>

                                <td><display:column property="documentStatus" title="Status" class="tb-font-black" style="text-align: center;">
                                    </display:column>
                                 </td>

                                    <%--<td><display:column property="documentStatus" title="Status" class="tb-font-black"
                                                        style="text-align: center;" > </i></display:column></td>--%>

                                    <td>
                                        <%--<display:column title="Action" class="tb-font-black" style="text-align: center;" > </i>
                                            <a href="#" onclick="generateReport(${document.documentId},'${document.documentName}');">
                                                <i class="fa fa-print"></i>
                                            </a>
                                            <input type="hidden" id="action_${document.documentId}" value="${document.documentId}" name="documentIdParam"/>
                                            <input type="hidden" id="action_${document.documentName}" value="${document.documentName}" name="documentNameParam"/>
                                        </display:column>--%>
                                        <display:column title="Action" class="tb-font-black" style="text-align: center;" >
                                            <i class="fa fa-ban"></i>
                                        </display:column>
                                    </td>

                                </display:table>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<%--<div class="modal fade" id="addReferenceNumber" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Add Reference Number</h4>
            </div>
            <div class="modal-body">
                <p>Add Reference Number to the document</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                &lt;%&ndash;<button type="button" class="btn btn-primary" onclick="location.href='viewOrders'">Yes</button>&ndash;%&gt;
                <s:property value="#attr.document.documentId"/>
                <s:url var="addReferenceNumberUrl" action="addReferenceNumber">
                    <s:param name="documentIdParam" value="#attr.document.documentId"></s:param>
                </s:url>
                <s:a class="icon-action-link" href="%{addReferenceNumberUrl}" rel="tooltip">
                    <button type="button" class="btn btn-primary">Yes</button>
                </s:a>
            </div>
        </div>
    </div>
</div>--%>

<script>

$(document).ready(function() {
    /*Disables the edit icon on house documents*/
    /*var tbl = document.getElementById("document");
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {

            if (tbl.rows[i].cells[0].innerHTML == "HOUSE BILL OF LADING") {
                *//*tbl.rows[i].cells[3].innerHTML= "<i class='fa fa-ban'></i>";*//*
                tbl.rows[i].cells[3].getElementById("edit-icon").style.display="none";
                *//*$("#edit-icon").css("display", "none");*//*

                *//*var test = tbl.rows[i].cells[3].getElementById("edit-icon");
                alert(test);*//*
            }

        }
    }*/

if (tbl==null){
    $("#first").toggleClass('active complete');
    $("#second").toggleClass('disabled active');
}

    /*var tbl = document.getElementById("document");
    if (tbl != null) {
        for (var i = 0; i < tbl.rows.length; i++) {
            if (tbl.rows[i].cells[0].innerHTML == "0") {
                tbl.rows[i].cells[0].innerHTML= "<i class='fa fa-square-o'></i>";
            }
        }
    }*/

});

    /*function generateReport(documentId,documentName) {
 if (documentName == "BOOKING REQUEST FORM") {
 var win = window.open('documentations/generateBookingRequestReport?documentIdParam=' + documentId, 'bookingRequest', 'width=910,height=800');
 win.onload = function () {
 this.document.title = "Booking Request Form";
 }
 }
 else if (documentName == "HOUSE BILL OF LADING") {
 var win = window.open('documentations/generateBillofLadingReport?documentIdParam=' + documentId, 'HouseBillofLading', 'width=910,height=800');
 win.onload = function () {
 this.document.title = " House Bill of Lading";
 }
 }
 else if (documentName == "HOUSE WAYBILL ORIGIN") {
 var win = window.open('documentations/generateHouseWayBillReport?documentIdParam=' + documentId, 'HouseWayBillOrigin', 'width=910,height=800');
 win.onload = function () {
 this.document.title = " House Way Bill Origin";
 }
 }
 else if (documentName == "HOUSE WAYBILL DESTINATION") {
 var win = window.open('documentations/generateHouseWayBillDestinationReport?documentIdParam=' + documentId, 'HouseWayBillDestination', 'width=910,height=800');
 win.onload = function () {
 this.document.title = " House Way Bill Destination";
 }
 }
 else if (documentName == "ACCEPTANCE RECEIPT") {
 var win = window.open('documentations/generateAcceptanceReceiptReport?documentIdParam=' + documentId, 'Acceptance Receipt', 'width=910,height=800');
 win.onload = function () {
 this.document.title = " Acceptance Receipt";
 }
 }
 }*/

    /*function generateReleaseOrderReport(){

        var win = window.open('documentations/generateReleaseOrderReport','bookingRequest','width=910,height=800');
        win.onload = function() { this.document.title = "Release Order"; }

    }
*/

function OutboundProgress(){
    document.getElementById("out").className='active';
    document.getElementById("in").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
}

function InboundProgress(){
    document.getElementById("in").className='active';
    document.getElementById("out").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='';
    document.getElementById("fiOut").className='';
    document.getElementById("fiIn").className='';
}

function finalOutboundProgress(){
    document.getElementById("out").className='';
    document.getElementById("in").className='';
    document.getElementById("arch").className='';
    document.getElementById("bill").className='';
    document.getElementById("fiOut").className='active';
    document.getElementById("fiIn").className='';
    }

function finalInboundProgress() {
    document.getElementById("out").className = '';
    document.getElementById("in").className = '';
    document.getElementById("arch").className = '';
    document.getElementById("bill").className = '';
    document.getElementById("fiOut").className = '';
    document.getElementById("fiIn").className = 'active';
}

function archiveProgress() {
    document.getElementById("out").className = '';
    document.getElementById("in").className = '';
    document.getElementById("arch").className = 'active';
    document.getElementById("bill").className = '';
    document.getElementById("fiOut").className = '';
    document.getElementById("fiIn").className = '';
}

function BillingProgress() {
    document.getElementById("out").className = '';
    document.getElementById("in").className = '';
    document.getElementById("arch").className = '';
    document.getElementById("bill").className = 'active';
    document.getElementById("fiOut").className = '';
    document.getElementById("fiIn").className = '';
}

</script>