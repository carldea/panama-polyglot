import static org.rust.lib_h.*;

public class Main {
    public static void main(String[] args) {
        System.out.println("Rust getting process id = " + rust_get_pid());
    }
}
