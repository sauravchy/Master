<%@ page import="canvas.SignedRequest" %>
<%@ page import="java.util.Map" %>
<%
    // Pull the signed request out of the request body and verify/decode it.
   Map<String, String[]> parameters = request.getParameterMap();
   String[] signedRequest = parameters.get("signed_request");
   if (signedRequest == null) {%>This App must be invoked via a signed request!<%
        return;
    }
	String yourConsumerSecret="8400572405209334971";
    String signedRequestJson = SignedRequest.verifyAndDecodeAsJson(signedRequest[0], yourConsumerSecret);
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
  
<body>
    <br/>
	 <input id="canvasPublishMessage" value=""/> <button onclick="canvasPublish( document.getElementById('canvasPublishMessage').value )" > Publish </button>
    <h1>UserName :  <span id='username'></span></h1>

	<script>
        if (self === top) {
            // Not in Iframe
            alert("This canvas app must be included within an iframe");
        }
        Sfdc.canvas(function() {
		 var sr = JSON.parse('<%=signedRequestJson%>');
            // Save the token
         Sfdc.canvas.oauth.token(sr.oauthToken);
         Sfdc.canvas.byId('username').innerHTML = sr.context.user.fullName;
		
	    });
    </script>
	
	<script>
    function canvasPublish(message) {
		var sr = JSON.parse('<%=signedRequestJson%>');
            // Save the token
         Sfdc.canvas.oauth.token('00D7F000002bpRC!AQgAQLVAG1y7BWwL_Wf_T2PON2Pr_f_DKbjc.I2SDwty44gRDy3U3bHrHR7Wm4tYozQh6n5SIhxjzTRQLSvezZUJCeQo0Hz1');
		 console.log('oauthToken :'+sr);
        Sfdc.canvas.client.publish( sr.client,{
            name :  'test',
            payload : message
        });
        console.log(' canvas published : ' + message + ' to ' + 'test2' );
    }
</script>

</body>
</html>
