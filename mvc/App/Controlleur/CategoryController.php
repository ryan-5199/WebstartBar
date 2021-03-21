<?php

namespace App\Controller;

class CategoryController extends Controller{

    public function show(){

        $categorie = $this->getData('SELECT title FROM category WHERE id='.$_GET['id']);
        
        $products = $this->getProducts();

        $arrayToTemplate = ['title' => $categorie[0]['title'], 'products' => $products];

        $this->render($arrayToTemplate, 'category');

    }


    private function getProducts(){

        $sql = "SELECT * FROM product p WHERE category_id='".$_GET['id']."'";

        $results = $this->getData($sql);
        
        return $results;
        
        
    }
}