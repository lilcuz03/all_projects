angular.module('myApp',['ngRoute'])
.controller('myController',myController)
.service('myService',myService)

.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){
    $locationProvider.html5Mode(true);
    $routeProvider
    .when('/home', {
        templateUrl: 'partials/home.html'
    })
    .when ('/form', {
        templateUrl: 'partials/form.html',
        controller:'myController'
    })
    .otherwise({
        redirectTo: '/home'
    });
}]);


myController.$inject=['myService', '$http'];
function myController(myService,$http){
    let adder = this ;
    adder.name ='';
    adder.city ='';

    adder.addItems = ()=>{
        myService.addItems(adder.name,adder.city);
    }
   

    $http.get('data/items.json').then(function(response){
         adder.items = myService.getItems().concat(response.data);
        // adder.items = response.data;
    });
};

function  myService(){
    let service = this;
    let items = [];
    service.addItems =(name ,city)=>{
        let item = {
            Name: name,
            City: city
        }
        items.push(item);
    }
    service.getItems = ()=>{
        return items ;
    }

    // $http.get('data/items.json').success(function(data){
    //     items = data;
    // });
}