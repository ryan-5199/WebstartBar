<?php

namespace App\Controller;

class ProductController extends Controller{ 
    
    public function show(){

        if(!isset($_GET['id']))
            Header('Location: '.WEBSITE_URL);

        echo "je suis dans le produit ".$_GET['id'];

        
    }


}