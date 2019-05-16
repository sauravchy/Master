<%@ page import="canvas.SignedRequest" %>
<%@ page import="java.util.Map" %>
<%
    // Pull the signed request out of the request body and verify/decode it.
   Map<String, String[]> parameters = request.getParameterMap();
   System.out.println("output"+parameters);
   String[] signedRequest = parameters.get("signed_request");
   if (signedRequest == null) {%>This App must be invoked via a signed request!<%
        return;
    }
	String yourConsumerSecret="8400572405209334971";
   <!-- String signedRequestJson = SignedRequest.verifyAndDecodeAsJson(signedRequest[0], yourConsumerSecret);-->
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
	 
    <h1>UserName :  <span id='username'></span></h1>

	
	
	
<script>
    function test() {
		//debugger;
		
	}
</script>

</body>
</html>
