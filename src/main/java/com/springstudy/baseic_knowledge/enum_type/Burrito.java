package com.springstudy.baseic_knowledge.enum_type;

/**
 * Created by xgjt on 15/8/19.
 */
public class Burrito {
    Spiciness degree;

    public Burrito(Spiciness degree) {
        this.degree = degree;
    }

    public void Describe() {
        System.out.print("this burrito is : ");
        switch (degree) {
            case NOT:
                System.out.println("not spicy at all.");
                break;
            case MILD:
            case MEDIUM:
                System.out.println("a little hot.");
                break;
            case HOT:
            case FLANMING:
            default:
                System.out.println("maybe too hot.");
        }
    }

    public static void main(String[] args) {
        /**
         * 连续声明
         */
        Burrito
                plain = new Burrito(Spiciness.NOT),
                greenChile = new Burrito(Spiciness.MEDIUM),
                jalapeno = new Burrito(Spiciness.HOT);

        plain.Describe();
        greenChile.Describe();
        jalapeno.Describe();

    }

}
