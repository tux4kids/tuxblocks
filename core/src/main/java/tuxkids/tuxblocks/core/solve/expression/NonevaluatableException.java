package tuxkids.tuxblocks.core.solve.expression;

public class NonevaluatableException extends Exception {
	private static final long serialVersionUID = 1L;

	public NonevaluatableException() {
		super("This expressioncontains a variable and is non-evaluatable");
	}
}