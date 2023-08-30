package org.vti.frontend;

import org.vti.entity.abstraction.News;
import java.util.Scanner;
public class MyNews {
    public static void main(String[] args) {
        News news = new News();
        Scanner sc = new Scanner(System.in);
        int choice;
        do {
            System.out.println("Menu:");
            System.out.println("1. Insert news");
            System.out.println("2. View list news");
            System.out.println("3. Average rate");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();
            switch (choice) {
                case 1:
                    sc.nextLine();
                    System.out.print("Enter title: ");
                    String title = sc.nextLine();
                    news.setTitle(title);
                    System.out.print("Enter publish date: ");
                    String publishDate = sc.nextLine();
                    news.setPublishDate(publishDate);
                    System.out.print("Enter author: ");
                    String author = sc.nextLine();
                    news.setAuthor(author);
                    System.out.print("Enter content: ");
                    String content = sc.nextLine();
                    news.setContent(content);
                    int[] rates = new int[3];
                    for (int i = 0; i < 3; i++) {
                        System.out.print("Enter rate " + (i + 1) + ": ");
                        rates[i] = sc.nextInt();
                    }
                    news.setRates(rates);
                    break;
                case 2:
                    news.display();
                    break;
                case 3:
                    news.calculate();
                    news.display();
                    break;
                case 4:
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        } while (choice != 4);
    }
}
