<?php

namespace App\Controller;

use App\Controller\Common\ControllerInterface as CInterface;

class HomeController extends Controller{

    public function show(){

        $sql = "SELECT * FROM cards";
        
        $datas =  $this->getData($sql);
        $introduction = "ceci est l'introduction de ma page.";

        $arrayToTemplate = ['title' => 'webstart_bar', 'introduction' => $introduction ,'card' => $datas];

        $this->render($arrayToTemplate, 'home');
        
    }

}
