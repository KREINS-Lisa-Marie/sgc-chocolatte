<?php

class HomeController extends BaseController
{
    public function show()
    {



        return $this->view('home', [
            'pre' => 'Bienvenue chez',
            'title' => 'Chocolatte',
            'employees' => Employee::getHomepageEmployees(),
        ]);
    }
}
