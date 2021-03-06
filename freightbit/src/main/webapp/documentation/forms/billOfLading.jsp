<%--
  Created by IntelliJ IDEA.
  User: Clarence C. Victoria
  Date: 8/11/14
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- MIDDLE -->
<div class="row">
    <div class="col-lg-12">
        <legend style="text-align: left;">
            <span>
                <h1><i class="fa fa-file-text"></i> Bill of Lading</h1>
            </span>
        </legend>
    </div>
    <!-- MAIN BOX -->
</div>
<!-- MAIN BOX -->

<div class="row">
    <div class="panel booking panel-primary">
        <div class="booking panel-heading">
            <i class="fa fa-file-text"></i>
            <span class="booking panel-title">Bill of Lading</span>
        </div>
        <div class="panel-body">
            <div class="table-responsive list-table">

                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="shipper" class="col-sm-2 control-label" style="width:25%;">Shipper</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="shipper"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="consignee" class="col-sm-2 control-label" style="width:25%;">Consignee</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="consignee"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="origin" class="col-sm-2 control-label" style="width:25%;">Origin</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="pu-address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="destination" class="col-sm-2 control-label"
                               style="width:25%;">Destination</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="da-address"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="ref-num" class="col-sm-2 control-label" style="width:25%;">Reference
                            Number</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="ref-num"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="vessel" class="col-sm-2 control-label" style="width:25%;">Vessel</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="vessel"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="voyage" class="col-sm-2 control-label" style="width:25%;">Voyage</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="voyage"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="trucker" class="col-sm-2 control-label" style="width:25%;">Trucker</label>

                        <div class="col-sm-10" style="width:70%;">
                            <input type="text" class="form-control" id="trucker"/>
                        </div>
                    </div>

                    <span class="pull-right" style="margin-right:32px;">
                        <a href="#" class="btn btn-default" id="groups-btn" style="width:70px;">Back</a>
                        <button href="#" class="btn btn-primary" id="groups-btn" style="width:70px;">Save</button>
                    </span>
                    <span class="pull-left" style="margin-right:32px;">
                        <a href="#" class="btn btn-default" id="groups-btn" style="width:70px;"><i class="fa fa-print"></i> Print</a>
                    </span>
                </form>

            </div>
        </div>
    </div>
</div>

