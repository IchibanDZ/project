<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Tool;
use App\Form\BorrowingType;
use Doctrine\Persistence\ManagerRegistry;

class BorrowController extends AbstractController
{
    #[Route('/borrow/{id?}', name: 'app_borrow')]
    public function index(?int $id, ManagerRegistry $doctrine): Response
    {
        // Si aucun ID n'est passé, on redirige ou affiche un message
        if (!$id) {
            return $this->render('borrow/no_tool.html.twig', [
                'message' => 'Aucun outil sélectionné.',
            ]);
        }

        // Récupérer l'outil sélectionné depuis la base de données
        $selectedTool = $doctrine->getRepository(Tool::class)->find($id);

        // Si l'outil n'est pas trouvé, on affiche une erreur
        if (!$selectedTool) {
            throw $this->createNotFoundException('Outil non trouvé');
        }

        // Créer un formulaire pour emprunter l'outil
        $formulaire = $this->createForm(BorrowingType::class);

        // Rendre le template en passant la variable `selectedTool` et le formulaire
        return $this->render('borrow/index.html.twig', [
            'selectedTool' => $selectedTool,
            'formulaire' => $formulaire->createView(),
        ]);
    }
}
