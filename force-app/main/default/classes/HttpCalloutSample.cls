public class HttpCalloutSample {

    // Pass in the endpoint to be used using the string url
    //assuming that endpoint url is 'https://th-apex-http-callout.herokuapp.com/animals'
    public void getCalloutResponseContents(String url) {
  
      // Instantiate a new http object
      Http h = new Http();
  
       // Instantiate a new HTTP request, 
       //specify the method (GET) as well as the endpoint
      HttpRequest req = new HttpRequest();
      req.setEndpoint(url);
      req.setMethod('GET');
  
      // Send the request, and return a response
      HttpResponse res = h.send(req);
      // If the request is successful, parse the JSON response.
      if (response.getStatusCode() == 200) {
        // Deserialize the JSON string into collections of primitive data types.
        //the key animals is mapped to list of String
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        // Cast the values in the 'animals' key as a list
        List<Object> animals = (List<Object>) results.get('animals');
        System.debug('Received the following animals:');
        for (Object animal: animals) {
            System.debug(animal);
        }
      }
    }

    //assuming that endpoint url is 'https://th-apex-http-callout.herokuapp.com/animals'
    public void postCalloutResponseContents(String url) {
  
        // Instantiate a new http object
        Http h = new Http();
    
         // Instantiate a new HTTP request, 
         //specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('POST');
    
        //request Content-Type header is set to let the service know that 
        //the sent data is in JSON format so that it can process the data appropriately. 
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        // Set the body as a JSON object
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }
}



