package test.testsingleton;

import com.springstudy.service.test.singleton.Student;

/**
 * Created by xgjt on 15/8/11.
 */
public class TestSingleton {
    public static void main(String[] args) {
//        Student student1 = new Student();
//        Student student2 = new Student();
//        System.out.println(student1==student2);


        
        Student student1 = Student.getStudent();
        Student student2 = Student.getStudent();

        System.out.println("单例模式：验证是否为同一个对象" + (student1==student2));

        student1.show();
        student2.show();


    }
}
