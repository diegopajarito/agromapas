<%@ Page Title="Agromapas" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Inicia Agromapas
    </h2>

     
    <div style="width:400px; height:400px" id='map'></div>
    <p>
        Esta es la primera línea de código de agromapas
    </p>

    <script src='http://openlayers.org/api/OpenLayers.js'></script>
    <script defer="defer" type="text/javascript">
        var map = new OpenLayers.Map('map', { maxResolution: 0.703125 });
        var wmscURL = [
				"http://wmsc1.terrapages.net/getmap?",
				"http://wmsc2.terrapages.net/getmap?",
				"http://wmsc3.terrapages.net/getmap?",
				"http://wmsc4.terrapages.net/getmap?"
			];
        var terrapagesStreetLayer = new OpenLayers.Layer.WMS('TerraPages Street', wmscURL,
				{ layers: 'UnprojectedStreet', format: 'image/jpeg' }, { isBaseLayer: true });
        map.addLayer(terrapagesStreetLayer);
        map.zoomToMaxExtent();
        
    </script> 
</asp:Content>