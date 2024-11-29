<?php

class Employee extends BaseModel
{
    public function homepageEmployees()
    {
        return $this->get('select `name`, `job`, `description`, `img` FROM `employees` order by `name` ASC LIMIT 4;');
    }
}