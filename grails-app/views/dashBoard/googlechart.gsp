<html>
<head>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>
<body>

    <gvisualization:pieCoreChart elementId="piechart" title="My Daily Activities" width="${450}" height="${300}"
    columns="${col}" data="${data}" />
    <div id="piechart"></div>

    <gvisualization:barCoreChart elementId="barchart" title="bar chart" width="${450}" height="${500}"
    columns="${col}" data="${data}"/>
    <div id="barchart"></div>

    <gvisualization:areaCoreChart elementId="areaCoreChart" title="bar chart" width="${450}" height="${500}"
    columns="${col}" data="${data}"/>
    <div id="areaCoreChart"></div>

    <gvisualization:columnCoreChart elementId="columnChart" title="bar chart" width="${450}" height="${500}"
    columns="${col}" data="${data}"/>
    <div id="columnChart"></div>
    <gvisualization:lineCoreChart elementId="lineCoreChart" title="bar chart" width="${450}" height="${500}"
    columns="${col}" data="${data}"/>
    <div id="lineCoreChart"></div>

    <gvisualization:scatterCoreChart elementId="scatterCoreChart" title="bar chart" width="${450}" height="${500}"
    columns="${col}" data="${data}"/>
    <div id="scatterCoreChart"></div>


</body>
</html>