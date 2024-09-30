const express = require('express')
const app = express()
app.set('view engine','ejs');
const mongoose = require('mongoose');
app.use(express.static('public'));
const Blog = require('./models/blog')
const dbURI = 'mongodb+srv://taffy:Horizontal@cluster0.zaejtoj.mongodb.net/blogsDataBase?retryWrites=true&w=majority&appName=Cluster0';

mongoose.connect(dbURI)
.then((results) => app.listen(3000))
.catch((err)=> console.log(err));

app.get('/add-blog', (req,res)=>{
    const blog = new Blog({
        title: 'new blog 2',
        snippet: 'about my new blog',
        body: 'more about my new blog'
    });
    blog.save()
    .then((result)=>{
        res.send(result)

    })
    .catch((err)=>{
        console.log(err);
    });
});

app.get('/all-blogs',(req,res)=>{
    Blog.find()
    .then((result)=>{
        res.send(result);
    })
    .catch((err)=>{
        console.log(err)
    })

})


// const blogs = [
//     {
//         title: "How to Build a React App from Scratch",
//         author: "John Doe",
//         content: "In this tutorial, we'll go through the steps of building a React application...",
//         date: "2024-04-20",
//         tags: ["React", "JavaScript", "Web Development"]
//     },
//     {
//         title: "10 Tips for Effective Time Management",
//         author: "Jane Smith",
//         content: "Managing your time effectively is crucial for productivity. Here are 10 tips to help you...",
//         date: "2024-04-18",
//         tags: ["Time Management", "Productivity"]
//     },
//     {
//         title: "Introduction to Machine Learning",
//         author: "Alex Johnson",
//         content: "Machine learning is a fascinating field with many applications. Let's dive into the basics...",
//         date: "2024-04-15",
//         tags: ["Machine Learning", "Artificial Intelligence"]
//     }
// ];



app.get('/',(req,res)=>{
    res.render('index',{title:'Home'})
})
app.get('/about',(req,res)=>{
    res.redirect('/blogs')
})
app.get('/newBlog',(req,res)=>{
    res.render('newBlog',{ title:'New Blog'});
});

app.get('/blogs',(req,res)=>{
    Blog.find()
    .then((result)=>{
        res.render('about',{title:'all blogs', blogs:result})
    })
    .catch(err=>console.log(err))
})

app.use((req,res)=>{
    res.status(404).render('404');
})


