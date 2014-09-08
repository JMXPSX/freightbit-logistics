<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<div class="row" style="margin-top:-15px;">

    <h1><i class="fa fa-truck"></i> Inland Freight Operations</h1>

    <s:if test="hasActionMessages()">
        <div class="col-lg-12">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <strong><s:actionmessage cssStyle="margin-bottom: 0px;"/></strong>
            </div>
        </div>
    </s:if>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Inland Freight Operations

                    </h3>
                </div>



                <div class="panel-body">
                    <s:hidden value="%{orderNoParam}" />
                    <div class="table-responsive">
                        <display:table id="orderItem" name="orderItems"
                                       requestURI="/viewSeaFreightItemList.action" pagesize="10"
                                       class="table table-striped table-hover table-bordered text-center tablesorter table-condensed"
                                       style="margin-top: 15px;">

                            <td><display:column property="nameSize" title="Name <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column property="status" title="Status <i class='fa fa-sort' />" class="tb-font-black"
                                                style="text-align: center;"> </display:column></td>

                            <td><display:column title="Action">

                                <s:url var="viewFreightPlanningUrl" action="viewFreightPlanning">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderItem.orderItemId">
                                            </s:param>
                                    <s:param name="orderNoParam"
                                             value="orderNoParam">
                                             </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewFreightPlanningUrl}" rel="tooltip"
                                     title="Update Status">
                                    <i class="fa fa-edit"></i>
                                </s:a>

                                <s:url var="viewInfoUrl" action="viewInfo">
                                    <s:param name="orderItemIdParam"
                                             value="#attr.orderItem.orderItemId">
                                    </s:param>
                                    <s:param name="orderNoParam"
                                             value="orderNoParam">
                                    </s:param>
                                </s:url>
                                <s:a class="icon-action-link" href="%{viewInfoUrl}" rel="tooltip"
                                     title="Show Information">
                                    <i class="fa fa-info-circle"></i>
                                </s:a>

                            </display:column></td>

                        </display:table>
                    </div>
                </div>

                <div class="panel-footer">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="booking2.html">2</a></li>
                        <li><a href="booking2.html">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>

<script>

    $(document).ready(function() {
        /*color coding of rows*/
        var tbl = document.getElementById("orderItem");
        if (tbl != null) {
            for (var i = 0; i < tbl.rows.length; i++) {

                if (tbl.rows[i].cells[1].innerHTML == "PLANNING 1") {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#fcf8e3";
                    }
                }

                if (tbl.rows[i].cells[1].innerHTML == "PLANNING 2") {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#f2dede";
                    }
                }

                if (tbl.rows[i].cells[1].innerHTML == "PLANNING 3") {
                    /*tbl.rows[i].cells[6].style.backgroundColor="#fcf8e3";*/
                    for (var j = 0; j < tbl.rows[i].cells.length; j++) {
                        tbl.rows[i].cells[j].style.backgroundColor = "#dff0d8";
                    }
                }
            }
        }

    });

</script>