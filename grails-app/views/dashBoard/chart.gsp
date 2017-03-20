<html>
    <head>
        <asset:stylesheet src='bootstrap.css'/>
    </head>
    <body>
    <div class="panel panel-default">
        <div class="panel-heading">Doughnut chart using displayChart() and data_1 controller action</div>
        <div class="panel-body">
            <button type="button" class="btn" onClick="displayChart('/dashBoard/data_1', '#invoice_status_chart_1')">Display Chart</button>
            <div id="content" role="main" style="padding: 20px">
                <canvas id="invoice_status_chart_1" width="200" height="200"></canvas>
            </div>
        </div>
    </div>
    <asset:javascript src='jquery-2.2.0.min.js'/>
    <asset:javascript src='bootstrap.js'/>
    <asset:javascript src='Chart.min.js'/>
    <asset:javascript src='doughnut.js'/>
    </body>
</html>