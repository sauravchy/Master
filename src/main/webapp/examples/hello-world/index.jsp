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
	
    <h1>Hello   <span id='username'></span></h1>
	
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
	<div class="canvas-app">
    <img src="nodejs.png"/>
    <p>Hello, <%= context.user.firstName %>. This is a web app written in Node.js embedded in your Salesforce page (It could also be written in any other language).</p>
    <p>It is aware of its environment. For example, here are a few things it knows:</p>
    <table>
        <tr><td>User:</td><td><%= context.user.fullName %></td></tr>
        <tr><td>Object:</td><td><%= context.environment.record.attributes.type %></td></tr>
        <tr><td>Id:</td><td><%= context.environment.record.Id %></td></tr>
    </table>
    <p>It can also access more data in Salesforce using the REST APIs. With context and APIs, Canvas makes it easy to integrate applications written in any language inside your Salesforce pages.</p>
    <p>For example, the QR Code below is generated in Node.js. Scan it to create a contact on your mobile phone:</p>
    <%- imgTag %>
</div>
</body>
</html>
