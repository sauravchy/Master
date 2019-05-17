<%@ page import="canvas.SignedRequest" %>
<%@ page import="java.util.Map" %>
<%
    // Pull the signed request out of the request body and verify/decode it.
   Map<String, String[]> parameters = request.getParameterMap();
   System.out.println("output"+parameters);
   String[] signedRequest = parameters.get("signed_request");

	String yourConsumerSecret="8400572405209334971";
	String signedRequestJson ="";
    if (signedRequest != null) {
     signedRequestJson = SignedRequest.verifyAndDecodeAsJson(signedRequest[0], yourConsumerSecret); }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>

    <title>Hello World Canvas Example</title>

    <link rel="stylesheet" type="text/css" href="/sdk/css/canvas.css" />

    <!-- Include all the canvas JS dependencies in one file -->
    <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>
    <!-- Third part libraries, substitute with your own -->
    <script type="text/javascript" src="/scripts/json2.js"></script>

  
</head>
  
<body onload="test()">
    <br/>
	 <img src="https://codemachine-dev-ed--c.ap5.content.force.com/sfc/dist/version/renditionDownload?rendition=ORIGINAL_Png&amp;versionId=0687F00000VVAT2&amp;operationContext=DELIVERY&amp;contentId=05T7F00001ciKMF&amp;page=0&amp;d=/a/7F000000gbow/h82aBHeZdSpVLMFfmNiSSOH4KKWJw_1BGwAZURP5a6g&amp;oid=00D7F000002bpRC&amp;dpt=null&amp;viewId=" alt="AgraMeetup" class="pageImg">
	 <h1>Welcome Trailblazers to AgraMeetup </span></h1>

	
	
	
<script>
    function test() {
		debugger;
	
			var sr = JSON.parse('<%=signedRequestJson%>');
			debugger;
			Sfdc.canvas.oauth.token(sr.client.oauthToken);
			var parameters = sr.context.environment.parameters;
			console.log('Canvas parameter :'+parameters.name);
		
		
	}
</script>
</body>
</html>
