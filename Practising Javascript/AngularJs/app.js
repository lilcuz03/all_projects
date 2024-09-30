angular.module('myApp',['ngRoute'])
.controller('addController', addController)
.controller('showController' , showController)
.service('myService',myService)

.config(['$routeProvider',function($routeProvider){

    // $locationProvider.html5Mode(true);
    $routeProvider
    .when('/home', {
        templateUrl:'views/home.html'
    })
    .when('/directories', {
        templateUrl : 'views/directories.html',
        controller:'showController'
    })
    .when('/form', {
        templateUrl:'views/form.html',
        controller:'addController'
    })
    .otherwise({
        redirectTo:'/directories'
    });
}]);



addController.$inject = ['myService']
function addController(myService){
    let adder = this;
    adder.name = '';
    adder.city ='';

    adder.addItems = ()=>{
        myService.addItems(adder.name,adder.city)
    }
}

showController.$inject =['myService']
function showController(myService){
let show = this;
show.items = myService.getItems();
show.removeItem =(index)=>{
    myService.removeItem(index);
}
}

function myService(){
    let service = this;

    let items = [
        {
            Name: 'Tafadzwa',
            City: 'Durban'
        },
    ];

    service.addItems =(name,city)=>{
        let item ={
            Name:name,
            City:city
        }
        

        items.push(item)
    }

    service.getItems = ()=>{
        return items
    }

    service.removeItem =(index)=>{
        items.splice(index,1);
    }
}