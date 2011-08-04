<%@ Page Title="Agromapas" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="map">
     
    <div style="width:800px; height:600px" id='map'></div>


    <script src='./Lib/OpenLayers.js'></script>
    <script defer="defer" type="text/javascript">
        var map = new OpenLayers.Map('map', { maxResolution: 0.703125 });

        var OSM = new OpenLayers.Layer.OSM();
        map.addLayer(OSM);

        var wmscURL = [
				"http://wmsc1.terrapages.net/getmap?",
				"http://wmsc2.terrapages.net/getmap?",
				"http://wmsc3.terrapages.net/getmap?",
				"http://wmsc4.terrapages.net/getmap?"
			];
        var terrapagesStreetLayer = new OpenLayers.Layer.WMS('TerraPages Street', wmscURL,
				{ layers: 'UnprojectedStreet', format: 'image/jpeg' }, { isBaseLayer: true, visibility: false });
		map.addLayer(terrapagesStreetLayer);

        var wmsIgac = new OpenLayers.Layer.WMS('Departamentos', "http://geoservice.igac.gov.co/IGAC100k?",
                { layers: 'departamentos', srs: 'EPSG:4326', format: 'image/jpeg' }, { isBaseLayer: false });
        map.addLayer(wmsIgac);

        map.addControl(new OpenLayers.Control.LayerSwitcher());
        map.zoomToMaxExtent();
        
    </script> 
</asp:Content>