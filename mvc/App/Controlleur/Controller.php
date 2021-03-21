<?php

namespace App\Controller;

use App\Controller\Common\ControllerInterface as CInterface;

abstract class Controller  {

    protected function getData(string $sql): array{

        $pdo = new \PDO('mysql:dbname=webstart_bar;host=localhost', 'ryan','ryan');
        $pdo->setAttribute(\PDO::ATTR_EMULATE_PREPARES,false);
        $state = $pdo->prepare($sql);
        
        if (!$state) {
            print_r($pdo->errorInfo());
         }

         $state->execute();
        $results = $state->fetchAll();
        
        return $results;
    }

    protected function render($variables, $template) {
        ob_start();
        extract($variables);
        ob_get_clean();
        Require_once ROOT.'/App/Views/'.$template.'.php';
    }

}