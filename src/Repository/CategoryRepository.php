<?php

namespace App\Repository;

use App\Entity\Category;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Category>
 */
class CategoryRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Category::class);
    }

    /**
     * @return Category[] Returns an array of Category objects
     */
    public function findAllCategories(): array
    {
        return $this->findAll(); // Renvoie toutes les catégories
    }

    /**
     * @return Category[] Returns an array of Category objects filtered by a specific field
     */
    public function findByField($field, $value): array
    {
        return $this->createQueryBuilder('c')
            ->andWhere("c.$field = :val")
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->getQuery()
            ->getResult();
    }

    /**
     * @return Category|null Returns a single Category object or null
     */
    public function findOneByField($field, $value): ?Category
    {
        return $this->createQueryBuilder('c')
            ->andWhere("c.$field = :val")
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult();
    }
}
