public class RecipesAPI {

@AuraEnabled
public static void getRecipes(String recipesID){
    HTTP http = new HTTP();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://api.spoonacular.com/recipes/'+recipesID+'/information?includeNutrition=true&apiKey=3f2ae1dcfbfa46f0bded2cce495e115e');
    req.setMethod('GET');
     req.setHeader('Content-Type', 'application/json');
    HTTPRESPONSE resp = http.send(req);
    System.debug(resp.getBody());
}
}