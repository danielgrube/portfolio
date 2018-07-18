// Generated from C:/Documents/COS382/Language_Recognition/src\language.g4 by ANTLR 4.6
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link languageParser}.
 */
public interface languageListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link languageParser#scripture}.
	 * @param ctx the parse tree
	 */
	void enterScripture(languageParser.ScriptureContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#scripture}.
	 * @param ctx the parse tree
	 */
	void exitScripture(languageParser.ScriptureContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#book}.
	 * @param ctx the parse tree
	 */
	void enterBook(languageParser.BookContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#book}.
	 * @param ctx the parse tree
	 */
	void exitBook(languageParser.BookContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#reference}.
	 * @param ctx the parse tree
	 */
	void enterReference(languageParser.ReferenceContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#reference}.
	 * @param ctx the parse tree
	 */
	void exitReference(languageParser.ReferenceContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#text}.
	 * @param ctx the parse tree
	 */
	void enterText(languageParser.TextContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#text}.
	 * @param ctx the parse tree
	 */
	void exitText(languageParser.TextContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#chapter}.
	 * @param ctx the parse tree
	 */
	void enterChapter(languageParser.ChapterContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#chapter}.
	 * @param ctx the parse tree
	 */
	void exitChapter(languageParser.ChapterContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#verses}.
	 * @param ctx the parse tree
	 */
	void enterVerses(languageParser.VersesContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#verses}.
	 * @param ctx the parse tree
	 */
	void exitVerses(languageParser.VersesContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#length}.
	 * @param ctx the parse tree
	 */
	void enterLength(languageParser.LengthContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#length}.
	 * @param ctx the parse tree
	 */
	void exitLength(languageParser.LengthContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#translation}.
	 * @param ctx the parse tree
	 */
	void enterTranslation(languageParser.TranslationContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#translation}.
	 * @param ctx the parse tree
	 */
	void exitTranslation(languageParser.TranslationContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#ord_num}.
	 * @param ctx the parse tree
	 */
	void enterOrd_num(languageParser.Ord_numContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#ord_num}.
	 * @param ctx the parse tree
	 */
	void exitOrd_num(languageParser.Ord_numContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(languageParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(languageParser.NumberContext ctx);
	/**
	 * Enter a parse tree produced by {@link languageParser#name}.
	 * @param ctx the parse tree
	 */
	void enterName(languageParser.NameContext ctx);
	/**
	 * Exit a parse tree produced by {@link languageParser#name}.
	 * @param ctx the parse tree
	 */
	void exitName(languageParser.NameContext ctx);
}