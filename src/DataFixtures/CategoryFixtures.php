<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\Category;

class CategoryFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        echo "Chargement des fixtures...\n";
        for ($i = 1; $i <= 10; $i++) {
            $category = new Category();
            $category->setName("Nom de la catégorie n°$i")
                ->setIcon("http://placehold.it/350x150");
            $manager->persist($category);
        }
        $manager->flush();
    }
}
