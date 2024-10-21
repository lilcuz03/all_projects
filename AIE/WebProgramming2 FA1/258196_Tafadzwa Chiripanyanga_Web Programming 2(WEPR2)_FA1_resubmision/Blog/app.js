// app.js
angular.module('myApp',['ngRoute'])
.controller('addBlogController',addBlogController)
.controller('showBlogController',showBlogController)
.service('blogService',blogService)
.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){
    $locationProvider.html5Mode(true);
    $routeProvider
    .when('/home',{
        templateUrl:'partials/home.html',

    })
    .when('/form',{
        templateUrl:'partials/form.html',
        controller:'addBlogController'
    })
    .when('/views',{
        templateUrl:'partials/views.html',
        controller:'showBlogController'

    })
    .otherwise({
        redirectTo:'/home'
    })

}])


//addController
addBlogController.$inject =['blogService']
function addBlogController(blogService){
    let adder = this;
    adder.postTitle ='';
    adder.postContent='';
    adder.postDate ='';

    adder.addBlog = ()=>{
        blogService.addBlog(adder.postTitle,adder.postContent,adder.postDate)
    }
}

//showController
showBlogController.$inject =['blogService','$http']
function showBlogController(blogService,$http){
    let show = this ;
    show.blogPosts =blogService.getblogPosts();

    $http.get('data/blog.json').then((response)=>{
        show.blogPosts =blogService.getblogPosts().concat(response.data);
    })
}



//blogService
function blogService(){
    let service = this;

    let blogPosts = []
    service.addBlog = (postTitle,postContent,postDate)=>{
        let blogPost ={
            Title:postTitle,
            Content:postContent,
            Date:postDate
        }
        blogPosts.push(blogPost);
        service.getblogPosts = ()=>{
            return blogPosts;
        }
    }
    service.getblogPosts = ()=>{
        return blogPosts;
    }
}
