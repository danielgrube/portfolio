// Generated from C:/Documents/COS382/Language_Recognition/src\language.g4 by ANTLR 4.6
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link languageParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface languageVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link languageParser#scripture}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitScripture(languageParser.ScriptureContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#book}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBook(languageParser.BookContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#reference}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReference(languageParser.ReferenceContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#text}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitText(languageParser.TextContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#chapter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitChapter(languageParser.ChapterContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#verses}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVerses(languageParser.VersesContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#length}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLength(languageParser.LengthContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#translation}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTranslation(languageParser.TranslationContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#ord_num}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOrd_num(languageParser.Ord_numContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#number}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNumber(languageParser.NumberContext ctx);
	/**
	 * Visit a parse tree produced by {@link languageParser#name}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitName(languageParser.NameContext ctx);
}