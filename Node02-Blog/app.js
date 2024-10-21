const express = require('express')
const app = express()
app.set('view engine', 'ejs')
app.use(express.static('public'))
const Blog = require('./models/blogs')
app.use(express.urlencoded({extended:true}))

// connecting to dataBase 
const mongoose = require('mongoose')
const dbURL = 'mongodb+srv://taffy:Horizontal@cluster0.zaejtoj.mongodb.net/blogsDataBase?retryWrites=true&w=majority&appName=Cluster0'

mongoose.connect(dbURL)
.then(result => app.listen(3000))
.catch(err => console.log(err))

// routing 
app.get('/',(req,res)=> res.render('index',{title:'home'}))
app.get('/about',(req,res)=> res.render('about',{title:'about'}))
app.get('/form',(req,res)=> res.render('form',{title:'form'}))
app.get('/blogs',(req,res)=>res.redirect('/all-blogs'))

// blog routing 
app.get('/all-blogs',(req,res)=>{
    Blog.find()
    .then(result => res.render('blogs',{title:'blogs',blogs:result}))
    .catch(err => console.log(err))
})

app.get('/details/:id',(req,res)=>{
    const id = req.params.id
    Blog.findById(id)
    .then(result => res.render('details',{title:`blog/${id}`,blog:result}))
    .catch(err => console.log(err))
})

// posting 
app.post('/form',(req,res)=>{
    const blog = new Blog(req.body)
    blog.save()
    .then(result => res.redirect('/blogs'))
    .catch(err => console.log(err))
})

// delete
app.delete('/blog/:id',(req,res)=>{
    const id = req.params.id
    Blog.findByIdAndDelete(id)
    .then(result =>res.json({redirect:'/blogs'}))
    .catch(err => console.log(err))
})


// 404 routing 
app.use((req,res)=>res.status(404).render('404',{title:'error 404,page not found'}))