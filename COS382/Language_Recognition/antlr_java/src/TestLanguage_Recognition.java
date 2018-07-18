import org.antlr.v4.runtime.*;

import java.io.FileInputStream;

public class TestLanguage_Recognition {
    public static void main(String[] args) throws Exception {
        FileInputStream inputstream = new FileInputStream("test.txt");
        ANTLRInputStream input = new ANTLRInputStream(inputstream);

        //ANTLRInputStream input = new ANTLRInputStream(System.in);

        languageLexer lexer = new languageLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        languageParser parser = new languageParser(tokens);
        parser.scripture(); // parse the input stream starting at rule s
    }
}
