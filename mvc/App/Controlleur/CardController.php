<?php

namespace App\Controller;


class CardController extends Controller{

    public function show(){

        $card = $this->getData('SELECT title FROM cards WHERE id='.$_GET['id']);
        
        $category = $this->getCategory();

        $arrayToTemplate = ['title' => $card[0]['title'], 'category' => $category];

        $this->render($arrayToTemplate, 'card');

    }


    private function getCategory(){

        $sql = "SELECT * FROM category p WHERE card_id='".$_GET['id']."'";

        $results = $this->getData($sql);
        
        return $results;
        
        
    }
}