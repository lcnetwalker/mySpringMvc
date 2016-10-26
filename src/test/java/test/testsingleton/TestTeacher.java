package test.testsingleton;

import com.springstudy.service.test.singleton.Teacher;

/**
 * Created by xgjt on 15/8/11.
 */
public class TestTeacher {
    public static void main(String[] args) {
        Teacher teacher1 = Teacher.getTeacher();
        Teacher teacher2 = Teacher.getTeacher();

        System.out.println(teacher1==teacher2);
        teacher1.love();
        teacher2.love();
    }

}
