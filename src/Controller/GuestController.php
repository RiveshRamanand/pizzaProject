<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Pizza;
use App\Form\OrderType;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Tests\Models\Enums\Product;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class GuestController extends AbstractController
{
    #[Route('/', name: 'app_guest')]
    public function index(EntityManagerInterface $em): Response
    {
        $categories = $em->getRepository(Category::class)->findAll();
        return $this->render('guest/index.html.twig', [
            'categories' => $categories,
        ]);
    }

    #[Route('/aboutme', name: 'about.me')]
    public function about(): Response
    {
        return $this->render('guest/about.html.twig', [
            'controller_name' => 'GuestController',
        ]);
    }

    #[Route('/category/{id}', name: 'category')]
    public function show(EntityManagerInterface $entityManager, int $id): Response
    {
        $category = $entityManager->getRepository(Category::class)->find($id);

        if (!$category) {
            throw $this->createNotFoundException(
                'No product found for id ' . $id
            );
        }
        return $this->render('guest/category.html.twig', ['category' => $category]);

    }

    #[Route('/contactus', name: 'contact_us')]
    public function contact(): Response
    {
        
        return $this->render('guest/contact.html.twig', [
            'controller_name' => 'GuestController',
        ]);

    }

    #[Route('/bestellen', name: 'bestel_pagina')]
    public function bestel(Request $request, EntityManagerInterface $entityManager): Response
    {
        $orders = $entityManager->getRepository(Order::class)->findAll();
        return $this->render('guest/bestel.html.twig', [
            'orders' => $orders,
        ]);
    }


    #[Route('/order-insert/{id}', name: 'order_type')]
    public function new(Request $request, EntityManagerInterface $entityManager, int $id): Response
    {
        $order = new Order();
        $form = $this->createForm(OrderType::class, $order);
        $form->handleRequest($request);
        $pizza = $entityManager->getRepository(Pizza::class)->find($id);

        if ($form->isSubmitted() && $form->isValid()) {
            $size = $order->getSize();
            $order = $form->getData();
            $extraprice = 0;
            if ($size === 'Medium') {
                $extraprice = 2;
            } elseif ($size === 'Calzone') {
                $extraprice = 4;
            }
            $totalprice = $pizza->getPrice() + $extraprice;
            $order->setPrice($totalprice);
            $entityManager->persist($order);
            $entityManager->flush();
            $this->addFlash('success', 'Bestelling voltooid');
            return $this->redirectToRoute('bestel_pagina');
        }
        return $this->render('guest/order.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/delete-product/{id}', name: 'delete_product')]
    public function deleteProduct(EntityManagerInterface $em, int $id): Response
    {
            $order = $em->getRepository(Order::class)->find($id);
            $em->remove($order);
            $em->flush();
            $this->addFlash('danger', 'Bestelling verwijdert');
            return $this->redirectToRoute('bestel_pagina');

        }

}

